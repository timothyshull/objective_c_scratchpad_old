#import "Person.h"

@implementation Person

@synthesize personName;
@synthesize expectedRaise;

- (id) init
{
    self = [super init];
    if (self) {
        expectedRaise = 0.05;
        personName = @"New Person";
    }
    return self;
}
@end
