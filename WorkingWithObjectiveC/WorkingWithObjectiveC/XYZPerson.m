//
// Created by Tim Shull on 9/11/16.
// Copyright (c) 2016 ___FULLUSERNAME___. All rights reserved.
//

#import "XYZPerson.h"


@implementation XYZPerson

- (void)saySomething:(NSString *)greeting {
    NSLog(@"%@", greeting);
}

- (void)sayHello {
    [self saySomething:@"Hello, World!"];
}

- (instancetype)initWithFirstName:(NSString *)firstName lastName:(NSString *)lastName dateOfBirth:(NSDate *)dateOfBirth {
    self = [super init];
    if (self) {
        self.firstName = firstName;
        self.lastName = lastName;
        self.dateOfBirth = dateOfBirth;
    }

    return self;
}

+ (instancetype)personWithFirstName:(NSString *)firstName lastName:(NSString *)lastName dateOfBirth:(NSDate *)dateOfBirth {
    return [[self alloc] initWithFirstName:firstName lastName:lastName dateOfBirth:dateOfBirth];
}

@end