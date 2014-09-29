//
//  Droid.h
//  Kapitel2
//
//  Created by David Brünner on 29.09.14.
//  Copyright (c) 2014 David Brünner. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Droid : NSObject

@property (copy) NSString *droidID;

- (id)initWithID:(int)inID;

@end
