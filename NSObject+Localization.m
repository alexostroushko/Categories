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
	[button setTitle:NSLocalizedString([button titleForState:UIControlStateNormal], nil)
			forState:UIControlStateNormal];
	[button setTitle:NSLocalizedString([button titleForState:UIControlStateHighlighted], nil) 
			forState:UIControlStateHighlighted];
	[button setTitle:NSLocalizedString([button titleForState:UIControlStateSelected], nil)
			forState:UIControlStateSelected];
	[button setTitle:NSLocalizedString([button titleForState:UIControlStateDisabled], nil) 
			forState:UIControlStateDisabled];
}

- (void)translateLabel:(UILabel *) label
{
	[label setText:NSLocalizedString([label text], nil)];
}

- (void)translateTextField:(UITextField *)field
{
	[field setPlaceholder:NSLocalizedString([field placeholder], nil)];
	[field setText:NSLocalizedString([field text], nil)];
}

- (void)translateTextView:(UITextView *)textView
{
	[textView setText:NSLocalizedString([textView text], nil)];
}

- (void)translateBarItem:(UIBarItem *)barItem
{
	[barItem setTitle:NSLocalizedString([barItem title], nil)];
}

- (void)translateBarButtonItem:(UIBarButtonItem *)barItem
{
	[barItem setTitle:NSLocalizedString([barItem title], nil)];
}

- (void)translateNavigationItem:(UINavigationItem *)navigationItem
{
	[navigationItem setTitle:NSLocalizedString([navigationItem title], nil)];
}

- (void)translateSegmentedControl:(UISegmentedControl *)segmentedControl
{
    for (int i = 0; i < segmentedControl.numberOfSegments; i++) 
    {
        if ([segmentedControl titleForSegmentAtIndex:i])
        {            
            [segmentedControl setTitle:NSLocalizedString([segmentedControl titleForSegmentAtIndex:i], nil) 
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
