////////////////////////////////////////////////////////////////////////////////
//
//  Fernwood
//  Created by ivan at 1.12.2017.
//
//  Copyright 2017 Loud & Clear Pty Ltd Pty Ltd
//  All Rights Reserved.
//
////////////////////////////////////////////////////////////////////////////////

#import "CCObject.h"


@interface CCViewController : UIViewController

@property (nonatomic) dispatch_block_t beforeSetup;
@property (nonatomic) dispatch_block_t afterSetup;

// For overriding
- (void)commonInit;
- (void)setup;
- (void)preLayout;
- (void)layout;
- (void)afterInitialLayout;

@property (nonatomic, readonly) BOOL initialLayoutDone;

@end
