//
//  Wookie.h
//  Kapitel2
//
//  Created by David Brünner on 07.09.14.
//  Copyright (c) 2014 David Brünner. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Wookie : NSObject
@property (copy) NSString *name;

- (id)initWithName:(NSString *)inName;
- (void)sayName;
@end
