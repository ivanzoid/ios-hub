////////////////////////////////////////////////////////////////////////////////
//
//  Fernwood
//  Created by ivan at 1.12.2017.
//
//  Copyright 2017 Loud & Clear Pty Ltd Pty Ltd
//  All Rights Reserved.
//
////////////////////////////////////////////////////////////////////////////////


@protocol CCTabBarItem <NSObject>

@property (nonatomic) Class controllerClass;
@property (nonatomic) void(^controllerSetupBlock)(id controller);

@end
