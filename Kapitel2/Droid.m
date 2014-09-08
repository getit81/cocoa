//
//  Droid.m
//  Kapitel2
//
//  Created by David Brünner on 07.09.14.
//  Copyright (c) 2014 David Brünner. All rights reserved.
//

#import "Droid.h"

@implementation Droid
@synthesize droidID;

- (id)initWithID:(NSInteger)inID {
    self = [super init];
    if (self) {
        self.droidID = [NSString stringWithFormat:@"0xDEADBEEF%i", (int)inID];
    }
    NSLog(@"[+] %@.%@", self, NSStringFromSelector(_cmd));
    return self;
}

- (void)sayName {
    NSLog(@"[+] %@.%@: %@", self, NSStringFromSelector(_cmd), self.droidID);
}
@end
