//
//  AppController.h
//  ch11
//
//  Created by Timothy Shull on 7/28/15.
//  Copyright (c) 2015 Timothy Shull. All rights reserved.
//

#import <Foundation/Foundation.h>
@class PreferenceController;

@interface AppController : NSObject
@property PreferenceController *preferenceController;
- (IBAction)showPreferencePanel:(id)sender;
@end
