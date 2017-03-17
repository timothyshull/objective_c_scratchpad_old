//
//  AppDelegate.m
//  ch5
//
//  Created by Timothy Shull on 7/19/15.
//  Copyright (c) 2015 Timothy Shull. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

@synthesize window = _window;
@synthesize textField = _textField;

- (id)init
{
    self = [super init];
    if (self) {
        NSLog(@"init");
        _speechSynth = [[NSSpeechSynthesizer alloc] initWithVoice:nil];
        [_speechSynth setDelegate:self];
        _voices = [NSSpeechSynthesizer availableVoices];
    }
    return self;
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

- (IBAction)stopIt:(id)sender {
    NSLog(@"stopping");
    [_speechSynth stopSpeaking];
}

- (IBAction)sayIt:(id)sender {
    NSString *string = [_textField stringValue];

    if ([string length] == 0) {
        NSLog(@"string from %@ is of zero-length", _textField);
        return;
    }
    [_speechSynth startSpeakingString:string];
    NSLog(@"Have started to say: %@", string);
}

- (void)speechSynthesizer:(NSSpeechSynthesizer *)sender didFinishSpeaking:(BOOL)finishedSpeaking
{
    NSLog(@"finishedSpeaking = %d", finishedSpeaking);
}
@end
