//
//  NSDictionary+Path.h
//  OXID_Shop
//
//  Created by Alex Ostroushko on 3/15/11.
//  Copyright 2011 MobiDev. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSDictionary (Path)

-(id)objectForPath:(NSString*)path;
-(NSArray*)arrayForPath:(NSString*)path;

-(NSDictionary*)filter:(BOOL (^)(id))block;
-(NSDictionary*)filterWithKeys:(id)firstObj, ... NS_REQUIRES_NIL_TERMINATION;
-(NSDictionary*)replaceKey:(NSString*)oldKey withKey:(NSString*)key;

+ (NSDictionary*)removeValuesWithNull:(NSDictionary*)dict;

- (id) chooseValueFrom3GKey:(NSString*)key3G and4GKey:(NSString*)key4G;
- (id) chooseValueFrom3GKey:(NSString*)key3G and4GKey:(NSString*)key4G and5GKey:(NSString*)key5G;

- (NSArray*) objectsForKeys:(NSArray *)keys;
- (id) objectForPossibleKeys:(id)key, ...;

@end

@interface NSMutableDictionary(Ext)

- (void) setObject:(id)anObject forKeys:(NSArray*)aKeys;

@end