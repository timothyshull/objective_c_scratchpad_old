//
//  CarArrayController.m
//  ch11
//
//  Created by Timothy Shull on 7/28/15.
//  Copyright (c) 2015 Timothy Shull. All rights reserved.
//

#import "CarArrayController.h"

@implementation CarArrayController

- (id)newObject
{
    id newObj = [super newObject];
    NSDate *now = [NSDate date];
    [newObj setValue:now forKey:@"datePurchased"]; return newObj;
}

@end
