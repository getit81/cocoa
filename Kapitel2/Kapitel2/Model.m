//
//  Model.m
//  Kapitel2
//
//  Created by David Brünner on 28.09.14.
//  Copyright (c) 2014 David Brünner. All rights reserved.
//

#import "Model.h"
#import "Droid.h"

@implementation Model {
    @private
    NSMutableArray *objects;
}

@synthesize status;
@synthesize name;
@synthesize creation;

- (instancetype)init {
    self = [super init];
    if (self) {
        self.creation = [NSDate date];
        objects = [[NSMutableArray alloc] init];
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
        Droid *theDroid;
        theDroid = [[Droid alloc] initWithID:inValue];
        [objects addObject:theDroid];
    } else {
        [objects removeLastObject];
    }
}

- (int)countOfObjects {
    return (int)[objects count];
}

@end
