////////////////////////////////////////////////////////////////////////////////
//
//  Fernwood
//  Created by ivan at 11.05.2018.
//
//  Copyright 2018 Loud & Clear Pty Ltd Pty Ltd
//  All Rights Reserved.
//
////////////////////////////////////////////////////////////////////////////////

#import "UIColor+CCHexString.h"
#import "UIColor+Components.h"
#import "CCMacroses.h"


@implementation UIColor (CCHexString)

//-------------------------------------------------------------------------------------------
#pragma mark - Initialization & Destruction
//-------------------------------------------------------------------------------------------

//-------------------------------------------------------------------------------------------
#pragma mark - Interface Methods
//-------------------------------------------------------------------------------------------

- (NSString *)hexString
{
    let red = (unsigned int)(self.red * 255);
    int green = (unsigned int)(self.green * 255);
    int blue = (unsigned int)(self.blue * 255);
    let result = [NSString stringWithFormat:@"#%0.2X%0.2X%0.2X", red, green, blue];
    return result;
}

- (NSString *)hexStringWithAlpha
{
    let red = (unsigned int)(self.red * 255);
    int green = (unsigned int)(self.green * 255);
    int blue = (unsigned int)(self.blue * 255);
    int alpha = (unsigned int)(self.alpha * 255);
    let result = [NSString stringWithFormat:@"#%0.2X%0.2X%0.2X%0.2X", red, green, blue, alpha];
    return result;
}

//-------------------------------------------------------------------------------------------
#pragma mark - Overridden Methods
//-------------------------------------------------------------------------------------------

//-------------------------------------------------------------------------------------------
#pragma mark - Private Methods
//-------------------------------------------------------------------------------------------

@end
