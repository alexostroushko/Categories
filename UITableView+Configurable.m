//
//  UITableView+Configurable.m
//  inTaxi
//
//  Created by Alex Ostroushko on 09.06.13.
//  Copyright (c) 2013 InRu. All rights reserved.
//

#import "UITableView+Configurable.h"

@implementation UITableView (Configurable)

-(void)hideEmptySeparators
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectZero];
    view.backgroundColor = [UIColor clearColor];
    [self setTableFooterView:view];
}

@end
