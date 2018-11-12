////////////////////////////////////////////////////////////////////////////////
//
//  Fernwood
//  Created by ivan at 20.02.2018.
//
//  Copyright 2018 Loud & Clear Pty Ltd Pty Ltd
//  All Rights Reserved.
//
////////////////////////////////////////////////////////////////////////////////

#import "NSArray+CCGenNumbers.h"
#import "CCMacroses.h"

@implementation NSArray (CCGenNumbers)

+ (NSArray *)cc_generateNumbersFrom:(NSNumber *)from to:(NSNumber *)to step:(NSNumber *)step
{
    return [self _generateNumbersFrom:from to:to toInclusive:NO step:step];
}

+ (NSArray *)cc_generateNumbersFrom:(NSNumber *)from toInclusive:(NSNumber *)to step:(NSNumber *)step
{
    return [self _generateNumbersFrom:from to:to toInclusive:YES step:step];
}


//-------------------------------------------------------------------------------------------
#pragma mark - Private Methods
//-------------------------------------------------------------------------------------------

+ (NSArray *)_generateNumbersFrom:(NSNumber *)from to:(NSNumber *)to toInclusive:(BOOL)toInclusive step:(NSNumber *)step
{
    let array = [NSMutableArray new];

    let steps = (NSInteger)(to.doubleValue - from.doubleValue)/step.doubleValue;

    for (NSInteger i = 0; toInclusive ? (i <= steps) : (i < steps); i++) {
        [array addObject:@(from.doubleValue + step.doubleValue*i)];
    }

    return array;
}

@end
