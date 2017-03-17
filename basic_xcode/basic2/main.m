//
//  main.m
//  basic2
//
//  Created by Timothy Shull on 7/25/15.
//  Copyright (c) 2015 Timothy Shull. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Box.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Box *box1 = [[Box alloc]init];
        
        Box *box2 = [[Box alloc]init];
        
        double volume = 0.0;
        
        box1.height = 5.0;
        
        box2.height = 10.0;

        volume = [box1 volume];
        NSLog(@"Volume of Box1 : %f", volume);

        volume = [box2 volume];
        NSLog(@"Volume of Box2 : %f", volume);
    }
    return 0;
}

//int main( )
//{
//    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
//    Box *box1 = [[Box alloc]init];    // Create box1 object of type Box
//    Box *box2 = [[Box alloc]init];    // Create box2 object of type Box
//    
//    double volume = 0.0;     // Store the volume of a box here
//    
//    // box 1 specification
//    box1.height = 5.0;
//    
//    // box 2 specification
//    box2.height = 10.0;
//    
//    // volume of box 1
//    volume = [box1 volume];
//    NSLog(@"Volume of Box1 : %f", volume);
//    // volume of box 2
//    volume = [box2 volume];
//    NSLog(@"Volume of Box2 : %f", volume);
//    [pool drain];
//    return 0;
//}
