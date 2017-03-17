//
//  Person.m
//  ch8
//
//  Created by Timothy Shull on 7/27/15.
//  Copyright (c) 2015 Timothy Shull. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

@implementation Person

- (id)init {
    self = [super init]; if (self) {
        _expectedRaise = 0.05;
        _personName = @"New Person"; }
    return self;
}

- (void)setNilValueForKey:(NSString *)key {
    if ([key isEqual:@"expectedRaise"]) {
        [self setExpectedRaise:0.0];
    } else {
        [super setNilValueForKey:key];
    }
}
@end