////////////////////////////////////////////////////////////////////////////////
//
//  Momatu
//  Created by ivan at 7.11.2017.
//
//  Copyright 2017 LoudClear Pty Ltd
//  All Rights Reserved.
//
////////////////////////////////////////////////////////////////////////////////

#import "CCMacroses.h"
#import "UIView+Shorthands.h"
#import "UIButton+Shorthands.h"
#import "UILabel+Shorthands.h"
#import "UIImageView+Shorthands.h"


@implementation UIView (Shorthands)

+ (instancetype)withFrame:(CGRect)frame
{
    return [[self alloc] initWithFrame:frame];
}

+ (instancetype)withSubviews:(NSArray<UIView *> *)subviews
{
    UIView *view = [UIView new];

    for (UIView *subview in subviews) {
        [view addSubview:subview];
    }

    return view;
}

+ (instancetype)withSubviewsBlock:(NSArray<UIView *> *(^)())subviewsBlock
{
    NSArray<UIView *> *subviews = nil;
    if (subviewsBlock) {
        subviews = subviewsBlock();
    }

    return [self withSubviews:subviews];
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

- (UIView *)addView
{
    let view = [UIView new];
    [self addSubview:view];
    return view;
}

- (UIView *)addViewWithBgColor:(UIColor *)color
{
    let view = [UIView new];
    view.backgroundColor = color;
    [self addSubview:view];
    return view;
}

- (UIButton *)addButtonWithAction:(SEL)action
{
    let button = [UIButton withTarget:self action:action];
    [self addSubview:button];
    return button;
}

- (UIButton *)addButtonWithTarget:(id)target action:(SEL)action
{
    let button = [UIButton withTarget:target action:action];
    [self addSubview:button];
    return button;
}

- (UILabel *)addLabelWithFont:(UIFont *)font color:(UIColor *)color
{
    let label = [UILabel withFont:font color:color];
    [self addSubview:label];
    return label;
}

- (UILabel *)addLabel
{
    let label = [UILabel new];
    [self addSubview:label];
    return label;
}

- (UITapGestureRecognizer *)addTapWithTarget:(id)target action:(SEL)action
{
    let rec = [[UITapGestureRecognizer alloc] initWithTarget:target action:action];
    [self addGestureRecognizer:rec];
    self.userInteractionEnabled = YES;
    return rec;
}

@end
