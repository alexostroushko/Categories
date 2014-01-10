//
//  UIView+CustomControls.h
//  OXID_Shop
//
//  Created by Alex Ostroushko on 2/24/12.
//  Copyright (c) 2012 MobiDev. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    UIViewRoundedCornerNone = 0,
    UIViewRoundedCornerUpperLeft = 1 << 0,
    UIViewRoundedCornerUpperRight = 1 << 1,
    UIViewRoundedCornerLowerLeft = 1 << 2,
    UIViewRoundedCornerLowerRight = 1 << 3,
    UIViewRoundedCornerAll = (1 << 4) - 1,
} UIViewRoundedCornerMask;

@interface UIView (CustomControls)

- (void)showActivityViewWithText:(NSString *)text andBackgroundColor:(UIColor*)bkgColor;
- (void)showActivityViewWithBackgroundColor:(UIColor*)bkgColor;
- (void)showInTaxiActivityView;
- (void)showInTaxiActivityViewWithYOffset:(float)offset;
- (void)showInTaxiActivityViewWithYOffset:(float)offset andBackgroundColor:(UIColor*)color;
- (void)hideActivityView;

- (void)showInTaxiActivityIndicatorWithText:(NSString*)text andOriginY:(CGFloat)originY;
- (void)hideActivityIndicator;

- (BOOL)findAndResignFirstResponder;

- (void)scrollsToX:(int)xPos animated:(BOOL)animated;
- (void)scrollsToY:(int)yPos animated:(BOOL)animated;

- (void)setRoundedCorners:(UIViewRoundedCornerMask)corners radius:(CGFloat)radius;

- (UIViewAutoresizing)fullAutoresizing;
- (void)setFullAutoresizing;
- (void)setMarginAutoresizing;

- (void)setOriginX:(CGFloat)x;
- (void)setOriginY:(CGFloat)y;
- (void)setWidth:(CGFloat)width;
- (void)setHeight:(CGFloat)height;
- (void)setSize:(CGSize)size;
- (void)setOrigin:(CGPoint)point;

- (void)increaseX:(CGFloat)x;
- (void)increaseY:(CGFloat)y;
- (void)increaseWidth:(CGFloat)width;
- (void)increaseHeight:(CGFloat)height;

CGRect CGRectSwapOriginInRect(CGRect rect);
CGRect CGRectSwapSizeInRect(CGRect rect);
CGRect CGRectSwapRectValues(CGRect rect);

- (void)enableKeyboardSensitivity;
- (void)disableKeyboardSensitivity;
- (void)keyboardWillShow:(NSNotification*)notification;
- (void)keyboardWillHide:(NSNotification*)notification;
- (void)keyboardDidShow:(NSNotification*)notification;
- (void)keyboardDidHide:(NSNotification*)notification;

@end
