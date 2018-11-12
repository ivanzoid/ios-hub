////////////////////////////////////////////////////////////////////////////////
//
//  LOUD & CLEAR
//  Copyright 2017 Loud & Clear Pty Ltd Creative
//  All Rights Reserved.
//
////////////////////////////////////////////////////////////////////////////////

#import "CCTabBarController.h"
#import "UIViewController+Child.h"
#import "UIViewController+CCTabBarController.h"
#import "UIView+Positioning.h"
#import "CCMacroses.h"


@interface UIViewController ()
+ (id)newUsingTyphoon;
@end

@interface CCTabBarController () <CCTabBarDelegate>
@end

@implementation CCTabBarController
{
    UITabBarController *_tabBarController;
}

//-------------------------------------------------------------------------------------------
#pragma mark - Initialization & Destruction
//-------------------------------------------------------------------------------------------

- (void)setup
{
    [super setup];

    _tabBarController = [UITabBarController new];
    _tabBarController.tabBar.hidden = YES;
    [self cc_addChildController:_tabBarController];

    self.tabBar = _tabBar;
}

//-------------------------------------------------------------------------------------------
#pragma mark - Interface Methods
//-------------------------------------------------------------------------------------------

- (void)setTabBar:(UIView<CCTabBar> *)tabBar
{
    [_tabBar removeFromSuperview];

    _tabBar = tabBar;
    if (_tabBar) {
        [self.view addSubview:_tabBar];
        _tabBar.delegate = self;
    }

    [self.view setNeedsLayout];
}

- (void)setItems:(NSArray<id<CCTabBarItem>> *)items
{
    _items = items;

    _tabBar.items = _items;

    [self update];

    self.selectedIndex = 0;
}

- (void)setSelectedIndex:(NSUInteger)selectedIndex
{
    _selectedIndex = selectedIndex;

    _tabBar.selectedIndex = selectedIndex;
    _tabBarController.selectedIndex = selectedIndex;
}

//-------------------------------------------------------------------------------------------
#pragma mark - Overridden Methods
//-------------------------------------------------------------------------------------------

- (void)layout
{
    [super layout];

    [_tabBar sizeToFitWidth:self.view.width];
    [_tabBarController.view fitHorizontallyToSuperview];

    if (_tabBarPosition == CCTabBarPositionTop) {
        [_tabBar pinTopToSuperview];
        [_tabBarController.view fitVerticallyBetweenViewAndSuperview:_tabBar];
    } else if (_tabBarPosition == CCTabBarPositionBottom) {
        [_tabBar pinBottomToSuperview];
        [_tabBarController.view fitVerticallyBetweenSuperviewAndView:_tabBar];
    }
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return _tabBarController.selectedViewController.preferredStatusBarStyle;
}

- (BOOL)prefersStatusBarHidden
{
    return _tabBarController.selectedViewController.prefersStatusBarHidden;
}

- (UIStatusBarAnimation)preferredStatusBarUpdateAnimation
{
    return _tabBarController.selectedViewController.preferredStatusBarUpdateAnimation;
}

//-------------------------------------------------------------------------------------------
#pragma mark - <CCTabBarDelegate>
//-------------------------------------------------------------------------------------------

- (void)tabBar:(id<CCTabBar>)tabBar didSelectTabAtIndex:(NSUInteger)index
{
    _tabBarController.selectedIndex = index;
}

//-------------------------------------------------------------------------------------------
#pragma mark - Event Handlers
//-------------------------------------------------------------------------------------------



//-------------------------------------------------------------------------------------------
#pragma mark - Private Methods
//-------------------------------------------------------------------------------------------

- (void)update
{
    let controllers = [NSMutableArray<UIViewController *> new];

    for (id<CCTabBarItem> item in _items) {
        UIViewController *controller = nil;
        if ([item conformsToProtocol:@protocol(CCTabBarItem)]) {
            if ([item.controllerClass respondsToSelector:@selector(newUsingTyphoon)]) {
                controller = (id) [item.controllerClass newUsingTyphoon];
            } else {
                controller = (id) [item.controllerClass new];
            }
            CCSafeCall(item.controllerSetupBlock, controller);
        }
        if (!controller) {
            controller = [UIViewController new];
        }
        if (![controller isKindOfClass:[UIViewController class]]) {
            NSAssert(NO, nil);
            controller = [UIViewController new];
        }
        controller.cc_tabBarController = self;
        [controllers addObject:controller];
    }

    _tabBarController.viewControllers = controllers;
    if (controllers.count) {
        _tabBarController.selectedIndex = 0;
    }
}

@end
