//
//  Wookie.m
//  Kapitel2
//
//  Created by David Brünner on 30.09.14.
//  Copyright (c) 2014 David Brünner. All rights reserved.
//

#import "Wookie.h"

@implementation Wookie

- (id)initWithName:(NSString *)inName {
    self = [super init];
    if (self) {
        [self setName:inName];
    }
    NSLog(@"[+] %@.%@", self, NSStringFromSelector(_cmd));
    return self;
}

- (void)sayName {
    NSLog(@"[+]    %@.%@: %@", self, NSStringFromSelector(_cmd), [self name]);
}
@end
