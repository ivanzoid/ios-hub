////////////////////////////////////////////////////////////////////////////////
//
//  Momatu
//  Created by ivan at 13.11.2017.
//
//  Copyright 2017 LoudClear Pty Ltd
//  All Rights Reserved.
//
////////////////////////////////////////////////////////////////////////////////

#import "CCListManager.h"

typedef void (^CCListManagerGetDataBlock)(NSArray *objects, BOOL hasMore, NSError *error);


@interface CCListManager<ObjectType> (ForSubclasses)

- (void)reset;

// For overriding:

- (void)getObjectsFromDisk:(CCListManagerGetDataBlock)completion;
- (void)getObjectsFromNetworkWithOffset:(NSUInteger)offset completion:(CCListManagerGetDataBlock)completion;
- (BOOL)isObject:(ObjectType)object1 equalTo:(ObjectType)object2;

@end
