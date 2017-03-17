//
//  AppDelegate.h
//  ch6challenge
//
//  Created by Timothy Shull on 7/26/15.
//  Copyright (c) 2015 Timothy Shull. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface AppDelegate : NSObject <NSApplicationDelegate, NSWindowDelegate>
- (NSSize)windowWillResize:(NSWindow *)sender toSize:(NSSize)frameSize;
@end