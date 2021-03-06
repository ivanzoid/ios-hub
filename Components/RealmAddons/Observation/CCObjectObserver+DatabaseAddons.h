////////////////////////////////////////////////////////////////////////////////
//
//  FANHUB
//  Copyright 2016 FanHub Pty Ltd
//  All Rights Reserved.
//
//  NOTICE: Prepared by AppsQuick.ly on behalf of FanHub. This software
//  is proprietary information. Unauthorized use is prohibited.
//
////////////////////////////////////////////////////////////////////////////////

#import <Foundation/Foundation.h>
#import "CCObjectObserver.h"

@interface CCObjectObserver (DatabaseAddons)

- (BOOL)isSerializableKeyPath:(NSString *)key forInstance:(id)instance;

- (NSString *)dataKeyFromObjectKey:(NSString *)key;

- (NSDictionary *)deserializeValuesInChangeDictionary:(NSDictionary *)dictionary withObjectKey:(NSString *)objectKey
                                             instance:(id)instance;
@end
