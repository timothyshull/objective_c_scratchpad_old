//
//  Box.h
//  basic2
//
//  Created by Timothy Shull on 7/25/15.
//  Copyright (c) 2015 Timothy Shull. All rights reserved.
//
#import <Foundation/Foundation.h>

#ifndef basic2_Box_h
#define basic2_Box_h

@interface Box : NSObject
{
    double length;   // Length of a box
    double breadth;  // Breadth of a box
    double height;   // Height of a box
}
@property(nonatomic, readwrite) double height; // Property

-(double) volume;

@end

#endif