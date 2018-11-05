////////////////////////////////////////////////////////////////////////////////
//
//  CopyObjectData
//  Created by ivan at 27.02.2018.
//
//  Copyright 2018 Ivan Zezyulya Pty Ltd
//  All Rights Reserved.
//
////////////////////////////////////////////////////////////////////////////////

#import <UIKit/UIKit.h>

@interface NSObject (CCMerge)

/// Use to copy value of properties from one object to another.
/// You may use it even with objects of different classes (if class is the same for same property name, value will be copied).
- (void)cc_mergeFrom:(id)object;

/// @param useCopy if YES and value conforms to NSCopying, [value copy] will be used instead of value when saving property.
- (void)cc_mergeFrom:(id)object useCopy:(BOOL)useCopy excludingProperties:(NSArray<NSString *> *)properties;

@end
