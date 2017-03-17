//  AppDelegate.h
//  ch5
//
//  Created by Timothy Shull on 7/19/15.
//  Copyright (c) 2015 Timothy Shull. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface AppDelegate : NSObject <NSApplicationDelegate,NSSpeechSynthesizerDelegate>
{
    NSArray *_voices;
    NSSpeechSynthesizer *_speechSynth;
}
@property (assign) IBOutlet NSWindow *window;
@property (weak) IBOutlet NSTextField *textField;
@property (weak) IBOutlet NSTableView *tableView;
- (IBAction)stopIt:(id)sender;
- (IBAction)sayIt:(id)sender;
@end
