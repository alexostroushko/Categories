//
//  UIViewController+Call.m
//  inTaxi
//
//  Created by Alex Ostroushko on 24/10/13.
//  Copyright (c) 2013 inTaxi. All rights reserved.
//

#import "UIViewController+Call.h"
#import "OXBlockAlertView.h"

@implementation UIViewController (Call)

- (void)callTo:(NSString*)numberForCall andFormattedNumber:(NSString*)formattedNumber withCallBlock:(void (^)(void))callBlock andUnsupportedCallBlock:(void (^)(void))unsuportedCallBlock
{
    UIDevice *device = [UIDevice currentDevice];
    if ([[device model] isEqualToString:@"iPhone"] )
    {
        OXBlockAlertView *alert = [[OXBlockAlertView alloc] initWithTitle:formattedNumber
                                                                  message:@""
                                                                 delegate:self
                                                        cancelButtonTitle:InruLoc(@"BTN_CANCEL")
                                                        otherButtonTitles:InruLoc(@"STR_MAKE_A_CALL"), nil];
        [alert showWithSelectionBlock:^(NSUInteger index, NSString *title)
         {
             if (index != alert.cancelButtonIndex)
             {
                 if (callBlock)
                 {
                     callBlock();
                 }
                 NSString *driverNumber = [NSString stringWithFormat:@"tel:%@", numberForCall];
                 [[UIApplication sharedApplication] openURL:[NSURL URLWithString:driverNumber]];
             }
         }];
    }
    else
    {
        if (unsuportedCallBlock)
        {
            unsuportedCallBlock();
        }
    }
}

@end
