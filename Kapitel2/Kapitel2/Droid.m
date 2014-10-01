//
//  Droid.m
//  Kapitel2
//
//  Created by David Brünner on 29.09.14.
//  Copyright (c) 2014 David Brünner. All rights reserved.
//

#import "Droid.h"

@implementation Droid

@synthesize droidID;

- (instancetype)initWithID:(int)inID {
	self = [super init];
	if (self) {
		[self setDroidID:[NSString stringWithFormat:@"0xDEADBEEF%i", inID]];
	}
	NSLog(@"[+] %@.%@", self, NSStringFromSelector(_cmd));
	return self;
}

- (void)sayName {
	NSLog(@"[+]    %@.%@: %@", self, NSStringFromSelector(_cmd), [self droidID]);
}

@end
