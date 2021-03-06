////////////////////////////////////////////////////////////////////////////////
//
//  Pods
//  Created by ivan at 12.06.2018.
//
//  Copyright 2018 $ORGANIZATION_NAME Pty Ltd
//  All Rights Reserved.
//
////////////////////////////////////////////////////////////////////////////////

#import "NSArray+CCSafeAccess.h"


@implementation NSArray (CCSafeAccess)

//-------------------------------------------------------------------------------------------
#pragma mark - Initialization & Destruction
//-------------------------------------------------------------------------------------------

//-------------------------------------------------------------------------------------------
#pragma mark - Interface Methods
//-------------------------------------------------------------------------------------------

- (id)cc_safeObjectAtIndex:(NSUInteger)index
{
    if (index >= self.count) {
        return nil;
    }

    return [self objectAtIndex:index];
}

//-------------------------------------------------------------------------------------------
#pragma mark - Overridden Methods
//-------------------------------------------------------------------------------------------

//-------------------------------------------------------------------------------------------
#pragma mark - Private Methods
//-------------------------------------------------------------------------------------------

@end
