////////////////////////////////////////////////////////////////////////////////
//
//  Fernwood
//  Created by ivan at 30.11.2017.
//
//  Copyright 2017 Loud & Clear Pty Ltd Pty Ltd
//  All Rights Reserved.
//
////////////////////////////////////////////////////////////////////////////////

#import "UIImage+CCTemplate.h"


@implementation UIImage (CCTemplate)

- (instancetype)cc_templateImage
{
    return [self imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
}

@end
