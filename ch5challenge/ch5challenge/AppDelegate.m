//
//  AppDelegate.m
//  ch5challenge
//
//  Created by Timothy Shull on 7/26/15.
//  Copyright (c) 2015 Timothy Shull. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

- (IBAction)countChar:(id)sender {
    NSString *stringFromUser = [_textInput stringValue];
    NSUInteger strLen = [stringFromUser length];
    NSString *returnString = [NSString stringWithFormat:@"'%@' has %lu characters.", stringFromUser, strLen];
    [_textDisplay setStringValue:returnString];
}
@end
