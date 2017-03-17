#import <Foundation/Foundation.h>

@interface LotteryEntry : NSObject
@property NSDate *entryDate;
@property int firstNumber;
@property int secondNumber;
- (void) prepareRandomNumbers;
- (void) setEntryDate:(NSDate *)date;
- (NSDate *) entryDate;
- (int) firstNumber;
- (int) secondNumber;
@end
