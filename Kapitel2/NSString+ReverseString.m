//
//  NSString+ReverseString.m
//  Kapitel2
//
//  Created by David Brünner on 07.09.14.
//  Copyright (c) 2014 David Brünner. All rights reserved.
//

#import "NSString+ReverseString.h"

@implementation NSString (ReverseString)

- (NSString *)reversedString {
    int theLength = [self length];
    NSMutableString *theReverse = [[NSMutableString alloc] init];
    
    for (int i = theLength - 1; i >= 0; i--) {
        [theReverse appendFormat:@"%C", [self characterAtIndex:i]];
    }
    return theReverse;
}
@end
