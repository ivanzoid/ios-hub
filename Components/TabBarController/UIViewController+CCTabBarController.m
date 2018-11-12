////////////////////////////////////////////////////////////////////////////////
//
//  Fernwood
//  Created by ivan at 14.03.2018.
//
//  Copyright 2018 Loud & Clear Pty Ltd Pty Ltd
//  All Rights Reserved.
//
////////////////////////////////////////////////////////////////////////////////

#import <ComponentsHub/NSObject+ChangeValueForKey.h>
#import "UIViewController+CCTabBarController.h"
#import "CCTabBarController.h"
#import "CCMacroses.h"
#import "CCWeakObjectContainer.h"


@implementation UIViewController (CCTabBarController)

//-------------------------------------------------------------------------------------------
#pragma mark - Initialization & Destruction
//-------------------------------------------------------------------------------------------

//-------------------------------------------------------------------------------------------
#pragma mark - Interface Methods
//-------------------------------------------------------------------------------------------

- (CCTabBarController *)cc_tabBarController
{
    return CCGetAssociatedObjectWeak(@selector(cc_tabBarController));
}

- (void)setCc_tabBarController:(CCTabBarController *)cc_tabBarController
{
    [self cc_changeValueForKey:CCSelectorToString(cc_tabBarController) block:^{
        CCSetAssociatedObjectWeak(@selector(cc_tabBarController), cc_tabBarController);
    }];
}

//-------------------------------------------------------------------------------------------
#pragma mark - Overridden Methods
//-------------------------------------------------------------------------------------------

//-------------------------------------------------------------------------------------------
#pragma mark - Private Methods
//-------------------------------------------------------------------------------------------

@end
