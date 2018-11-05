////////////////////////////////////////////////////////////////////////////////
//
//  Fernwood
//  Created by ivan at 10.01.2018.
//
//  Copyright 2018 Loud & Clear Pty Ltd Pty Ltd
//  All Rights Reserved.
//
////////////////////////////////////////////////////////////////////////////////

#import "CCValueUtils.h"


BOOL CCValueIsNullOrEmptyString(id value)
{
    if (value == nil) {
        return YES;
    }
    if (value == [NSNull null]) {
        return YES;
    }
    if ([value isKindOfClass:[NSString class]]) {
        NSString *stringValue = value;
        return stringValue.length == 0;
    }
    return NO;
}

BOOL CCNumberIsEqualToNumber(NSNumber *number1, NSNumber *number2)
{
    if (number1 && !number2) {
        return NO;
    }
    if (number2 && !number1) {
        return NO;
    }
    if (!number1 && !number2) {
        return YES;
    }
    return [number1 isEqualToNumber:number2];
}

BOOL CCStringIsEqualToString(NSString *string1, NSString *string2)
{
    if (string1 && !string2) {
        if (string1.length == 0) {
            return YES;
        }
        return NO;
    }
    if (string2 && !string1) {
        if (string2.length == 0) {
            return YES;
        }
        return NO;
    }
    if (!string1 && !string2) {
        return YES;
    }
    return [string1 isEqualToString:string2];
}
