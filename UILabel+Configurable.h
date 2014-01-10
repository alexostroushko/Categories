//
//  UILabel+ConfigurableViewController.h
//  inTaxi
//
//  Created by Anton Chuev on 2/21/13.
//  Copyright (c) 2013 InRu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel(Configurable)

- (void)optimizeSizeWithAlligment;
- (CGFloat)optimumHeight;
- (CGFloat)optimumWidth;
- (void)optimizeWidth;
- (void)optimizeHeight;

- (void)updatePositionWithMainLabel:(UILabel*)mainLabel;

@end
