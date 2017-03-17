//
// Created by Tim Shull on 9/11/16.
// Copyright (c) 2016 ___FULLUSERNAME___. All rights reserved.
//

#import "BTree.h"


@implementation BTree

static NSUInteger M = 4;

- (id)init {
    self = [super init];
    if (self) {
        _root = [[Node alloc] initWithNumberOfChildren:0];
    }
    return self;
}

- (BOOL)isEmpty {
    return [self size] == 0;
}

- (NSUInteger)size {
    return _n;
}

- (NSUInteger)height {
    return _height;
}

- (id)get:(id)keyToSearchFor {
    if (keyToSearchFor == nil) {
        [NSException raise:@"null pointer" format:@"key must not be null"];
    }
    return [self search:_root withSearchKey:keyToSearchFor withHeight:_height];
}

- (id)search:(Node *)startNode withSearchKey:(id)keyToSearchFor withHeight:(NSUInteger)heightToUse {
    NSMutableArray *childrenTmp = [startNode children];

    if (heightToUse == 0) {
        for (NSUInteger j = 0; j < [startNode m]; j++) {
            if ([self eq:keyToSearchFor withComparable:[childrenTmp[j] key]]) {
                return [childrenTmp[j] value];
//                return (ValueType) [childrenTmp[j] value];
            }
        }
    } else {
        for (NSUInteger j = 0; j < [startNode m]; j++) {
            if (j + 1 == [startNode m] || [self less:keyToSearchFor withComparable:[childrenTmp[j + 1] key]]) {
                return [self search:[childrenTmp[j] next] withSearchKey:keyToSearchFor withHeight:heightToUse - 1];
            }
        }
    }

    return nil;
}

- (void)put:(id)keyForValue withValue:(id)valueToPut {
    if (keyForValue == nil) {
        [NSException raise:@"null pointer" format:@"key must not be null"];
    }
    Node *u = [self insert:_root withKey:keyForValue withValue:valueToPut withHeight:_height];
    _n += 1;
    if (u == nil) {
        return;
    }

    Node *t = [[Node alloc] initWithNumberOfChildren:2];
    [t children][0] = [[Entry alloc] initWithKeyValueAndNext:[[_root children][0] key] newValue:nil nextEntry:_root];
    [t children][1] = [[Entry alloc] initWithKeyValueAndNext:[[u children][0] key] newValue:nil nextEntry:u];
    _root = t;
    _height += 1;
}

- (Node *)insert:(Node *)startNode withKey:(id)keyForValue withValue:(id)valueToInsert withHeight:(NSUInteger)heightToUse {
    NSUInteger j;
    Entry *t = [[Entry alloc] initWithKeyValueAndNext:keyForValue newValue:valueToInsert nextEntry:nil];

    if (heightToUse == 0) {
        for (j = 0; j < [startNode m]; j++) {
            if ([self less:keyForValue withComparable:[[startNode children][j] key]]) {
                break;
            }
        }
    } else {
        for (j = 0; j < [startNode m]; j++) {
            if (j + 1 == [startNode m] || [self less:keyForValue withComparable:[[startNode children][j + 1] key]]) {
                Node *u = [self insert:[[startNode children][j++] next] withKey:keyForValue withValue:valueToInsert withHeight:heightToUse - 1];
                if (u == nil) {
                    return nil;
                }
                [t setKey:[[u children][0] key]];
                [t setNext:u];
                break;
            }
        }
    }

    for (NSUInteger i = [startNode m]; i > j; i--) {
        [startNode children][i] = [startNode children][i - 1];
    }

    [startNode children][j] = t;
    [startNode setM:[startNode m] + 1];

    if ([startNode m] < M) {
        return nil;
    } else {
        return [self split:startNode];
    }
}

- (Node *)split:(Node *)nodeToSplitAt {
    Node *t = [[Node alloc] initWithNumberOfChildren:M / 2];

    if (t == nil) {
        return nil;
    }

    [nodeToSplitAt setM:M / 2];

    for (NSUInteger j = 0; j < M / 2; j++) {
        [t children][j] = [nodeToSplitAt children][M / 2 + j];
    }
    return t;
}

- (NSMutableString *)toString {
    NSMutableString *str = [NSMutableString stringWithFormat:@"\n"];
    [str appendString:[self toString:_root withHeight:_height withIndent:@""]];
    [str appendString:@"\n"];
    return str;
}

- (NSMutableString *)toString:(Node *)startNode withHeight:(NSUInteger)heightToUse withIndent:(NSString *)indentToUse {
    NSMutableString *s = [[NSMutableString alloc] init];
    NSMutableArray *childrenTmp = [startNode children];

    if (heightToUse == 0) {
        for (NSUInteger j = 0; j < [startNode m]; j++) {
            [s appendString:[NSMutableString stringWithFormat:@"%@%@: %@\n", indentToUse, [childrenTmp[j] key],
                                                              [childrenTmp[j] value]]];
        }
    } else {
        for (NSUInteger j = 0; j < [startNode m]; j++) {
            if (j > 0) {
                [s appendString:[NSMutableString stringWithFormat:@"%@(%@)\r\n", indentToUse, [childrenTmp[j] key]]];
            }
            NSMutableString *newIndent = [indentToUse mutableCopy];
            [newIndent appendString:@"    "];
            [s appendString:[NSMutableString stringWithFormat:@"%@\n",
                                                              [self toString:[childrenTmp[j] next] withHeight:heightToUse - 1 withIndent:newIndent]]];
        }
    }
    return s;
}

- (BOOL)less:(id)firstComparable withComparable:(id)secondComparable {
    return [firstComparable isLessThan:secondComparable];
}

- (BOOL)eq:(id)firstComparable withComparable:(id)secondComparable {
    return [firstComparable isEqual:secondComparable];
}


@end