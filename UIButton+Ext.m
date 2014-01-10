//
//  UIButton+Ext.m
//  OXID_Shop
//
//  Created by Alex Ostroushko on 18.04.12.
//  Copyright (c) 2012 Alex Ostroushko. All rights reserved.
//

#import "UIButton+Ext.h"

@implementation UIButton (Ext)

- (void)setTitle:(NSString *)title
{
    if (title)
    {
        NSString* newTitle = NSLocalizedString(title, nil);
        [self setTitle:newTitle forState:UIControlStateNormal];
        [self setTitle:newTitle forState:UIControlStateHighlighted];
        [self setTitle:newTitle forState:UIControlStateSelected];
        [self setTitle:newTitle forState:UIControlStateDisabled];
    }
}

- (void)setImage:(UIImage *)image
{
    [self setImage:image forState:UIControlStateNormal];
    [self setImage:image forState:UIControlStateHighlighted];
    [self setImage:image forState:UIControlStateSelected];
    [self setImage:image forState:UIControlStateDisabled];
}

- (void)setBackgroundImage:(UIImage *)image
{
    if (image)
    {
        [self setBackgroundImage:image forState:UIControlStateNormal];
        [self setBackgroundImage:image forState:UIControlStateHighlighted];
        [self setBackgroundImage:image forState:UIControlStateSelected];
        [self setBackgroundImage:image forState:UIControlStateDisabled];
    }
}

-(void)setTitleColor:(UIColor *)color
{
    [self setTitleColor:color forState:UIControlStateNormal];
    [self setTitleColor:color forState:UIControlStateHighlighted];
    [self setTitleColor:color forState:UIControlStateSelected];
    [self setTitleColor:color forState:UIControlStateDisabled];
}

@end
