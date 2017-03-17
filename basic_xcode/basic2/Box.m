//
//  Box.m
//  basic2
//
//  Created by Timothy Shull on 7/25/15.
//  Copyright (c) 2015 Timothy Shull. All rights reserved.
//

#import "Box.h"

@implementation Box

@synthesize height;

-(id)init
{
    self = [super init];
    length = 1.0;
    breadth = 1.0;
    return self;
}

-(double) volume
{
    return length * breadth * height;
}

@end
