//
//  UIViewController+Call.h
//  inTaxi
//
//  Created by Alex Ostroushko on 24/10/13.
//  Copyright (c) 2013 inTaxi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (Call)

- (void)callTo:(NSString*)numberForCall
andFormattedNumber:(NSString*)formattedNumber
 withCallBlock:(void (^) (void))callBlock
andUnsupportedCallBlock:(void (^) (void))unsuportedCallBlock;

@end
