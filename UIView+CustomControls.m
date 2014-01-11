//
//  UIView+CustomControls.m
//  OXID_Shop
//
//  Created by Alex Ostroushko on 2/24/12.
//  Copyright (c) 2012 MobiDev. All rights reserved.
//

#import "UIView+CustomControls.h"
#import <QuartzCore/QuartzCore.h>

#define ACTIVITY_VIEW_TAG 5678
#define ACTIVITY_INDICATOR_TAG 6789

@implementation UIView (CustomControls)

- (CGFloat)originX
{
    return self.frame.origin.x;
}

-(void)setOriginX:(CGFloat)x
{
    self.frame = CGRectMake(x, self.frame.origin.y, self.frame.size.width, self.frame.size.height);
}

- (CGFloat)originY
{
    return self.frame.origin.y;
}

-(void)setOriginY:(CGFloat)y
{
    self.frame = CGRectMake(self.frame.origin.x, y, self.frame.size.width, self.frame.size.height);
}

- (CGFloat)right
{
    return self.frame.origin.x + self.frame.size.width;
}

- (void)setRight:(CGFloat)right
{
    CGRect frame = self.frame;
    frame.origin.x = right - frame.size.width;
    self.frame = frame;
}

- (CGFloat)bottom
{
    return self.frame.origin.y + self.frame.size.height;
}

- (void)setBottom:(CGFloat)bottom
{
    CGRect frame = self.frame;
    frame.origin.y = bottom - frame.size.height;
    self.frame = frame;
}

- (CGFloat)width
{
    return self.frame.size.width;
}

-(void)setWidth:(CGFloat)width
{
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, width, self.frame.size.height);
}

- (CGFloat)height
{
    return self.frame.size.height;
}

-(void)setHeight:(CGFloat)height
{
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, height);
}

-(void)setSize:(CGSize)size
{
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, size.width, size.height);
}

-(void)setOrigin:(CGPoint)point
{
    self.frame = CGRectMake(point.x, point.y, self.frame.size.width, self.frame.size.height);
}

- (void)increaseX:(CGFloat)x
{
    CGRect frame = self.frame;
    frame.origin.x += x;
    self.frame = frame;
}

- (void)increaseY:(CGFloat)y
{
    CGRect frame = self.frame;
    frame.origin.y += y;
    self.frame = frame;
}

- (void)increaseWidth:(CGFloat)width
{
    CGRect frame = self.frame;
    frame.size.width += width;
    self.frame = frame;
}

- (void)increaseHeight:(CGFloat)height
{
    CGRect frame = self.frame;
    frame.size.height += height;
    self.frame = frame;
}

- (void)scrollsToX:(int)xPos animated:(BOOL)animated
{
    CGRect frame = self.frame;
    frame.origin.x = xPos;
    
    if (animated)
    {
        [UIView animateWithDuration:0.2 animations:^{
            [self setFrame:frame];
        }];
    }
    else
    {
        [self setFrame:frame];
    }
}

- (void)scrollsToY:(int)yPos animated:(BOOL)animated
{
    CGRect frame = self.frame;
    frame.origin.y = yPos;
    
    if (animated)
    {
        [UIView animateWithDuration:0.2 animations:^{
            [self setFrame:frame];
        }];
    }
    else
    {
        [self setFrame:frame];
    }
}

#pragma mark -

-(void)setRoundedCorners:(UIViewRoundedCornerMask)corners radius:(CGFloat)radius
{
    CGRect rect = self.bounds;
	CGFloat minx = CGRectGetMinX(rect);
	CGFloat midx = CGRectGetMidX(rect);
	CGFloat maxx = CGRectGetMaxX(rect);
	CGFloat miny = CGRectGetMinY(rect);
	CGFloat midy = CGRectGetMidY(rect);
	CGFloat maxy = CGRectGetMaxY(rect);
    
	CGMutablePathRef path = CGPathCreateMutable();
	CGPathMoveToPoint(path, nil, minx, midy);
	CGPathAddArcToPoint(path, nil, minx, miny, midx, miny, (corners & UIViewRoundedCornerUpperLeft) ? radius : 0);
	CGPathAddArcToPoint(path, nil, maxx, miny, maxx, midy, (corners & UIViewRoundedCornerUpperRight) ? radius : 0);
	CGPathAddArcToPoint(path, nil, maxx, maxy, midx, maxy, (corners & UIViewRoundedCornerLowerRight) ? radius : 0);
	CGPathAddArcToPoint(path, nil, minx, maxy, minx, midy, (corners & UIViewRoundedCornerLowerLeft) ? radius : 0);
	CGPathCloseSubpath(path);
    
	CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
	[maskLayer setPath:path];
	[[self layer] setMask:nil];
	[[self layer] setMask:maskLayer];
	CFRelease(path);
}

- (UIViewAutoresizing)fullAutoresizing
{
    return UIViewAutoresizingFlexibleTopMargin |
    UIViewAutoresizingFlexibleBottomMargin |
    UIViewAutoresizingFlexibleLeftMargin |
    UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
}

- (void)setFullAutoresizing
{
    self.autoresizingMask = [self fullAutoresizing];
}

- (void)setMarginAutoresizing
{
    self.autoresizingMask = UIViewAutoresizingFlexibleTopMargin |
    UIViewAutoresizingFlexibleBottomMargin |
    UIViewAutoresizingFlexibleLeftMargin |
    UIViewAutoresizingFlexibleRightMargin;
}

- (BOOL)findAndResignFirstResponder
{
    if (self.isFirstResponder) {
        [self resignFirstResponder];
        return YES;
    }
    for (UIView *subView in self.subviews) {
        if ([subView findAndResignFirstResponder])
            return YES;
    }
    return NO;
}

#pragma mark -

- (void)removeAllSubviews
{
    while (self.subviews.count)
    {
        UIView* child = self.subviews.lastObject;
        [child removeFromSuperview];
    }
}

- (UIView*)activityViewWithText:(NSString *)text
{
    UIView* activityView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 200, 105)];
    activityView.center = self.center;
    activityView.backgroundColor = [UIColor clearColor];
    activityView.userInteractionEnabled = NO;
    
    UIView* background = [[UIView alloc] initWithFrame:activityView.bounds];
    background.layer.cornerRadius = 10.0f;
    background.backgroundColor = [UIColor blackColor];
    background.alpha = 0.7;
    [background setMarginAutoresizing];
    [activityView addSubview:background];
    
    UILabel* messageLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 10, 160, 44)];
    messageLabel.numberOfLines = 2;
    messageLabel.backgroundColor = [UIColor clearColor];
    messageLabel.textColor = [UIColor whiteColor];
    messageLabel.textAlignment = NSTextAlignmentCenter;
    messageLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:18];
    messageLabel.text = text;
    [activityView addSubview:messageLabel];
    
    UIActivityIndicatorView* spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    spinner.center = CGPointMake(100, 75);
    [spinner startAnimating];
    [activityView addSubview:spinner];
    return activityView;
}

- (void)showActivityViewWithText:(NSString *)text andBackgroundColor:(UIColor*)bkgColor
{
    UIView* backgroundView = [[UIView alloc] initWithFrame:self.bounds];
    backgroundView.backgroundColor = bkgColor;
    backgroundView.tag = ACTIVITY_VIEW_TAG;
    backgroundView.alpha = 0.8f;
    [backgroundView setFullAutoresizing];
    backgroundView.userInteractionEnabled = YES;

    UIView* activityView = [self activityViewWithText:text];
    [backgroundView addSubview:activityView];

    [self addSubview:backgroundView];
}

- (void)showActivityViewWithBackgroundColor:(UIColor *)bkgColor
{
    [self showActivityViewWithText:NSLocalizedString(@"Please Wait…", nil)  andBackgroundColor:bkgColor];
}

- (void)hideActivityView
{
    [[self viewWithTag:ACTIVITY_VIEW_TAG] removeFromSuperview];
}

- (void)showInTaxiActivityIndicatorWithText:(NSString*)text andOriginY:(CGFloat)originY
{
    [self hideActivityIndicator];
    UIView* activityView = [self activityViewWithText:text];
    activityView.tag = ACTIVITY_INDICATOR_TAG;
    activityView.center = CGPointMake(activityView.center.x, originY);
    [self addSubview:activityView];
}

- (void)hideActivityIndicator
{
    [[self viewWithTag:ACTIVITY_INDICATOR_TAG] removeFromSuperview];
}

#pragma mark -

CGRect CGRectSwapOriginInRect(CGRect rect)
{
    CGFloat x = rect.origin.x;
    rect.origin.x = rect.origin.y;
    rect.origin.y = x;
    return rect;
}

CGRect CGRectSwapSizeInRect(CGRect rect)
{
    CGFloat width = rect.size.width;
    rect.size.width = rect.size.height;
    rect.size.height = width;
    return rect;
}

CGRect CGRectSwapRectValues(CGRect rect)
{
    rect = CGRectSwapOriginInRect(rect);
    return CGRectSwapSizeInRect(rect);
}

- (void)enableKeyboardSensitivity
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidShow:) name:UIKeyboardDidShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidHide:) name:UIKeyboardWillHideNotification object:nil];
}

- (void)disableKeyboardSensitivity
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillHideNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardDidShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardDidHideNotification object:nil];
}

- (void)keyboardWillShow:(NSNotification*)notification
{
    
}

- (void)keyboardWillHide:(NSNotification*)notification
{
    
}

- (void)keyboardDidShow:(NSNotification*)notification
{
    
}

- (void)keyboardDidHide:(NSNotification*)notification
{
    
}

@end
