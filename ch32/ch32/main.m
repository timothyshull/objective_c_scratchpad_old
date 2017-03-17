//
//  main.m
//  ch32
//
//  Created by Timothy Shull on 7/25/15.
//  Copyright (c) 2015 Timothy Shull. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LotteryEntry.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSDate *now = [[NSDate alloc] init];
        NSCalendar *cal = [NSCalendar currentCalendar]; NSDateComponents *weekComponents = [[NSDateComponents alloc] init];
        srandom((unsigned)time(NULL));
        NSMutableArray *array;
        array = [[NSMutableArray alloc] init];
        int i;
        for (i = 0; i < 10; i++) {
            [weekComponents setWeekOfMonth:i];
            NSDate *iWeeksFromNow;
            iWeeksFromNow = [cal dateByAddingComponents:weekComponents toDate:now options:0];
            LotteryEntry *newEntry = [[LotteryEntry alloc] init];
            [newEntry prepareRandomNumbers];
            [newEntry setEntryDate:iWeeksFromNow];
        }
        for (LotteryEntry *entryToPrint in array) { 
            NSLog(@"%@", entryToPrint);
        }
    }
    return 0;
}
