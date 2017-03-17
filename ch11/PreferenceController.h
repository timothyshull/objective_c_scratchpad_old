//
//  PreferenceController.h
//  ch11
//
//  Created by Timothy Shull on 7/28/15.
//  Copyright (c) 2015 Timothy Shull. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface PreferenceController : NSObject
@property NSColorWell *colorWell;
@property NSButton *checkbox;
- (IBAction)changeBackgroundColor:(id)sender;
- (IBAction)changeNewEmptyDoc:(id)sender;
@end
