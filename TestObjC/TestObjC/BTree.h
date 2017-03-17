//
// Created by Tim Shull on 9/11/16.
// Copyright (c) 2016 ___FULLUSERNAME___. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Node.h"
#import "Entry.h"


@interface BTree<__covariant KeyType, __covariant ValueType> : NSObject

@property Node *root;
@property(nonatomic) NSUInteger height;
@property NSUInteger n;

- (id)init;

- (BOOL)isEmpty;

- (NSUInteger)size;

- (NSUInteger)height;

- (ValueType)get:(KeyType)keyToSearchFor;

- (ValueType)search:(Node *)startNode withSearchKey:(KeyType)keyToSearchFor withHeight:(NSUInteger)heightToUse;

- (void)put:(KeyType)keyForValue withValue:(ValueType)valueToPut;

- (Node *)insert:(Node *)startNode withKey:(KeyType)keyForValue withValue:(ValueType)valueToInsert
      withHeight:(NSUInteger)heightToUse;

- (Node *)split:(Node *)nodeToSplitAt;

- (NSMutableString *)toString;

- (NSMutableString *)toString:(Node *)startNode withHeight:(NSUInteger)heightToUse withIndent:(NSString *)indentToUse;

- (BOOL)less:(KeyType)firstComparable withComparable:(KeyType)secondComparable;

- (BOOL)eq:(KeyType)firstComparable withComparable:(KeyType)secondComparable;

@end