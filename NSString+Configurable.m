//
//  NSString+Configurable.m
//  OXID_Shop
//
//  Created by Alex Ostroushko on 5/6/11.
//  Copyright 2011 MobiDev. All rights reserved.
//

#import "NSString+Configurable.h"

@implementation NSString (Configurable)

- (BOOL)isValidEmail
{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:self];
}

-(BOOL)isNotEmpty
{
    if (self == nil)
        return NO;
    if ([self isEqualToString:@""])
        return NO;
        
    NSString* string = [self stringByReplacingOccurrencesOfString:@" " withString:@""];
    string = [string stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    if ([string isEqualToString:@""])
        return NO;
        
    return YES;
}

+ (NSString *)notEmptyString:(NSString *)string
{
    return ([string isNotEmpty]) ? string : @"";
}

+ (NSString*)priceStringCorrection:(NSString*)string
{
    string = [string stringByReplacingOccurrencesOfString:@"." withString:@""];
    string = [string stringByReplacingOccurrencesOfString:@"," withString:@"."];
    return string;
}

- (BOOL)containsString:(NSString*)substring
{    
    NSRange range = [self rangeOfString : substring];
    
    BOOL found = (range.location != NSNotFound);
    
    return found;
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

-(BOOL)hasPrefixes:(NSString *)string, ...
{
    va_list args;
    va_start(args, string);
    
    for (; string != nil; string = va_arg(args, id))
    {
		if ([self hasPrefix:string])
        {
            return YES;
        }
	}
    
    va_end(args);
    
	return NO;
}

- (BOOL)isEndOfSentence
{
	if([self isEqualToString:@"."] 
	   || [self isEqualToString:@"!"] 
	   || [self isEqualToString:@"?"]
	   || [self isEqualToString:@"\n"])
	{
		return YES;
	}
	else
	{
		return NO;
	}
}

+ (NSString *)cutFirstSentenceFromString:(NSMutableString *)string
{
    if([string isNotEmpty])
    {
        NSInteger cutIndex;
        
        for(cutIndex = 0; cutIndex < [string length] - 1; cutIndex++)
        {
            NSString *currChar = [string substringWithRange:NSMakeRange(cutIndex, 1)];
            if([currChar isEndOfSentence])
            {
                break;
            }
        }
        
        NSRange cutRange = NSMakeRange(0, cutIndex + 1);
        NSString *firstSentence = [string substringWithRange:cutRange];
        [string deleteCharactersInRange:cutRange];
        
        return firstSentence;
    }
    else
        return @"";
}

+ (NSString *)cutLastSentenceFromString:(NSMutableString *)string
{
	NSInteger cutIndex;
	
	for(cutIndex = [string length] - 2; cutIndex >= 0; cutIndex--)
	{
		NSString *currChar = [string substringWithRange:NSMakeRange(cutIndex, 1)];
		if([currChar isEndOfSentence])
		{
			cutIndex++;
			break;
		}
	}
	
    NSString *lastSentence = @"";
    if (cutIndex < [string length]) 
    {        
        NSRange cutRange = NSMakeRange(cutIndex, [string length] - cutIndex);
        lastSentence = [string substringWithRange:cutRange];
        [string deleteCharactersInRange:cutRange];
    }
	
	return lastSentence;
}

+ (NSString *)cutLastWordFromString:(NSMutableString *)string
{
	NSInteger cutIndex;
	
	for(cutIndex = [string length] - 1; cutIndex >= 0; cutIndex--)
	{
		NSString *currChar = [string substringWithRange:NSMakeRange(cutIndex, 1)];
		if([currChar isEqualToString:@" "])
		{
			break;
		}
	}
	
	NSRange cutRange = NSMakeRange(cutIndex, [string length] - cutIndex);
	NSString *lastWord = [string substringWithRange:cutRange];
	[string deleteCharactersInRange:cutRange];
	
	return lastWord;
}

- (NSString*)stringByTrimmingSpaces
{
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

/*
 * first = символ , second = символа, third = символов
 */

+(NSString *)stringUnits:(int)value first:(NSString *)first second:(NSString *)second third:(NSString *)third
{
    /* исключение из правила */
    if ((value > 10 && value <= 20))
        return third;
    
    uint8_t lastDigit = value % 10;
    if (lastDigit == 1)
        return first;
    else if (lastDigit >= 2 && lastDigit <= 4)
        return second;
    
    return third;
}

+(NSString *)stringNumberUnits:(int)value first:(NSString *)first second:(NSString *)second third:(NSString *)third
{    
    return [NSString stringWithFormat:@"%d %@", value, [NSString stringUnits:value first:first second:second third:third]];
}

- (BOOL)isInteger
{
    NSCharacterSet* nonNumbers = [[NSCharacterSet decimalDigitCharacterSet] invertedSet];
    NSRange range = [self rangeOfCharacterFromSet: nonNumbers];
    return range.location == NSNotFound;
}

- (NSMutableArray *) toCharArray
{
	NSMutableArray *characters = [[NSMutableArray alloc] initWithCapacity:[self length]];
	for (int i=0; i < [self length]; i++)
    {
		NSString *ichar  = [NSString stringWithFormat:@"%c", [self characterAtIndex:i]];
		[characters addObject:ichar];
	}
    
	return characters;
}

@end
