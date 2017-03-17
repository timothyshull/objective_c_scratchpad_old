//
//  AppDelegate.h
//  ch5challenge
//
//  Created by Timothy Shull on 7/26/15.
//  Copyright (c) 2015 Timothy Shull. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface AppDelegate : NSObject <NSApplicationDelegate>
@property (weak) IBOutlet NSTextField *textInput;
@property (weak) IBOutlet NSTextField *textDisplay;
- (IBAction)countChar:(id)sender;
@end

