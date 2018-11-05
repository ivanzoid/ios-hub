////////////////////////////////////////////////////////////////////////////////
//
//  Fernwood
//  Created by ivan at 10.01.2018.
//
//  Copyright 2018 Loud & Clear Pty Ltd Pty Ltd
//  All Rights Reserved.
//
////////////////////////////////////////////////////////////////////////////////

#import "CCObject.h"


BOOL CCValueIsNullOrEmptyString(id value);

/// Also takes in account nil values.
BOOL CCNumberIsEqualToNumber(NSNumber *number1, NSNumber *number2);
BOOL CCStringIsEqualToString(NSString *string1, NSString *string2);
