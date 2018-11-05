////////////////////////////////////////////////////////////////////////////////
//
//  Fernwood
//  Created by ivan at 4.05.2018.
//
//  Copyright 2018 Loud & Clear Pty Ltd Pty Ltd
//  All Rights Reserved.
//
////////////////////////////////////////////////////////////////////////////////

#import "UIViewController+CCFindParentControllerOfClass.h"


@implementation UIViewController (CCFindParentControllerOfClass)

- (instancetype)cc_findParentControllerOfClass:(Class)cls
{
    UIViewController *controller = self;

    while (YES)
    {
        if (!controller) {
            return self;
        }

        if ([controller isKindOfClass:cls]) {
            return controller;
        }

        controller = controller.parentViewController;
    }
}

//-------------------------------------------------------------------------------------------
#pragma mark - Initialization & Destruction
//-------------------------------------------------------------------------------------------

//-------------------------------------------------------------------------------------------
#pragma mark - Interface Methods
//-------------------------------------------------------------------------------------------

//-------------------------------------------------------------------------------------------
#pragma mark - Overridden Methods
//-------------------------------------------------------------------------------------------

//-------------------------------------------------------------------------------------------
#pragma mark - Private Methods
//-------------------------------------------------------------------------------------------

@end
