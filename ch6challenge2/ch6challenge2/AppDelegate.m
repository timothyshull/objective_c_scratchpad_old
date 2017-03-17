//
//  AppDelegate.m
//  ch6challenge2
//
//  Created by Timothy Shull on 7/27/15.
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
        _tableData = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

- (IBAction)addTodo:(id)sender {
    NSString *newTodo = [_textInput stringValue];
    [_tableData addObject:newTodo];
    [_tableView reloadData];
    NSLog(@"%@", [_tableData objectAtIndex:[_tableData count] - 1]);
}

- (NSInteger)numberOfRowsInTableView:(NSTableView *)tv {
    return [_tableData count];
}

- (id)tableView:(NSTableView *)tv objectValueForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row
{
    return [_tableData objectAtIndex:row];
}


- (void)controlTextDidEndEditing:(NSNotification *)obj
{
    NSDictionary *userInfo = [obj userInfo];
    NSTextView *aView = [userInfo valueForKey:@"NSFieldEditor"];
    NSLog(@"controlTextDidEndEditing %@", [aView string] );
    NSInteger row = [_tableView selectedRow];
    if (row == -1) {
        return;
    }
    NSLog(@"%ld", row);
    [_tableData replaceObjectAtIndex:row withObject:[aView string]];
    [_tableView reloadData];
}

@end
