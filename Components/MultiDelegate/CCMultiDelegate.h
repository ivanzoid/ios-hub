////////////////////////////////////////////////////////////////////////////////
//
//  Momatu
//  Created by ivan at 13.11.2017.
//
//  Copyright 2017 LoudClear Pty Ltd
//  All Rights Reserved.
//
////////////////////////////////////////////////////////////////////////////////

@import Foundation;
#import "CCObject.h"


@interface CCMultiDelegate : CCObject

@property (nonatomic, readonly) NSHashTable *delegates;

- (void)addDelegate:(id)delegate;
- (void)removeDelegate:(id)delegate;
- (void)removeAllDelegates;

@end
