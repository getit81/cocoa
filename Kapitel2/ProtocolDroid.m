//
//  ProtocolDroid.m
//  Kapitel2
//
//  Created by David Brünner on 07.09.14.
//  Copyright (c) 2014 David Brünner. All rights reserved.
//

#import "ProtocolDroid.h"
#import "NSString+ReverseString.h"

@implementation ProtocolDroid

- (NSString *)droidID {
    return [[super droidID] reversedString];
}

@end
