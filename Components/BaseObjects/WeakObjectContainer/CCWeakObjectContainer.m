////////////////////////////////////////////////////////////////////////////////
//
//  Fernwood
//  Created by ivan at 8.03.2018.
//
//  Copyright 2018 Loud & Clear Pty Ltd Pty Ltd
//  All Rights Reserved.
//
////////////////////////////////////////////////////////////////////////////////

#import "CCWeakObjectContainer.h"


@implementation CCWeakObjectContainer

- (instancetype)initWithObject:(id)object
{
    if (!(self = [super init])) {
        return nil;
    }

    _object = object;

    return self;
}

+ (instancetype)withObject:(id)object
{
    return [[self alloc] initWithObject:object];
}

@end
