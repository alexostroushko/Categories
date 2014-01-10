//
//  NSString+Configurable.h
//  OXID_Shop
//
//  Created by Alex Ostroushko on 5/6/11.
//  Copyright 2011 MobiDev. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSString (Configurable)

- (BOOL)isValidEmail;
- (BOOL)isInteger;
- (BOOL)isNotEmpty; 
- (BOOL)isEndOfSentence;
- (BOOL)containsString:(NSString*)substring;
- (BOOL)containsOneOfStrings:(NSString*)string, ...;
- (BOOL)hasPrefixes:(NSString*)string, ...;
+ (NSString*)priceStringCorrection:(NSString*)string;
+ (NSString*)cutFirstSentenceFromString:(NSMutableString *)string;
+ (NSString*)cutLastSentenceFromString:(NSMutableString *)string;
+ (NSString*)cutLastWordFromString:(NSMutableString *)string;
+ (NSString*)notEmptyString:(NSString*)string;
+ (NSString*)stringNumberUnits:(int)value first:(NSString *)first second:(NSString *)second third:(NSString *)third;
+ (NSString*)stringUnits:(int)value first:(NSString *)first second:(NSString *)second third:(NSString *)third;
- (NSString*)stringByTrimmingSpaces;
- (NSMutableArray *)toCharArray;

@end