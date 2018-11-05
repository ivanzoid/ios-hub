////////////////////////////////////////////////////////////////////////////////
//
//  Fernwood
//  Created by ivan at 5.12.2017.
//
//  Copyright 2017 Loud & Clear Pty Ltd Pty Ltd
//  All Rights Reserved.
//
////////////////////////////////////////////////////////////////////////////////

@import UIKit;


@interface UIView (MoreShorthands)

+ (instancetype)withFrame:(CGRect)frame;

- (UIImageView *)addImageView;
- (UIImageView *)addImageViewWithImage:(UIImage *)image;

- (UITextField *)addTextFieldWithFont:(UIFont *)font textColor:(UIColor *)color;

- (UITapGestureRecognizer *)addTapGestureRecognizerTo:(UIView *)view withAction:(SEL)action;

- (void)addSubviews:(NSArray<__kindof UIView *> *)subviews;

@end
