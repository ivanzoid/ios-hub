////////////////////////////////////////////////////////////////////////////////
//
//  Fernwood
//  Created by ivan at 13.03.2018.
//
//  Copyright 2018 Loud & Clear Pty Ltd Pty Ltd
//  All Rights Reserved.
//
////////////////////////////////////////////////////////////////////////////////

#import "UIApplication+CCLoader.h"
#import "CCMacroses.h"


@implementation UIApplication (CCLoader)

//-------------------------------------------------------------------------------------------
#pragma mark - Interface Methods
//-------------------------------------------------------------------------------------------

- (void)cc_showNetworkLoader
{
    if (self.cc_loaderClientCount.integerValue == 0) {
        self.networkActivityIndicatorVisible = YES;
    }

    self.cc_loaderClientCount = @(self.cc_loaderClientCount.integerValue + 1);
}

- (BOOL)cc_hideNetworkLoader
{
    BOOL didHide = NO;

    if (self.cc_loaderClientCount.integerValue == 1) {
        self.networkActivityIndicatorVisible = NO;
        didHide = YES;
    }

    self.cc_loaderClientCount = @(self.cc_loaderClientCount.integerValue - 1);

    return didHide;
}

+ (void)cc_showNetworkLoader
{
    [self.sharedApplication cc_showNetworkLoader];
}

+ (BOOL)cc_hideNetworkLoader
{
    return [self.sharedApplication cc_hideNetworkLoader];
}

//-------------------------------------------------------------------------------------------
#pragma mark - Overridden Methods
//-------------------------------------------------------------------------------------------

//-------------------------------------------------------------------------------------------
#pragma mark - Private Methods
//-------------------------------------------------------------------------------------------

- (NSNumber *)cc_loaderClientCount
{
    return CCGetAssociatedObject(@selector(cc_loaderClientCount));
}

- (void)setCc_loaderClientCount:(NSNumber *)cc_loaderClientCount
{
    CCSetAssociatedObject(@selector(cc_loaderClientCount), cc_loaderClientCount);
}

@end
