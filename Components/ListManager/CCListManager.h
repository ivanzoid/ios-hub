////////////////////////////////////////////////////////////////////////////////
//
//  Momatu
//  Created by ivan at 13.11.2017.
//
//  Copyright 2017 LoudClear Pty Ltd
//  All Rights Reserved.
//
////////////////////////////////////////////////////////////////////////////////

#import "CCObject.h"
#import "CCListManagerDelegate.h"
#import "CCListManagerLoaderType.h"


@interface CCListManager<ObjectType> : CCObject

@property (nonatomic, readonly) NSArray<ObjectType> *objects;
@property (nonatomic, readonly) BOOL hasMore;

/// If set to YES, method isObject:equalTo: (@see CCListManager+ForSubclasses.h) should be overridden in subclass.
@property (nonatomic) BOOL doNotAllowDuplicates;

- (void)addDelegateIfNeeded:(id<CCListManagerDelegate>)delegate;
- (void)removeDelegateIfNeeded:(id<CCListManagerDelegate>)delegate;

- (BOOL)update;
- (BOOL)forceReload;
- (BOOL)loadMore;

@end
