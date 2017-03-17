//
// Created by Tim Shull on 9/11/16.
// Copyright (c) 2016 ___FULLUSERNAME___. All rights reserved.
//

#import "XYZShoutingPerson.h"


@implementation XYZShoutingPerson

- (void)saySomething:(NSString *)greeting {
    NSLog(@"%@", [greeting uppercaseString]);
}

@end