//
//  Model.h
//  Kapitel2
//
//  Created by David Brünner on 28.09.14.
//  Copyright (c) 2014 David Brünner. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Model : NSObject

@property(copy) NSString *status;
@property(strong) NSDate *creation;
@property(copy) NSString *name;

- (instancetype)initWithName:(NSString *)inName;
- (void)updateDroids:(int)inValue;
- (int)countOfObjects;
- (void)listDroids;

@end
