//
// Created by Tim Shull on 9/11/16.
// Copyright (c) 2016 ___FULLUSERNAME___. All rights reserved.
//

#import "Node.h"


@implementation Node

- (id)initWithNumberOfChildren:(NSUInteger)numberOfChildren {
    self = [super init];
    if (self) {
        _m = numberOfChildren;
        _children = [NSMutableArray arrayWithCapacity:numberOfChildren];
    }
    return self;
}

@end