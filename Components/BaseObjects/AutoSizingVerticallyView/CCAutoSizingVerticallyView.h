////////////////////////////////////////////////////////////////////////////////
//
//  Fernwood
//  Created by ivan at 30.11.2017.
//
//  Copyright 2017 Loud & Clear Pty Ltd Pty Ltd
//  All Rights Reserved.
//
////////////////////////////////////////////////////////////////////////////////

#import "CCView.h"

@interface CCAutoSizingVerticallyView : CCView

/// Will set self.width to width, and self.height to result of [self layoutVertically].
- (void)sizeToFitWidth:(CGFloat)width;

// For overriding:

/// Must perform layout, assuming that self.width is set correctly, but height is not known.
/// Returned value should be height after layout.
- (CGFloat)layoutVertically;

@end
