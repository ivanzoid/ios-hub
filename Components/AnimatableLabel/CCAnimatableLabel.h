////////////////////////////////////////////////////////////////////////////////
//
//  IVAN ZEZYULYA
//  Copyright 2017 Ivan Zezyulya Pty Ltd
//  All Rights Reserved.
//
//  NOTICE: Prepared by AppsQuick.ly on behalf of Ivan Zezyulya. This software
//  is proprietary information. Unauthorized use is prohibited.
//
////////////////////////////////////////////////////////////////////////////////

#import <UIKit/UIKit.h>

/**
 * CCAnimatableLabel allows you to change label font size and label position in animated manner.
 */
@interface CCAnimatableLabel : UIView

/**
 * Notes:
 * 1. Changing properties will trigger animations.
 *    To control animation, enclose property changes in [CATransaction begin] / [CATransaction commit].
 *    See CATransaction documentation/tutorials for more details.
 * 2. Text is aligned to top-left corner.
 * 3. Changes to `font` property are not-animated.
 */

@property (nonatomic) NSString *text;
@property (nonatomic) UIColor *textColor;
@property (nonatomic) UIFont *font;
@property (nonatomic) CGFloat fontSize;

/// Note: changing of frame bounds is not animated (but position derived from newFrame and fontSize are).
- (void)animateChangeFrame:(CGRect)newFrame fontSize:(CGFloat)fontSize duration:(NSTimeInterval)duration completion:(dispatch_block_t)completion;

- (CGSize)sizeThatFits;
- (CGSize)sizeThatFits:(CGSize)size;
- (CGSize)sizeThatFitsFontSize:(CGFloat)fontSize;
- (CGSize)sizeThatFits:(CGSize)size withFontSize:(CGFloat)fontSize;

@end
