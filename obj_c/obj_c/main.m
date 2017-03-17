//
//  main.m
//  obj_c
//
//  Created by Timothy Shull on 7/5/16.
//  Copyright (c) 2016 tim_shull. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XYZPerson.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        XYZPerson *testPerson = [[XYZPerson alloc] init];
        [testPerson setFirstProperty:25];
        NSLog(@"%d", [testPerson firstInstanceMethod]);
        NSLog(@"class method: %@", [XYZPerson firstClassMethod]);
//        NSLog(@"class method: %@", [testPerson firstClassMethod]);
    }

    return 0;
}