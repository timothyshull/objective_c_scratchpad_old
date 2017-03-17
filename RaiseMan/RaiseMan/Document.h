//
//  Document.h
//  RaiseMan
//
//  Created by Timothy Shull on 7/22/15.
//  Copyright (c) 2015 Timothy Shull. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface Document : NSDocument {
    NSMutableArray *employees;
}
- (void)setEmployees:(NSMutableArray *)a;
@end

