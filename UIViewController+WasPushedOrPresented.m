//
//  UIViewController+WasPushedOrPresented.m
//  inTaxi
//
//  Created by Anton Chuev on 4/19/13.
//  Copyright (c) 2013 InRu. All rights reserved.
//

#import "UIViewController+WasPushedOrPresented.h"

@implementation UIViewController (WasPushedOrPresented)

- (BOOL)wasPresented
{
    return (self == [self.navigationController.viewControllers objectAtIndex:0]) ? YES : NO;
}

@end
