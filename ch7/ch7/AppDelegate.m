//
//  AppDelegate.m
//  ch7
//
//  Created by Timothy Shull on 7/28/15.
//  Copyright (c) 2015 Timothy Shull. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;
@end

@implementation AppDelegate

- (instancetype)init {
    self = [super init];
    if (self) {
        [self setValue:[NSNumber numberWithInt:5] forKey:@"fido"];
        NSNumber *n = [self valueForKey:@"fido"];
        NSLog(@"fido = %@", n);
    }
    return self;
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

- (IBAction)incrementFido:(id)sender {
    [self setFido:[self fido] + 1];
    NSLog(@"Fido is now %d", _fido);
}

@end
