//
//  UILabel+ConfigurableViewController.m
//  inTaxi
//
//  Created by Anton Chuev on 2/21/13.
//  Copyright (c) 2013 InRu. All rights reserved.
//

#import "UILabel+Configurable.h"
#import "UIView+CustomControls.h"

@implementation UILabel(Configurable)

- (void)optimizeWidth
{
    CGSize stringSize = [self.text sizeWithFont:self.font
                              constrainedToSize:CGSizeMake(self.frame.size.width, self.frame.size.height)];
    
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, stringSize.width, stringSize.height);
}

- (void)optimizeHeight
{
    CGSize stringSize = [self.text sizeWithFont:self.font
                              constrainedToSize:CGSizeMake(self.frame.size.width, self.frame.size.height * 50)];
    
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, stringSize.height);
}

- (void)optimizeSizeWithLeftAlligment
{
    CGSize stringSize = [self.text sizeWithFont:self.font
                              constrainedToSize:CGSizeMake(self.frame.size.width, self.frame.size.height)];
    
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, stringSize.width, stringSize.height);
}

- (void)optimizeSizeWithRightAlligment
{
    CGSize stringSize = [self.text sizeWithFont:self.font
                              constrainedToSize:CGSizeMake(self.frame.size.width, self.frame.size.height * 50)];
    
    self.frame = CGRectMake(self.frame.origin.x + (self.frame.size.width - stringSize.width), self.frame.origin.y, stringSize.width, stringSize.height);
}

- (void)optimizeSizeWithCenterAlligment
{
    CGSize stringSize = [self.text sizeWithFont:self.font
                              constrainedToSize:CGSizeMake(self.frame.size.width, self.frame.size.height * 50)];
    
    self.frame = CGRectMake(self.frame.origin.x + (self.frame.size.width - stringSize.width)/2, self.frame.origin.y, stringSize.width, stringSize.height);
}

-(void)optimizeSizeWithAlligment
{
    switch (self.textAlignment)
    {
        case NSTextAlignmentRight:
            [self optimizeSizeWithRightAlligment];
            break;
        case NSTextAlignmentLeft:
            [self optimizeSizeWithLeftAlligment];
            break;
        case NSTextAlignmentCenter:
            [self optimizeSizeWithCenterAlligment];
            break;
        default:
            break;
            
    }
}

-(CGFloat)optimumHeight
{
    CGSize stringSize = [self.text sizeWithFont:self.font
                              constrainedToSize:CGSizeMake(self.frame.size.width, self.frame.size.height * 50)];
    return stringSize.height;
}

-(CGFloat)optimumWidth
{
    CGSize stringSize = [self.text sizeWithFont:self.font
                              constrainedToSize:CGSizeMake(self.frame.size.width * 50, self.frame.size.height)];
    return stringSize.width;
}

- (void)updatePositionWithMainLabel:(UILabel*)mainLabel
{
    CGSize stringSize = [mainLabel.text sizeWithFont:mainLabel.font
                                   constrainedToSize:CGSizeMake(mainLabel.frame.size.width, 50)];
    [self setOriginX:stringSize.width + mainLabel.frame.origin.x + 2];
}

@end
