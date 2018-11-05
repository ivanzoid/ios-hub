////////////////////////////////////////////////////////////////////////////////
//
//  Fernwood
//  Created by ivan at 13.03.2018.
//
//  Copyright 2018 Loud & Clear Pty Ltd Pty Ltd
//  All Rights Reserved.
//
////////////////////////////////////////////////////////////////////////////////

#import <UIKit/UIKit.h>

@interface UIApplication (CCLoader)

- (void)cc_showNetworkLoader;
- (BOOL)cc_hideNetworkLoader;

+ (void)cc_showNetworkLoader;
+ (BOOL)cc_hideNetworkLoader;

@end
