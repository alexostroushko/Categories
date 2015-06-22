//
//  UIScreen+isRetina.m
//  OXID_Shop
//
//  Created by Alex Ostroushko on 5/13/11.
//  Copyright 2011 MobiDev. All rights reserved.
//

#import "UIScreen+isRetina.h"


@implementation UIScreen(isRetina)

+(BOOL)isRetina
{
    return ([[UIScreen mainScreen] respondsToSelector:@selector(scale)] && [[UIScreen mainScreen] scale] == 2);
}

+ (BOOL)isPhone35inches
{
    return ([UIScreen mainScreen].bounds.size.height == 480);
}

+(BOOL)isPhone4inches
{
    return ([UIScreen mainScreen].bounds.size.height == 568);
}

+(BOOL)isPhoneBigger4inches
{
    return ([UIScreen mainScreen].bounds.size.height > 568);
}

@end
