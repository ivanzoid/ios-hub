////////////////////////////////////////////////////////////////////////////////
//
//  LOUD&CLEAR
//  Copyright 2017 Loud&Clear Pty Ltd
//  All Rights Reserved.
//
//  NOTICE: Prepared by AppsQuick.ly on behalf of Loud&Clear. This software
//  is proprietary information. Unauthorized use is prohibited.
//
////////////////////////////////////////////////////////////////////////////////

#import "CCTextField.h"
#import "CCAnimatableLabel.h"
#import "CCNotificationUtils.h"
#import "NSObject+Observe.h"


@implementation CCTextField {
    CCAnimatableLabel *_placeholderLabel;
    BOOL _animationInProgress;
    BOOL _editing;

    NSString *_placeholder;
    NSAttributedString *_attributedPlaceholder;
}

//-------------------------------------------------------------------------------------------
#pragma mark - Initialization & Destruction
//-------------------------------------------------------------------------------------------

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (!self) {
        return nil;
    }

    [self commonSetup];

    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (!self) {
        return nil;
    }

    [self commonSetup];

    return self;
}

- (void)commonSetup
{
    _placeholderLabel = [CCAnimatableLabel new];
    _placeholderLabel.userInteractionEnabled = NO;

    [self addSubview:_placeholderLabel];
    [self updatePlaceholderNonAnimated];

    [self registerForNotification:UITextFieldTextDidBeginEditingNotification selector:@selector(cc_textFieldDidBeginEditing:)];
    [self registerForNotification:UITextFieldTextDidEndEditingNotification selector:@selector(cc_textFieldDidEndEditing:)];

    [self observe:self keys:@[@"text", @"attributedText" ] action:@selector(cc_textDidChange)];

    self.hintFont = [UIFont systemFontOfSize:[UIFont systemFontSize]];
    self.hintTextColor = UIColor.blackColor;
    self.hintFontSizeActive = 10;
    self.hintFontSizeInactive = 14;
    [self update];
}

//-------------------------------------------------------------------------------------------
#pragma mark - Overridden Methods
//-------------------------------------------------------------------------------------------

- (void)setPlaceholder:(NSString *)placeholder
{
    _placeholder = placeholder;

    _placeholderLabel.text = placeholder;
}

- (NSString *)placeholder
{
    return _placeholder;
}

- (void)setAttributedPlaceholder:(NSAttributedString *)attributedPlaceholder
{
    _attributedPlaceholder = attributedPlaceholder;

    _placeholderLabel.text = self.attributedPlaceholder.string;
}

- (NSAttributedString *)attributedPlaceholder
{
    return _attributedPlaceholder;
}

//-------------------------------------------------------------------------------------------
#pragma mark - Event handlers
//-------------------------------------------------------------------------------------------

- (void)cc_textDidChange
{
    if (!_animationInProgress && !_editing) {
        [self updatePlaceholderNonAnimated];
    }
}

- (void)cc_textFieldDidBeginEditing:(NSNotification *)notification
{
    if ([notification object] != self) {
        return;
    }

    _editing = YES;
    [self updatePlaceholderAnimatedIfNeeded];
}

- (void)cc_textFieldDidEndEditing:(NSNotification *)notification
{
    if ([notification object] != self) {
        return;
    }

    _editing = NO;
    [self updatePlaceholderAnimatedIfNeeded];
}

//-------------------------------------------------------------------------------------------
#pragma mark - Private Methods
//-------------------------------------------------------------------------------------------

- (void)update
{
    _placeholderLabel.textColor = _hintTextColorInactive;
    _placeholderLabel.font = [UIFont fontWithName:_hintFont.fontName size:_hintFontSizeInactive];
}

- (void)updatePlaceholderAnimatedIfNeeded
{
    if (_hintAnimationDisabled) {
        [self updatePlaceholderNonAnimated];
    } else {
        [self updatePlaceholderAnimated];
    }
}

- (void)updatePlaceholderAnimated
{
    _animationInProgress = YES;

    CGFloat newFontSize = _hintFontSizeActive;
    CGRect newRect = CGRectZero;

    [self placeholderRectAndFontForCurrentState:&newRect fontSize:&newFontSize];

    [_placeholderLabel animateChangeFrame:newRect fontSize:newFontSize duration:0.3 completion:^{
        _animationInProgress = NO;
    }];
}

- (void)placeholderRectAndFontForCurrentState:(CGRect *)rectPtr fontSize:(CGFloat *)fontSizePtr
{
    BOOL inTopPosition = [self shouldBeInTopPosition];
    CGFloat newFontSize = inTopPosition ? _hintFontSizeActive : _hintFontSizeInactive;

    CGRect originalPlaceholderFrame = [self placeholderRectForBounds:self.bounds];

    CGSize newSize = [_placeholderLabel sizeThatFitsFontSize:newFontSize];
    CGRect newRect = CGRectZero;

    if (inTopPosition) {
        CGFloat top = originalPlaceholderFrame.origin.y - newSize.height + 2;
        if (CCIOSVersionGreaterThanOrEqualTo(11)) {
            top = originalPlaceholderFrame.origin.y - newSize.height - 10;
        }
        
        newRect = CGRectMake(originalPlaceholderFrame.origin.x,
                             top,
                             newSize.width,
                             newSize.height);
    } else {
        newRect = CGRectMake(originalPlaceholderFrame.origin.x,
                             originalPlaceholderFrame.origin.y + (originalPlaceholderFrame.size.height - newSize.height)/2,
                             newSize.width,
                             newSize.height);
    }

    if (fontSizePtr) {
        *fontSizePtr = newFontSize;
    }

    if (rectPtr) {
        *rectPtr = newRect;
    }
}

- (void)updatePlaceholderNonAnimated
{
    CGFloat newFontSize = 10;
    CGRect newRect = CGRectZero;

    [self placeholderRectAndFontForCurrentState:&newRect fontSize:&newFontSize];
    
    [CATransaction begin];
    [CATransaction setDisableActions:YES];
    _placeholderLabel.fontSize = newFontSize;
    [CATransaction commit];

    _placeholderLabel.frame = newRect;
}

- (BOOL)shouldBeInTopPosition
{
    return ([self isEditing] || [self.text length] != 0 || [self.attributedText length] != 0);
}

- (void)layoutSubviews
{
    [super layoutSubviews];

    if ((!_animationInProgress && !_editing) || _hintAnimationDisabled) {
        [self updatePlaceholderNonAnimated];
    }
}


@end
