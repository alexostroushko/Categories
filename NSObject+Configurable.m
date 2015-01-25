//
//  NSObject+Configurable.m
//  MedicalApps
//
//  Created by Alex Ostroushko on 23.11.14.
//  Copyright (c) 2014 Alex Ostroushko. All rights reserved.
//

#import "NSObject+Configurable.h"
#import <CoreTelephony/CTCarrier.h>
#import <CoreTelephony/CTTelephonyNetworkInfo.h>

@implementation NSObject (Configurable)

+ (id) loadFromBundleWithName:(NSString*)name
{
    NSString *filePath = [[NSBundle mainBundle] pathForResource:name ofType:@"txt"];
    NSData* fileData = [NSData dataWithContentsOfFile:filePath];
    if (fileData)
    {
        return [NSJSONSerialization JSONObjectWithData:fileData options:0 error:nil];
    }
    return nil;
}

- (void)callTo:(NSString*)numberForCall
{
    [self callTo:numberForCall withCustomMessage:nil];
}

- (void)callTo:(NSString *)numberForCall withCustomMessage:(NSString *)message
{
    NSString* title = [message isNotEmpty] ? message : numberForCall;
    
    UIDevice *device = [UIDevice currentDevice];
    if ([self isSIMAvailable] && [[device model] isEqualToString:@"iPhone"])
    {
        MAAlertView* alert = [[MAAlertView alloc] initWithTitle:title
                                                        message:nil
                                                       delegate:nil
                                              cancelButtonTitle:@"Отменить"
                                              otherButtonTitles:@"Позвонить", nil];
        [alert showWithSelectionBlock:^(NSUInteger index, NSString *title)
         {
             if (index != alert.cancelButtonIndex)
             {
                 NSString *url = [NSString stringWithFormat:@"tel:%@", [NSString allDigitsFromString:numberForCall]];
                 [[UIApplication sharedApplication] openURL:[NSURL URLWithString:url]];
             }
         }];
    }
    else
    {
        MAAlertView* alert = [[MAAlertView alloc] initWithTitle:numberForCall
                                                        message:@"С данного устройства нельзя совершать звонки"
                                                       delegate:nil
                                              cancelButtonTitle:@"Отменить"
                                              otherButtonTitles:@"Скопировать в буфер", nil];
        [alert showWithSelectionBlock:^(NSUInteger index, NSString *title)
         {
             if (index != alert.cancelButtonIndex)
             {
                 UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
                 [pasteboard setString:numberForCall];
             }
         }];
    }
}

- (BOOL)isSIMAvailable
{
    //http://stackoverflow.com/a/24367325
    CTTelephonyNetworkInfo* info = [[CTTelephonyNetworkInfo alloc] init];
    CTCarrier* carrier = info.subscriberCellularProvider;
    return [[carrier mobileNetworkCode] isNotEmpty];
}

@end
