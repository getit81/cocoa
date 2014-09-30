//
//  AstroDroid.m
//  Kapitel2
//
//  Created by David Brünner on 30.09.14.
//  Copyright (c) 2014 David Brünner. All rights reserved.
//

#import "AstroDroid.h"

@implementation AstroDroid

- (instancetype)initWithID:(int)inID {
    self = [super init];
    if (self) {
        [self setDroidID:[NSString stringWithFormat:@"0xBEEFCAFE%i", inID]];
    }
    NSLog(@"[+] %@.%@", self, NSStringFromSelector(_cmd));
    return self;
}

- (void)sayName {
    NSLog(@"[*]    %@.%@: %@", self, NSStringFromSelector(_cmd), [self droidID]);
}

@end
