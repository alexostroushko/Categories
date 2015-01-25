//
//  NSArray+map.m
//  OXID_Shop
//
//  Created by Alex Ostroushko on 3/15/11.
//  Copyright 2011 MobiDev. All rights reserved.
//

#import "NSArray+map.h"
#import "NSString+Configurable.h"

@implementation NSArray(map)

- (NSArray*)map:(MapFunction)block
{
	NSMutableArray* result = [NSMutableArray array];
	for (id element in self) 
	{
		id newElement = block(element);
		if (newElement != nil) [result addObject:newElement];
	}
	return [NSArray arrayWithArray:result];
}

- (NSArray*)select:(ChooseFunction)block
{
	NSMutableArray* result = [NSMutableArray array];
	for (id item in self) {
		if (block(item))
		{
			[result addObject:item];
		}
	}
	return result;
}

- (NSArray*)all:(EnumFunction)block
{
	for (id item in self) { block(item); }
	return self;
}

- (BOOL) containsObject:(id)target byBlock:(UniqueFunction)block
{
	for (id item in self) 
	{
		if (block(target,item))
		{
			return YES;
		}
	}
	return NO;
}

- (NSArray*)uniqueByBlock:(UniqueFunction)block
{
	NSMutableArray* result = [NSMutableArray array];
	for (id item in self) 
	{
		if (![result containsObject:item byBlock:block])
		{
			[result addObject:item];
		}
	}
	return result;
}

- (NSArray*) unique
{
	return [self uniqueByBlock:^BOOL(id first, id second) 
	{ 
		return [first isEqual:second];
	}];
}

- (id) objectAtIndexPath:(NSIndexPath*)path
{
	id result = self;
	for (int position=0; position < [path length]; position++) 
	{
		if ([result isKindOfClass:[NSArray class]])
		{
			result = [result objectAtIndex:[path indexAtPosition:position]];
		}
		else
		{
			[NSException raise:@"Path find not array" format:@"%@ is not array",result];
		}
	}
	return result;
}

+ (NSMutableArray *)arrayOfNullWithCapacity:(NSUInteger)capacity
{
    NSMutableArray* array = [NSMutableArray array];
    for (int i = 0; i < capacity; ++i)
    {
        [array addObject:[NSNull null]];
    }
    return array;
}

//- (NSMutableArray *)addNotDuplicatedOrdersFromArray:(NSArray *)newOrders
//{
//    NSMutableArray* result = [NSMutableArray array];
//	for (id item in newOrders)
//	{
//		if (![self containsObject:item
//                          byBlock:^BOOL(id first, id second)
//              {
//                  return [[(UBBankUserDM*)first ID] isEqualToNumber:[(UBBankUserDM*)second ID]];
//              }])
//		{
//			[result addObject:item];
//		}
//	}
//    
//    [result addObjectsFromArray:self];
//    
//	return result;
//}

- (NSArray *)stringsThatContainsString:(NSString *)string
{
    NSMutableArray* result = [NSMutableArray array];
    for (NSString* str in self)
    {
        if ([str isKindOfClass:[NSString class]] && [[str lowercaseString] containsString:[string lowercaseString]])
        {
            [result addObject:str];
        }
    }
    
    return result;
}

- (BOOL)containsString:(NSString *)string
{
    for (NSString* str in self)
    {
        if ([str isKindOfClass:[NSString class]] && [str containsString:string])
        {
            return YES;
        }
    }
    
    return NO;
}

- (BOOL)containsOneOfStrings:(NSString *)string, ...
{
	va_list args;
    va_start(args, string);
    
    for (; string != nil; string = va_arg(args, id))
    {
		if ([self containsString:string])
        {
            return YES;
        }
	}
    
    va_end(args);
    
	return NO;
}

- (BOOL)containsStrings:(NSString *)string, ...
{
	va_list args;
    va_start(args, string);
    
    for (; string != nil; string = va_arg(args, id))
    {
		if (![self containsString:string])
        {
            return NO;
        }
	}
    
    va_end(args);
    
	return YES;
}

@end
