////////////////////////////////////////////////////////////////////////////////
//
//  Fernwood
//  Created by ivan at 1.12.2017.
//
//  Copyright 2017 Loud & Clear Pty Ltd Pty Ltd
//  All Rights Reserved.
//
////////////////////////////////////////////////////////////////////////////////

#import "CCViewController.h"
#import "CCMacroses.h"
#import "UIView+Positioning.h"

@implementation CCViewController {
    BOOL _initialLayoutDone;
}

//-------------------------------------------------------------------------------------------
#pragma mark - Initialization & Destruction
//-------------------------------------------------------------------------------------------

- (instancetype)initWithNibName:(nullable NSString *)nibNameOrNil bundle:(nullable NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    CCSafeCall(_beforeSetup);
    [self setup];
    CCSafeCall(_afterSetup);
}

//-------------------------------------------------------------------------------------------
#pragma mark - Overridden Methods
//-------------------------------------------------------------------------------------------

- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];

    [self preLayout];
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];

    [self layout];

    if (!_initialLayoutDone && !CGSizeEqualToSize(self.view.size, CGSizeZero)) {
        _initialLayoutDone = YES;
        [self afterInitialLayout];
    }
}

//-------------------------------------------------------------------------------------------
#pragma mark - Interface Methods
//-------------------------------------------------------------------------------------------

- (void)commonInit
{

}

- (void)setup
{

}

- (void)preLayout
{

}

- (void)layout
{

}

- (void)afterInitialLayout
{

}

@end
