//
// Created by Tim Shull on 9/11/16.
// Copyright (c) 2016 ___FULLUSERNAME___. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Node;

@interface Entry<__covariant KeyType, __covariant ValueType> : NSObject

// Automatically synthesized after Xcode 4.4
@property KeyType key;
@property ValueType value;
@property Node *next;

- (id)initWithKeyValueAndNext:(KeyType)keyToUse newValue:(ValueType)valueToUse nextEntry:(Node *)nextEntryToUse;

@end