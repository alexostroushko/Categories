//
//  NSDictionary+Path.m
//  OXID_Shop
//
//  Created by Alex Ostroushko on 3/15/11.
//  Copyright 2011 MobiDev. All rights reserved.
//

#import "NSDictionary+Path.h"
#import "UIScreen+isRetina.h"
#import "Collection+UnNullable.h"

@implementation NSDictionary (Path)

-(id)objectForPath:(NSString*)path
{
	id value = self;
	for (NSString* element in [path componentsSeparatedByString:@"."])
	{
		if ([value isKindOfClass:[NSDictionary class]])
		{
			value = [(NSDictionary*)value objectForKey:element];
		}
		else if ([value isKindOfClass:[NSArray class]])
		{
			NSRange range = NSMakeRange(1, [element length]-2);
			NSString* indexString = [element substringWithRange:range];
			value = [(NSArray*)value objectAtIndex:[indexString intValue]];
		}
	}
	
	return value;
}

-(NSArray*) arrayForPath:(NSString*)path
{
	NSObject* object = [self objectForPath:path];
	if ([object isKindOfClass:[NSArray class]]) 
	{
		return (NSArray*)object;
	}
	else 
	{
		return [NSArray arrayWithObject:object];
	}
}


-(NSDictionary*)filter:(BOOL (^)(id))block
{
	NSMutableDictionary* result = [NSMutableDictionary dictionary];
	for (id key in self) {
		if (block(key)) [result setObject:[self objectForKey:key] forKey:key];
	}
	return [NSDictionary dictionaryWithDictionary:result];
}

-(NSDictionary*)filterWithKeys:(id)firstObj, ...
{	
	NSMutableDictionary* result = [NSMutableDictionary dictionary];
	
	va_list args;
    va_start(args, firstObj);
    for (id arg = firstObj; arg != nil; arg = va_arg(args, id))
    {
		if ([self objectForKey:arg] != nil) 
			[result setObject:[self objectForKey:arg] forKey:arg];
	}
	return [NSDictionary dictionaryWithDictionary:result];
}

-(NSDictionary*)replaceKey:(NSString*)oldKey withKey:(NSString*)key
{
	NSMutableDictionary* result = [NSMutableDictionary dictionaryWithDictionary:self];
	id object = [result objectForKey:oldKey];
	[result setObject:object forKey:key];
	[result removeObjectForKey:oldKey];
	

	return [NSDictionary dictionaryWithDictionary:result];
}

+ (NSDictionary*)removeValuesWithNull:(NSDictionary*)dict
{
    NSMutableDictionary* result = [NSMutableDictionary dictionaryWithDictionary:dict];
    for (NSString* key in [result allKeys])
    {
        if ([[result objectForKey:key] isKindOfClass:[NSNull class]])
        {
            [result removeObjectForKey:key]; 
        }
    }
    return [NSDictionary dictionaryWithDictionary:result];
}

-(id)chooseValueFrom3GKey:(NSString *)key3G and4GKey:(NSString *)key4G
{
    if ([UIScreen isRetina]) 
    {
        return [self objectForKey:key4G];
    }
    else 
    {
        return [self objectForKey:key3G];
    }
}

-(id)chooseValueFrom3GKey:(NSString *)key3G and4GKey:(NSString *)key4G and5GKey:(NSString *)key5G
{
    if ([UIScreen isRetina])
    {
        if ([UIScreen isPhone4inches])
        {
            return [self objectForKey:key5G];
        }
        else
        {
            return [self objectForKey:key4G];
        }
    }
    else
    {
        return [self objectForKey:key3G];
    }
}

- (NSArray*) objectsForKeys:(NSArray *)keys
{
	return [[self objectsForKeys:keys notFoundMarker:[NSNull null]] removeNulls];
}

- (id)objectForPossibleKeys:(id)key, ...
{
    id object = nil;
	
	va_list args;
    va_start(args, key);
    
    for (; key != nil; key = va_arg(args, id))
    {
		object = [self objectForKey:key];
        if (object) break;
	}
    
    va_end(args);
	return object;
}

@end

@implementation NSMutableDictionary(Ext)

- (void) setObject:(id)anObject forKeys:(NSArray*)aKeys
{
	for (id key in aKeys) {
		[self setObject:anObject forKeys:key];
	}
}

@end


