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

@interface CCTextField : UITextField

@property (nonatomic) BOOL hintAnimationDisabled;

@property (nonatomic) UIFont *hintFont;
@property (nonatomic) UIColor *hintTextColor;
@property (nonatomic) UIColor *hintTextColorInactive;
@property (nonatomic) CGFloat hintFontSizeActive;
@property (nonatomic) CGFloat hintFontSizeInactive;

- (void)update;

@end
