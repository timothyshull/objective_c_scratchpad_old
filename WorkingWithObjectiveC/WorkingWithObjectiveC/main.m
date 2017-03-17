//
//  main.m
//  WorkingWithObjectiveC
//
//  Created by Tim Shull on 9/11/16.
//  Copyright (c) 2016 Tim Shull. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreFoundation/CoreFoundation.h>
#import "XYZPerson.h"

int main(int argc, const char *argv[]) {
    @autoreleasepool {
//        XYZPerson *newPerson = [[XYZPerson alloc] init];
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        dateFormatter.timeStyle = NSDateFormatterNoStyle;
        dateFormatter.dateFormat = @"MM/dd/yyyy";
        NSDate *dob = [dateFormatter dateFromString:@"01/22/1984"];
        XYZPerson *newPerson = [XYZPerson personWithFirstName:@"Tim" lastName:@"Shull" dateOfBirth:dob];
        [newPerson sayHello];
        XYZPerson *newPerson2 = [[XYZPerson alloc] init];
        if (newPerson2) {
            NSLog(@"Inside check for non-nil newPerson2");
        }
    }

    return 0;
}