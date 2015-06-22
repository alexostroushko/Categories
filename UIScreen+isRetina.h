//
//  UIScreen+isRetina.h
//  OXID_Shop
//
//  Created by Alex Ostroushko on 5/13/11.
//  Copyright 2011 MobiDev. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface UIScreen(isRetina)

#define SCREEN_WIDTH ([[UIScreen mainScreen] bounds].size.width)
#define SCREEN_HEIGHT ([[UIScreen mainScreen] bounds].size.height)

#define IS_IPHONE_4_OR_LESS (IS_IPHONE && SCREEN_MAX_LENGTH < 568.0)
#define IS_IPHONE_5 (IS_IPHONE && SCREEN_MAX_LENGTH == 568.0)
#define IS_IPHONE_6 (IS_IPHONE && SCREEN_MAX_LENGTH == 667.0)
#define IS_IPHONE_6PLUS (IS_IPHONE && SCREEN_MAX_LENGTH == 736.0)

+ (BOOL)isRetina;
+ (BOOL)isPhone35inches;
+ (BOOL)isPhone4inches;
+ (BOOL)isPhoneBigger4inches;

@end
