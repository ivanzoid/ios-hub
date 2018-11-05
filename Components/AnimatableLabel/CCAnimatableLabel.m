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

#import "CCAnimatableLabel.h"
#import <CoreText/CoreText.h>


@implementation CCAnimatableLabel
{
    CATextLayer *_textLayer;
}

- (instancetype)init
{
    self = [super init];
    if (!self) {
        return nil;
    }

    _textLayer = [CATextLayer new];
    _textLayer.contentsScale = [[UIScreen mainScreen] scale];
    _textLayer.anchorPoint = CGPointMake(0, 0);
    [self.layer addSublayer:_textLayer];

    self.fontSize = [UIFont systemFontSize];
    self.font = [UIFont systemFontOfSize:self.fontSize];
    self.textColor = [UIColor blackColor];

    return self;
}

//-------------------------------------------------------------------------------------------
#pragma mark - Interface Methods
//-------------------------------------------------------------------------------------------

- (void)setText:(NSString *)text
{
    _text = text;
    _textLayer.string = text;
}

- (void)setFont:(UIFont *)font
{
    _font = font;
    _textLayer.font = (__bridge CTFontRef) font;
}

- (void)setFontSize:(CGFloat)fontSize
{
    _fontSize = fontSize;
    _textLayer.fontSize = fontSize;
}

- (void)setTextColor:(UIColor *)textColor
{
    _textColor = textColor;
    _textLayer.foregroundColor = [textColor CGColor];
}

- (CGSize)sizeThatFits
{
    return [self sizeThatFits:CGSizeMake(CGFLOAT_MAX, CGFLOAT_MAX) withFontSize:_fontSize];
}

- (CGSize)sizeThatFits:(CGSize)size
{
    return [self sizeThatFits:size withFontSize:_fontSize];
}

- (CGSize)sizeThatFits:(CGSize)size withFontSize:(CGFloat)fontSize
{
    NSDictionary *attributes = @{NSFontAttributeName: [UIFont fontWithName:[_font fontName] size:fontSize]};
    CGRect rect = [_text boundingRectWithSize:size options:0 attributes:attributes context:nil];
    rect.size.height = rect.size.height + 3;
    return rect.size;
}

- (CGSize)sizeThatFitsFontSize:(CGFloat)fontSize
{
    return [self sizeThatFits:CGSizeMake(CGFLOAT_MAX, CGFLOAT_MAX) withFontSize:fontSize];
}

- (void)animateChangeFrame:(CGRect)newFrame fontSize:(CGFloat)fontSize duration:(NSTimeInterval)duration completion:(dispatch_block_t)completion
{
    BOOL enlarge = newFrame.size.width > self.frame.size.width;

    if (enlarge) {

        self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, newFrame.size.width, newFrame.size.height);

        [UIView animateWithDuration:duration animations:^{
            self.center = CGPointMake(newFrame.origin.x + newFrame.size.width/2, newFrame.origin.y + newFrame.size.height/2);
        }];

        [CATransaction begin];
        [CATransaction setDisableActions:YES];
        _textLayer.bounds = CGRectMake(0, 0, newFrame.size.width, newFrame.size.height);
        [CATransaction commit];

        [CATransaction begin];
        [CATransaction setAnimationDuration:duration];
        [CATransaction setAnimationTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
        [CATransaction setCompletionBlock:^
        {
            [CATransaction begin];
            [CATransaction setDisableActions:YES];

            self.frame = newFrame;

            [CATransaction commit];

            SafetyCall(completion);
        }];

        self.fontSize = fontSize;

        [CATransaction commit];
    }
    else {
        [UIView animateWithDuration:duration animations:^{
            self.center = CGPointMake(newFrame.origin.x + newFrame.size.width/2 + (self.frame.size.width/2 - newFrame.size.width/2), newFrame.origin.y + newFrame.size.height/2 + (self.frame.size.height/2 - newFrame.size.height/2));
        }];

        [CATransaction begin];
        [CATransaction setAnimationDuration:duration];
        [CATransaction setAnimationTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
        [CATransaction setCompletionBlock:^
        {
            [CATransaction begin];
            [CATransaction setDisableActions:YES];

            _textLayer.bounds = CGRectMake(0, 0, newFrame.size.width, newFrame.size.height);
            self.frame = newFrame;

            [CATransaction commit];

            SafetyCall(completion);
        }];

        self.fontSize = fontSize;

        [CATransaction commit];
    }
}

//-------------------------------------------------------------------------------------------
#pragma mark - Overridden Methods
//-------------------------------------------------------------------------------------------

- (void)layoutSubviews
{
    [super layoutSubviews];

    [CATransaction begin];
    [CATransaction setDisableActions:YES];

    _textLayer.bounds = CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height);

    [CATransaction commit];
}

@end
