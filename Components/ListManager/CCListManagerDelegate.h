////////////////////////////////////////////////////////////////////////////////
//
//  Momatu
//  Created by ivan at 13.11.2017.
//
//  Copyright 2017 LoudClear Pty Ltd
//  All Rights Reserved.
//
////////////////////////////////////////////////////////////////////////////////

#import "CCListManagerLoaderType.h"

@class CCListManager;

@protocol CCListManagerDelegate<NSObject>

@optional
- (void)listManager:(__kindof CCListManager *)listManager startedLoadingOfType:(CCListManagerLoaderType)type;
- (void)listManager:(__kindof CCListManager *)listManager finishedLoadingOfType:(CCListManagerLoaderType)type;
- (void)listManager:(__kindof CCListManager *)listManager reloadedObjects:(NSArray *)objects hasMore:(BOOL)hasMore;
- (void)listManager:(__kindof CCListManager *)listManager loadedMoreObjects:(NSArray *)objects hasMore:(BOOL)hasMore;
- (void)listManager:(__kindof CCListManager *)listManager encounteredError:(NSError *)error;

@end
