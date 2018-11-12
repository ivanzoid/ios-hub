////////////////////////////////////////////////////////////////////////////////
//
//  Fernwood
//  Created by ivan at 1.12.2017.
//
//  Copyright 2017 Loud & Clear Pty Ltd Pty Ltd
//  All Rights Reserved.
//
////////////////////////////////////////////////////////////////////////////////

#include "CCTabBarDelegate.h"

@protocol CCTabBarItem;


@protocol CCTabBar <NSObject>

@property (nonatomic) NSArray<id<CCTabBarItem>> *items;
@property (nonatomic) NSUInteger selectedIndex;

- (void)reload;
- (void)sizeToFitWidth:(CGFloat)width;

@property (nonatomic, weak) id<CCTabBarDelegate>delegate;

@end
