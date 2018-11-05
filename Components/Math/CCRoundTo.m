////////////////////////////////////////////////////////////////////////////////
//
//  LOUD&CLEAR
//  Copyright 2017 Loud&Clear Pty Ltd
//  All Rights Reserved.
//
//  NOTICE: Prepared by AppsQuick.ly on behalf of Loud&Clear. This software
//  is proprietary information. Unauthorized use is prohibited.
//
////////////////////////////////////////////////////////////////////////////////


CGFloat CCRoundTo(CGFloat number, CGFloat to)
{
    if (number >= 0) {
        return to * floor(number / to + 0.5f);
    }
    else {
        return to * ceil(number / to - 0.5f);
    }
}
