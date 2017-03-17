//
// Created by Tim Shull on 9/11/16.
// Copyright (c) 2016 ___FULLUSERNAME___. All rights reserved.
//

#import "Entry.h"


@implementation Entry

- (id)initWithKeyValueAndNext:(id)keyToUse newValue:(id)valueToUse nextEntry:(Node *)nextEntryToUse {
    self = [super init];
    if (self) {
        _key = [keyToUse copy];
        _value = [valueToUse copy];
        _next = nextEntryToUse;
    }
    return self;
}

@end