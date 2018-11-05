////////////////////////////////////////////////////////////////////////////////
//
//  Momatu
//  Created by ivan at 7.11.2017.
//
//  Copyright 2017 LoudClear Pty Ltd
//  All Rights Reserved.
//
////////////////////////////////////////////////////////////////////////////////

@import UIKit;


@interface UIView (Shorthands)

+ (instancetype)withFrame:(CGRect)frame;

+ (instancetype)withSubviews:(NSArray<UIView *> *)subviews;
+ (instancetype)withSubviewsBlock:(NSArray<UIView *> *(^)())subviewsBlock;

- (UIImageView *)addImageView;
- (UIImageView *)addImageViewWithImage:(UIImage *)image;

- (UITextField *)addTextFieldWithFont:(UIFont *)font textColor:(UIColor *)color;

- (UITapGestureRecognizer *)addTapGestureRecognizerTo:(UIView *)view withAction:(SEL)action;

- (void)addSubviews:(NSArray<__kindof UIView *> *)subviews;

- (UIView *)addView;
- (UIView *)addViewWithBgColor:(UIColor *)color;

- (UIButton *)addButtonWithAction:(SEL)action;
- (UIButton *)addButtonWithTarget:(id)target action:(SEL)action;

- (UILabel *)addLabel;
- (UILabel *)addLabelWithFont:(UIFont *)font color:(UIColor *)color;

- (UITapGestureRecognizer *)addTapWithTarget:(id)target action:(SEL)action;

@end
