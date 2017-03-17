//
//  Document.m
//  ch8
//
//  Created by Timothy Shull on 7/27/15.
//  Copyright (c) 2015 Timothy Shull. All rights reserved.
//

#import "Document.h"
#import "Person.h"

@interface Document ()

@end

@implementation Document

@synthesize employees = _employees;
static void *RMDocumentKVOContext;

- (instancetype)init {
    self = [super init];
    if (self) {
        _employees = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)windowControllerDidLoadNib:(NSWindowController *)aController {
    [super windowControllerDidLoadNib:aController];
    // Add any code here that needs to be executed once the windowController has loaded the document's window.
}

+ (BOOL)autosavesInPlace {
    return YES;
}

- (NSString *)windowNibName {
    // Override returning the nib file name of the document
    // If you need to use a subclass of NSWindowController or if your document supports multiple NSWindowControllers, you should remove this method and override -makeWindowControllers instead.
    return @"Document";
}

- (NSData *)dataOfType:(NSString *)typeName error:(NSError **)outError {
    [[_tableView window] endEditingFor:nil];
    return [NSKeyedArchiver archivedDataWithRootObject:_employees];
//    [NSException raise:@"UnimplementedMethod" format:@"%@ is unimplemented", NSStringFromSelector(_cmd)];
//    return nil;
}

- (BOOL)readFromData:(NSData *)data ofType:(NSString *)typeName error:(NSError **)outError {
    NSLog(@"About to read data of type %@", typeName);
    NSMutableArray *newArray = nil;
    @try {
        newArray = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    }
    @catch (NSException *e) {
        NSLog(@"exception: %@", e);
        if (outError) {
            NSDictionary *d = [NSDictionary dictionaryWithObject:@"The data is corrupted." forKey:NSLocalizedFailureReasonErrorKey];
            *outError = [NSError errorWithDomain:NSOSStatusErrorDomain code:unimpErr userInfo:d];
        }
        return NO;
    }
    [self setEmployees:newArray];
    return YES;
//    [NSException raise:@"UnimplementedMethod" format:@"%@ is unimplemented", NSStringFromSelector(_cmd)];
//    return YES;
}

- (NSMutableArray *)employees {
    return _employees;
}

- (void)setEmployees:(NSMutableArray *)inputEmployees{
    for (Person *person in _employees) {
        [self stopObservingPerson:person];
    }
    _employees = inputEmployees;
    for (Person *person in _employees) {
        [self startObservingPerson:person];
    }
}

- (void)insertObject:(Person *)p inEmployeesAtIndex:(NSUInteger)index {
    NSLog(@"adding %@ to %@", p, _employees);
    // Add the inverse of this operation to the undo stack
    NSUndoManager *undo = [self undoManager];
    [[undo prepareWithInvocationTarget:self]removeObjectFromEmployeesAtIndex:index];
    if (![undo isUndoing]) {
        [undo setActionName:@"Add Person"];
    }
    // Add the Person to the array
    [self startObservingPerson:p];
    [_employees insertObject:p atIndex:index];
}

- (void)removeObjectFromEmployeesAtIndex:(NSUInteger)index
{
    Person *p = [_employees objectAtIndex:index];
    NSLog(@"removing %@ from %@", p, _employees);
    NSUndoManager *undo = [self undoManager];
    [[undo prepareWithInvocationTarget:self] insertObject:p inEmployeesAtIndex:index];
    if (![undo isUndoing]) {
        [undo setActionName:@"RemovePerson"];
    }
    [self stopObservingPerson:p];
    [_employees removeObjectAtIndex:index];
}

- (void)startObservingPerson:(Person *)person
{
    [person addObserver:self forKeyPath:@"personName"
                options:NSKeyValueObservingOptionOld context:&RMDocumentKVOContext];
    [person addObserver:self forKeyPath:@"expectedRaise"
                options:NSKeyValueObservingOptionOld context:&RMDocumentKVOContext];
}

- (void)stopObservingPerson:(Person *)person
{
    [person removeObserver:self forKeyPath:@"personName"
                   context:&RMDocumentKVOContext];
    [person removeObserver:self
                forKeyPath:@"expectedRaise" context:&RMDocumentKVOContext];
}

- (void)changeKeyForPath:(NSString *)keyPath ofObject:(id)obj toValue:(id)newValue
{
    [obj setValue:newValue forKey:keyPath];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if (context != &RMDocumentKVOContext)
    {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
        return;
    }
    NSUndoManager *undo = [self undoManager];
    id oldValue = [change objectForKey:NSKeyValueChangeOldKey];
    
    if (oldValue == [NSNull null]) {
        oldValue = nil;
    }
    NSLog(@"oldValue = %@", oldValue);
    [[undo prepareWithInvocationTarget:self] changeKeyForPath:keyPath ofObject:object toValue:oldValue];
    [undo setActionName:@"Edit"];
}

- (IBAction)createEmployee:(id)sender
{
    NSWindow *w = [_tableView window];
    BOOL editingEnded = [w makeFirstResponder:w];
    if (!editingEnded) {
        NSLog(@"Unable to end editing");
        return;
    }
    NSUndoManager *undo = [self undoManager];
    
    if ([undo groupingLevel] > 0) {
        [undo endUndoGrouping];
        [undo beginUndoGrouping];
    }
    Person *p = [_employeeController newObject];
    [_employeeController addObject:p];
    [_employeeController rearrangeObjects];
    NSArray *a = [_employeeController arrangedObjects];
    
    NSUInteger row = [a indexOfObjectIdenticalTo:p];
    NSLog(@"starting edit of %@ in row %lu", p, row);
    
    [_tableView editColumn:0 row:row withEvent:nil select:YES];
}

@end
