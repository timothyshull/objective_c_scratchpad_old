//
//  main.m
//  TestObjC
//
//  Created by Tim Shull on 9/11/16.
//  Copyright (c) 2016 Tim Shull. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BTree.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        BTree *st = [[BTree alloc] init];
        [st put:@"www.cs.princeton.edu" withValue:@"128.112.136.12"];
        [st put:@"www.cs.princeton.edu" withValue:@"128.112.136.11"];
        [st put:@"www.princeton.edu" withValue:@"128.112.128.15"];
        [st put:@"www.yale.edu" withValue:@"130.132.143.21"];
        [st put:@"www.simpsons.com" withValue:@"209.052.165.60"];
        [st put:@"www.apple.com" withValue:@"17.112.152.32"];
        [st put:@"www.amazon.com" withValue:@"207.171.182.16"];
        [st put:@"www.ebay.com" withValue:@"66.135.192.87"];
        [st put:@"www.cnn.com" withValue:@"64.236.16.20"];
        [st put:@"www.google.com" withValue:@"216.239.41.99"];
        [st put:@"www.nytimes.com" withValue:@"199.239.136.200"];
        [st put:@"www.microsoft.com" withValue:@"207.126.99.140"];
        [st put:@"www.dell.com" withValue:@"143.166.224.230"];
        [st put:@"www.slashdot.org" withValue:@"66.35.250.151"];
        [st put:@"www.espn.com" withValue:@"199.181.135.201"];
        [st put:@"www.weather.com" withValue:@"63.111.66.11"];
        [st put:@"www.yahoo.com" withValue:@"216.109.118.65"];

        NSLog(@"%@%@", @"cs.princeton.edu:  ", [st get:@"www.cs.princeton.edu"]);
        NSLog(@"%@%@", @"hardvardsucks.com: ", [st get:@"www.harvardsucks.com"]);
        NSLog(@"%@%@", @"simpsons.com:      ", [st get:@"www.simpsons.com"]);
        NSLog(@"%@%@", @"apple.com:         ", [st get:@"www.apple.com"]);
        NSLog(@"%@%@", @"ebay.com:          ", [st get:@"www.ebay.com"]);
        NSLog(@"%@%@", @"dell.com:          ", [st get:@"www.dell.com"]);
        NSLog(@"\n\n");
        NSLog(@"%@%lu", @"size:    ", (unsigned long)[st size]);
        NSLog(@"%@%lu", @"height:  ", (unsigned long)[st height]);
        NSLog(@"%@%@", @"is empty?:  ", [st isEmpty] ? @"Yes" : @"No");
//        NSLog(@"%@", [st toString]);
        NSLog(@"\n\n");
    }

    return 0;
}