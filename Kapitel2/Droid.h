//
//  Droid.h
//  Kapitel2
//
//  Created by David Brünner on 07.09.14.
//  Copyright (c) 2014 David Brünner. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ProtocolDroid;

@interface Droid : NSObject
@property (copy) NSString *droidID;
@property (weak) ProtocolDroid *protocolDroid;

- (id)initWithID:(NSInteger)inID;
- (void)sayName;
@end
