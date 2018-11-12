////////////////////////////////////////////////////////////////////////////////
//
//  Momatu
//  Created by ivan at 13.11.2017.
//
//  Copyright 2017 LoudClear Pty Ltd
//  All Rights Reserved.
//
////////////////////////////////////////////////////////////////////////////////

#import <ComponentsHub/NSObject+ChangeValueForKey.h>
#import <ComponentsHub/CCMutableCollections.h>
#import "CCListManager.h"
#import "CCListManager+ForSubclasses.h"
#import "CCMultiDelegate.h"
#import "CCMacroses.h"


@implementation CCListManager
{
    CCMultiDelegate *_multiDelegate;
    id<CCListManagerDelegate> _typedMultiDelegate;
    NSMutableArray *_objects;
    BOOL _gotFromNetwork;
    BOOL _loading;
    NSNumber *_currentUpdateId;
    NSNumber *_currentForceUpdateId;
}

@synthesize objects = _objects;

//-------------------------------------------------------------------------------------------
#pragma mark - Initialization & Destruction
//-------------------------------------------------------------------------------------------

- (void)setup
{
    _multiDelegate = [CCMultiDelegate new];
    _typedMultiDelegate = (id) _multiDelegate;
    _objects = [NSMutableArray new];

    [self getObjectsFromDisk:^(NSArray<id> *objects, BOOL hasMore, NSError *error) {
        if (_gotFromNetwork) {
            return;
        }
        if (objects) {
            _objects = [objects mutableArray];
            [_typedMultiDelegate listManager:self reloadedObjects:self.objects hasMore:hasMore];
        }
    }];
}


//-------------------------------------------------------------------------------------------
#pragma mark - Interface Methods
//-------------------------------------------------------------------------------------------

- (void)addDelegateIfNeeded:(id<CCListManagerDelegate>)delegate
{
    [_multiDelegate addDelegate:delegate];
}

- (void)removeDelegateIfNeeded:(id<CCListManagerDelegate>)delegate
{
    [_multiDelegate removeDelegate:delegate];
}

- (BOOL)update
{
    let loadType = (_objects.count == 0) ? CCListManagerLoaderTypeInitialLoad : CCListManagerLoaderTypeUpdate;
    [_typedMultiDelegate listManager:self startedLoadingOfType:loadType];

    _currentUpdateId = @(CFAbsoluteTimeGetCurrent());
    let __block updateId = _currentUpdateId;

    [self _getObjectsFromNetworkWithOffset:0 completion:^(NSArray *objects, BOOL hasMore, NSError *error)
    {
        if (updateId != _currentUpdateId) {
            return;
        }

        [_typedMultiDelegate listManager:self finishedLoadingOfType:loadType];
        if (error) {
            [_typedMultiDelegate listManager:self encounteredError:error];
            return;
        }

        _objects = objects ? [objects mutableArray] : [NSMutableArray new];
        [_typedMultiDelegate listManager:self reloadedObjects:_objects hasMore:hasMore];
    }];

    return YES;
}

- (BOOL)forceReload
{
    [_typedMultiDelegate listManager:self startedLoadingOfType:CCListManagerLoaderTypeForceReload];

    _currentForceUpdateId = @(CFAbsoluteTimeGetCurrent());
    let __block forceUpdateId = _currentForceUpdateId;

    [self _getObjectsFromNetworkWithOffset:0 completion:^(NSArray *objects, BOOL hasMore, NSError *error)
    {
        if (forceUpdateId != _currentForceUpdateId) {
            return;
        }

        [_typedMultiDelegate listManager:self finishedLoadingOfType:CCListManagerLoaderTypeForceReload];
        if (error) {
            [_typedMultiDelegate listManager:self encounteredError:error];
            return;
        }

        _objects = objects ? [objects mutableArray] : [NSMutableArray new];
        [_typedMultiDelegate listManager:self reloadedObjects:_objects hasMore:hasMore];
    }];

    return YES;
}

- (BOOL)loadMore
{
    if (_loading) {
        return NO;
    }

    [_typedMultiDelegate listManager:self startedLoadingOfType:CCListManagerLoaderTypeLoadingMore];

    [self _getObjectsFromNetworkWithOffset:_objects.count completion:^(NSArray *objects, BOOL hasMore, NSError *error) {
        [_typedMultiDelegate listManager:self finishedLoadingOfType:CCListManagerLoaderTypeLoadingMore];
        if (error) {
            [_typedMultiDelegate listManager:self encounteredError:error];
            return;
        }

        if (objects.count) {
            [self cc_changeValueForKey:CCSelectorToString(objects) block:^{
                [_objects addObjectsFromArray:objects];
            }];
        }
        [_typedMultiDelegate listManager:self loadedMoreObjects:objects hasMore:hasMore];
    }];

    return YES;
}

//-------------------------------------------------------------------------------------------
#pragma mark - For subclasses
//-------------------------------------------------------------------------------------------

- (void)getObjectsFromDisk:(CCListManagerGetDataBlock)completion
{
    CCSafeCall(completion, @[], NO, nil);
}

- (void)getObjectsFromNetworkWithOffset:(NSUInteger)offset completion:(CCListManagerGetDataBlock)completion;
{
    CCSafeCall(completion, @[], NO, nil);
}

- (void)reset
{
    _objects = [NSMutableArray new];
    [_typedMultiDelegate listManager:self reloadedObjects:@[] hasMore:NO];
}

//-------------------------------------------------------------------------------------------
#pragma mark - Overridden Methods
//-------------------------------------------------------------------------------------------

//-------------------------------------------------------------------------------------------
#pragma mark - Private Methods
//-------------------------------------------------------------------------------------------

- (void)_getObjectsFromNetworkWithOffset:(NSUInteger)offset completion:(CCListManagerGetDataBlock)completion
{
    _loading = YES;
    [self getObjectsFromNetworkWithOffset:offset completion:^(NSArray *objects, BOOL hasMore, NSError *error) {
        _loading = NO;
        if (!error) {
            _gotFromNetwork = YES;
            _hasMore = hasMore;
        }
        if (_doNotAllowDuplicates) {
            objects = [self deduplicatedObjects:objects];
        }
        CCSafeCall(completion, objects, hasMore, error);
    }];
}

- (NSArray *)deduplicatedObjects:(NSArray *)objects
{
    let newObjects = [NSMutableArray new];
    for (id receivedObject in objects) {
        for (id existingObject in _objects) {
            if (![self isObject:receivedObject equalTo:existingObject]) {
                [newObjects addObject:receivedObject];
            }
        }
    }
    return newObjects;
}

@end
