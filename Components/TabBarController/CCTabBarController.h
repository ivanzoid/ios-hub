////////////////////////////////////////////////////////////////////////////////
//
//  LOUD & CLEAR
//  Copyright 2017 Loud & Clear Pty Ltd Creative
//  All Rights Reserved.
//
////////////////////////////////////////////////////////////////////////////////

@import UIKit;
#import "CCTabBar.h"
#import "CCTabBarItem.h"
#import "CCTabBarPosition.h"
#import "CCViewController.h"

@interface CCTabBarController : CCViewController

@property (nonatomic) CCTabBarPosition tabBarPosition;
@property (nonatomic) UIView<CCTabBar> *tabBar;

@property (nonatomic) NSArray<id<CCTabBarItem>> *items;

@property (nonatomic) NSUInteger selectedIndex;

@end
