////////////////////////////////////////////////////////////////////////////////
//
//  Fernwood
//  Created by ivan at 1.03.2018.
//
//  Copyright 2018 Loud & Clear Pty Ltd Pty Ltd
//  All Rights Reserved.
//
////////////////////////////////////////////////////////////////////////////////

#import <ComponentsHub/CCMutableCollections.h>
#import "NSArray+CCAddRemoveObjects.h"
#import "CCMacroses.h"


@implementation NSArray (CCAddRemoveObjects)

//-------------------------------------------------------------------------------------------
#pragma mark - Initialization & Destruction
//-------------------------------------------------------------------------------------------

//-------------------------------------------------------------------------------------------
#pragma mark - Interface Methods
//-------------------------------------------------------------------------------------------

- (NSMutableArray *)cc_arrayByRemovingObject:(id)object
{
    let mutableArray = [self mutableArray];
    [mutableArray removeObject:object];
    return mutableArray;
}

- (NSMutableArray *)cc_arrayByAddingObject:(id)object
{
    let mutableArray = [self mutableArray];
    [mutableArray addObject:object];
    return mutableArray;
}

//-------------------------------------------------------------------------------------------
#pragma mark - Overridden Methods
//-------------------------------------------------------------------------------------------

//-------------------------------------------------------------------------------------------
#pragma mark - Private Methods
//-------------------------------------------------------------------------------------------

@end
