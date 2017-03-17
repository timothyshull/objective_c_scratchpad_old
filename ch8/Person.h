//
//  Person.h
//  ch8
//
//  Created by Timothy Shull on 7/27/15.
//  Copyright (c) 2015 Timothy Shull. All rights reserved.
//

#ifndef ch8_Person_h
#define ch8_Person_h

@interface Person : NSObject 
@property (readwrite, copy) NSString *personName;
@property (readwrite) float expectedRaise;
@end

#endif
