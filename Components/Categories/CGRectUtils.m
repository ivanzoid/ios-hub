////////////////////////////////////////////////////////////////////////////////
//
//  Fernwood
//  Created by ivan at 28.06.2018.
//
//  Copyright 2018 Loud & Clear Pty Ltd Pty Ltd
//  All Rights Reserved.
//
////////////////////////////////////////////////////////////////////////////////

#import "CGRectUtils.h"

CGRect CGRectSetX(CGRect rect, CGFloat x)
{
    CGRect result = { x, rect.origin.y, rect.size };
    return result;
}

CGRect CGRectSetY(CGRect rect, CGFloat y)
{
    CGRect result = { rect.origin.x, y, rect.size };
    return result;
}

CGRect CGRectSetWidth(CGRect rect, CGFloat width)
{
    CGRect result = { rect.origin, width, rect.size.height };
    return result;
}

CGRect CGRectSetHeight(CGRect rect, CGFloat height)
{
    CGRect result = { rect.origin, rect.size.width, height };
    return result;
}
