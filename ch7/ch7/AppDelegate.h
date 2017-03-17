//
//  AppDelegate.h
//  ch7
//
//  Created by Timothy Shull on 7/28/15.
//  Copyright (c) 2015 Timothy Shull. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface AppDelegate : NSObject <NSApplicationDelegate>
@property int fido;
//- (void)incrementFido:(id)sender;
- (IBAction)incrementFido:(id)sender;
@end

