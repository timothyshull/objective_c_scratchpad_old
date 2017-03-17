//
//  Document.h
//  ch8
//
//  Created by Timothy Shull on 7/27/15.
//  Copyright (c) 2015 Timothy Shull. All rights reserved.
//

#import <Cocoa/Cocoa.h>
@class Person;

@interface Document : NSDocument
@property NSMutableArray *employees;
@property IBOutlet NSTableView *tableView;
@property IBOutlet NSArrayController *employeeController;
- (IBAction)createEmployee:(id)sender;
- (void)insertObject:(Person *)p inEmployeesAtIndex:(NSUInteger)index;
- (void)removeObjectFromEmployeesAtIndex:(NSUInteger)index;
@end

