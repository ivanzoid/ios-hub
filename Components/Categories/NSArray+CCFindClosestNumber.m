////////////////////////////////////////////////////////////////////////////////
//
//  Fernwood
//  Created by ivan at 27.12.2017.
//
//  Copyright 2017 Loud & Clear Pty Ltd Pty Ltd
//  All Rights Reserved.
//
////////////////////////////////////////////////////////////////////////////////

#import "NSArray+CCFindClosestNumber.h"


@implementation NSArray (CCFindClosestNumber)

+ (NSNumber *)indexOfClosestNumberTo:(NSNumber *)number inArray:(NSArray<NSNumber *> *)array
{
    NSNumber *closestValue;
    NSNumber *closestValueIndex;
    for (NSUInteger i = 0; i < array.count; i++) {
        let value = array[i];
        if (!closestValue || fabs(value.doubleValue - number.doubleValue) < fabs(value.doubleValue - closestValue.doubleValue)) {
            closestValue = value;
            closestValueIndex = @(i);
        }
    }

    return closestValueIndex;
}

@end
