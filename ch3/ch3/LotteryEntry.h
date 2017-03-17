//
//  LotteryEntry.h
//  ch3
//
//  Created by Timothy Shull on 7/19/15.
//  Copyright (c) 2015 Timothy Shull. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LotteryEntry : NSObject {
    NSDate *entryDate;
    int firstNumber;
    int secondNumber;
}
-(void)prepareRandomNumbers;
-(void)setEntryDate:(NSDate *)date;
-(NSDate *)entryDate;
-(int)firstNumber;
-(int)secondNumber;
-(NSString *)description;
@end
