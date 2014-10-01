//
//  Model.m
//  Kapitel2
//
//  Created by David Brünner on 28.09.14.
//  Copyright (c) 2014 David Brünner. All rights reserved.
//

#import "Model.h"
#import "Droid.h"
#import "ProtocolDroid.h"
#import "AstroDroid.h"
#import "Wookie.h"

@interface Model ()

@property (strong) NSMutableArray *objects;

@end


@implementation Model {
    @private
	NSMutableArray *objects;
}

@synthesize status;
@synthesize name;
@synthesize creation;
@synthesize objects;

- (instancetype)init {
	self = [super init];
	if (self) {
		self.creation = [NSDate date];
		self.objects = [[NSMutableArray alloc] init];
	}
	return self;
}

- (instancetype)initWithName:(NSString *)inName {
	self = [self init];
	if (self) {
		self.name = inName;
	}
	return self;
}

- (void)updateDroids:(int)inValue {
	if (inValue > [objects count]) {
		int theRemainder = inValue % 3;
		Droid *theDroid;

		if (theRemainder == 0) {
			theDroid = [[Droid alloc] initWithID:inValue];
		} else if (theRemainder == 1) {
			theDroid = [[ProtocolDroid alloc] initWithID:inValue];
		} else {
			theDroid = [[AstroDroid alloc] initWithID:inValue];
		}
		[objects addObject:theDroid];
	} else {
		[objects removeLastObject];
	}
}

- (int)countOfObjects {
	return (int) [objects count];
}

- (void)listDroids {
	Wookie *theWookiee = [[Wookie alloc] initWithName:@"Chewbacca"];

	[objects addObject:theWookiee];
	NSLog(@"[+] Current droids (%d): ", [self countOfObjects]);
	for (id anItem in objects) {
		[anItem sayName];
	}
}

@end
