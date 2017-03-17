//
// Created by Tim Shull on 9/11/16.
// Copyright (c) 2016 ___FULLUSERNAME___. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface XYZPerson : NSObject

@property NSString *firstName;
@property NSString *lastName;
@property NSDate *dateOfBirth;

- (void)saySomething:(NSString *)greeting;

- (void)sayHello;

- (instancetype)initWithFirstName:(NSString *)firstName lastName:(NSString *)lastName dateOfBirth:(NSDate *)dateOfBirth;

+ (instancetype)personWithFirstName:(NSString *)firstName lastName:(NSString *)lastName dateOfBirth:(NSDate *)dateOfBirth;

@end