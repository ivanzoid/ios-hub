////////////////////////////////////////////////////////////////////////////////
//
//  Fernwood
//  Created by ivan at 5.12.2017.
//
//  Copyright 2017 Loud & Clear Pty Ltd Pty Ltd
//  All Rights Reserved.
//
////////////////////////////////////////////////////////////////////////////////

#import "UIView+MoreShorthands.h"


@implementation UIView (MoreShorthands)

+ (instancetype)withFrame:(CGRect)frame
{
    return [[self alloc] initWithFrame:frame];
}

- (UIImageView *)addImageView
{
    let imageView = [UIImageView new];
    [self addSubview:imageView];
    return imageView;
}

- (UIImageView *)addImageViewWithImage:(UIImage *)image
{
    let imageView = [UIImageView withImage:image];
    [self addSubview:imageView];
    return imageView;
}

- (UITapGestureRecognizer *)addTapGestureRecognizerTo:(UIView *)view withAction:(SEL)action
{
    let tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:action];
    [view addGestureRecognizer:tapRecognizer];
    return tapRecognizer;
}

- (UITextField *)addTextFieldWithFont:(UIFont *)font textColor:(UIColor *)color
{
    let textField = [UITextField new];
    textField.font = font;
    textField.textColor = color;
    [self addSubview:textField];
    return textField;
}

- (void)addSubviews:(NSArray<__kindof UIView *> *)subviews
{
    for (UIView *subview in subviews) {
        [self addSubview:subview];
    }
}

@end
