//
// Created by Tim Shull on 9/11/16.
// Copyright (c) 2016 ___FULLUSERNAME___. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Entry.h"

@interface Node : NSObject

@property NSUInteger m;
@property NSMutableArray *children;

- (id)initWithNumberOfChildren:(NSUInteger)numberOfChildren;

@end