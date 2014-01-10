//
//  NSObject+Localization.m
//  GIS4Mobile
//
//  Created by Alex Ostroushko on 8/19/11.
//  Copyright 2011 Alex Ostroushko. All rights reserved.
//

#import "NSObject+Localization.h"

@implementation NSObject (NSObject_Localization)

- (void)translateButton:(UIButton *)button
{
	[button setTitle:InruLoc([button titleForState:UIControlStateNormal])
			forState:UIControlStateNormal];
	[button setTitle:InruLoc([button titleForState:UIControlStateHighlighted]) 
			forState:UIControlStateHighlighted];
	[button setTitle:InruLoc([button titleForState:UIControlStateSelected])
			forState:UIControlStateSelected];
	[button setTitle:InruLoc([button titleForState:UIControlStateDisabled]) 
			forState:UIControlStateDisabled];
}

- (void)translateLabel:(UILabel *) label
{
	[label setText:InruLoc([label text])];
}

- (void)translateTextField:(UITextField *)field
{
	[field setPlaceholder:InruLoc([field placeholder])];
	[field setText:InruLoc([field text])];
}

- (void)translateTextView:(UITextView *)textView
{
	[textView setText:InruLoc([textView text])];
}

- (void)translateBarItem:(UIBarItem *)barItem
{
	[barItem setTitle:InruLoc([barItem title])];
}

- (void)translateBarButtonItem:(UIBarButtonItem *)barItem
{
	[barItem setTitle:InruLoc([barItem title])];
}

- (void)translateNavigationItem:(UINavigationItem *)navigationItem
{
	[navigationItem setTitle:InruLoc([navigationItem title])];
}

- (void)translateSegmentedControl:(UISegmentedControl *)segmentedControl
{
    for (int i = 0; i < segmentedControl.numberOfSegments; i++) 
    {
        if ([segmentedControl titleForSegmentAtIndex:i])
        {            
            [segmentedControl setTitle:InruLoc([segmentedControl titleForSegmentAtIndex:i]) 
                     forSegmentAtIndex:i];
        }
    }
}

- (void)translate:(NSObject *)object
{
	id idView = object;
	
	if ([idView isKindOfClass:[UIButton class]]) [self translateButton:idView];
	if ([idView isKindOfClass:[UIBarItem class]]) [self translateBarItem:idView];
    if ([idView isKindOfClass:[UIBarButtonItem class]]) [self translateBarButtonItem:idView];
    if ([idView isKindOfClass:[UINavigationItem class]]) [self translateNavigationItem:idView];
	if ([idView isKindOfClass:[UILabel class]]) [self translateLabel:idView];
	if ([idView isKindOfClass:[UITextField class]]) [self translateTextField:idView];
	if ([idView isKindOfClass:[UITextView class]]) [self translateTextView:idView];
    if ([idView isKindOfClass:[UISegmentedControl class]]) [self translateSegmentedControl:idView];
}

- (void)awakeFromNib
{
	[self translate:self];
}

@end
