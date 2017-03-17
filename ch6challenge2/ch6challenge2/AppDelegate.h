//
//  AppDelegate.h
//  ch6challenge2
//
//  Created by Timothy Shull on 7/27/15.
//  Copyright (c) 2015 Timothy Shull. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface AppDelegate : NSObject <NSApplicationDelegate, NSTableViewDelegate>
@property (strong) NSMutableArray *tableData;
@property (weak) IBOutlet NSTextField *textInput;
@property (weak) IBOutlet NSTableView *tableView;
- (IBAction)addTodo:(id)sender;
@end

