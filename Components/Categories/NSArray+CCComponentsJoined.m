////////////////////////////////////////////////////////////////////////////////
//
//  Fernwood
//  Created by ivan at 18.06.2018.
//
//  Copyright 2018 Loud & Clear Pty Ltd Pty Ltd
//  All Rights Reserved.
//
////////////////////////////////////////////////////////////////////////////////

#import "NSArray+CCComponentsJoined.h"
#import "NSArray+CCForEach.h"


@implementation NSArray (CCComponentsJoined)

//-------------------------------------------------------------------------------------------
#pragma mark - Initialization & Destruction
//-------------------------------------------------------------------------------------------

//-------------------------------------------------------------------------------------------
#pragma mark - Interface Methods
//-------------------------------------------------------------------------------------------

- (NSString *)cc_componentsJoinedByStringSafeRecursive:(NSString *)symbol
{
    let strings = [NSMutableArray<NSString *> new];

    [self cc_forEach:^(id object) {
        if ([object isKindOfClass:NSString.class]) {
            [strings addObject:object];
        }
        else if ([object isKindOfClass:[NSArray class]]) {
            let str = [object cc_componentsJoinedByStringSafeRecursive:symbol];
            [strings addObject:str];
        }
    }];

    return [strings componentsJoinedByString:symbol];
}


//-------------------------------------------------------------------------------------------
#pragma mark - Overridden Methods
//-------------------------------------------------------------------------------------------

//-------------------------------------------------------------------------------------------
#pragma mark - Private Methods
//-------------------------------------------------------------------------------------------

@end
