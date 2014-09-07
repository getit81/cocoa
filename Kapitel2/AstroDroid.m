//
//  AstroDroid.m
//  Kapitel2
//
//  Created by David Brünner on 07.09.14.
//  Copyright (c) 2014 David Brünner. All rights reserved.
//

#import "AstroDroid.h"

@implementation AstroDroid

- (instancetype)initWithID:(NSInteger)inID {
    self = [super init];
    if (self) {
        self.droidID = [NSString stringWithFormat:@"0xBEEFCAFE%i", inID];
    }
    NSLog(@"[+] %@.%@", self, NSStringFromSelector(_cmd));
    return self;
}

- (void)sayName {
    NSLog(@"[*] %@.%@: %@", self, NSStringFromSelector(_cmd), self.droidID);
}
@end
