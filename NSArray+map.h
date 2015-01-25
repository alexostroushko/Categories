//
//  NSArray+map.h
//  OXID_Shop
//
//  Created by Alex Ostroushko on 3/15/11.
//  Copyright 2011 MobiDev. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef id(^MapFunction)(id item);
typedef BOOL(^ChooseFunction)(id item);
typedef void(^EnumFunction)(id item);
typedef BOOL(^UniqueFunction)(id first, id second);

@class CategoryDescription;
@interface NSArray(map)

+ (NSMutableArray*)arrayOfNullWithCapacity:(NSUInteger)capacity;
- (NSArray*)map:(MapFunction)block;
- (NSArray*)select:(ChooseFunction)block;
- (NSArray*)all:(EnumFunction)block;

- (NSArray*)unique;
- (NSArray*)uniqueByBlock:(UniqueFunction)block;

- (id) objectAtIndexPath:(NSIndexPath*)path;
- (NSArray*)stringsThatContainsString:(NSString*)string;
- (BOOL)containsString:(NSString*)string;
- (BOOL)containsOneOfStrings:(NSString*)string, ...;
- (BOOL)containsStrings:(NSString*)string, ...;

@end

