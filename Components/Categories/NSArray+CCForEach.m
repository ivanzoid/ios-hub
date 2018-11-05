////////////////////////////////////////////////////////////////////////////////
//
//  Fernwood
//  Created by ivan at 6.06.2018.
//
//  Copyright 2018 Loud & Clear Pty Ltd Pty Ltd
//  All Rights Reserved.
//
////////////////////////////////////////////////////////////////////////////////

#import "NSArray+CCForEach.h"


@implementation NSArray (CCForEach)

- (void)cc_forEach:(void (^__attribute__((noescape)))(id object))block
{
    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        block(obj);
    }];
}

@end
