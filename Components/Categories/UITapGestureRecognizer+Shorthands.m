////////////////////////////////////////////////////////////////////////////////
//
//  Fernwood
//  Created by ivan at 30.11.2017.
//
//  Copyright 2017 Loud & Clear Pty Ltd Pty Ltd
//  All Rights Reserved.
//
////////////////////////////////////////////////////////////////////////////////

#import "UITapGestureRecognizer+Shorthands.h"


@implementation UITapGestureRecognizer (Shorthands)

+ (instancetype)withTarget:(nullable id)target action:(nullable SEL)action
{
    return [[UITapGestureRecognizer alloc] initWithTarget:target action:action];
}

@end
