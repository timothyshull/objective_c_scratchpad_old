//
//  AppDelegate.m
//  ch6challenge
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

//- (id)init
//{
//    self = [super init];
//    NSLog(@"Init");
//    if (self) {
//        _window = [[NSWindow alloc] init];
//        [_window setDelegate:self];
//    }
//    return self;
//}

- (NSSize)windowWillResize:(NSWindow *)sender toSize:(NSSize)frameSize {
    NSLog(@"%f, %f", frameSize.width, frameSize.height);
    NSSize newSize = NSMakeSize(frameSize.width, frameSize.width * 2);
    return newSize;
}

@end
