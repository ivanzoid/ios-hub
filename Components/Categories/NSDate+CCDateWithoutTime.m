////////////////////////////////////////////////////////////////////////////////
//
//  Fernwood
//  Created by ivan at 15.03.2018.
//
//  Copyright 2018 Loud & Clear Pty Ltd Pty Ltd
//  All Rights Reserved.
//
////////////////////////////////////////////////////////////////////////////////

#import "NSDate+CCDateWithoutTime.h"


@implementation NSDate (CCDateWithoutTime)

- (instancetype)cc_dateWithoutTime
{
    NSCalendar *utcCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    utcCalendar.timeZone = [NSTimeZone timeZoneWithAbbreviation:@"UTC"];

    let comps = [utcCalendar components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay fromDate:self];
    let result = [utcCalendar dateFromComponents:comps];
    return result;
}

@end
