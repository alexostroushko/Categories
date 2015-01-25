//
//  NSObject+Configurable.h
//  MedicalApps
//
//  Created by Alex Ostroushko on 23.11.14.
//  Copyright (c) 2014 Alex Ostroushko. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Configurable)

+ (id) loadFromBundleWithName:(NSString*)name;

- (void)callTo:(NSString*)numberForCall;
- (void)callTo:(NSString*)numberForCall withCustomMessage:(NSString*)message;

@end
