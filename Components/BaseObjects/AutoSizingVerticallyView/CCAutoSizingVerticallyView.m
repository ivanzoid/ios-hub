////////////////////////////////////////////////////////////////////////////////
//
//  Fernwood
//  Created by ivan at 30.11.2017.
//
//  Copyright 2017 Loud & Clear Pty Ltd Pty Ltd
//  All Rights Reserved.
//
////////////////////////////////////////////////////////////////////////////////

#import "CCAutoSizingVerticallyView.h"
#import "CCMacroses.h"
#import "UIView+Positioning.h"


@implementation CCAutoSizingVerticallyView

- (void)layout
{
    [self layoutVertically];
}

- (CGFloat)layoutVertically
{
    return 0;
}

- (void)sizeToFitWidth:(CGFloat)width
{
    self.width = width;
    let height = [self layoutVertically];
    self.height = height;
}

@end
