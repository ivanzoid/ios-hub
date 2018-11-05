////////////////////////////////////////////////////////////////////////////////
//
//  CopyObjectData
//  Created by ivan at 7.03.2018.
//
//  Copyright 2018 Ivan Zezyulya Pty Ltd
//  All Rights Reserved.
//
////////////////////////////////////////////////////////////////////////////////

#import "NSObject+CCPropertiesNames.h"


@implementation NSObject (CCPropertiesNames)

//-------------------------------------------------------------------------------------------
#pragma mark - Initialization & Destruction
//-------------------------------------------------------------------------------------------

//-------------------------------------------------------------------------------------------
#pragma mark - Interface Methods
//-------------------------------------------------------------------------------------------

- (NSArray<NSString *> *)cc_propertiesNames
{
    unsigned int propertyCount;
    let propertyList = class_copyPropertyList([self class], &propertyCount);

    let result = [NSMutableArray<NSString *> new];

    for (unsigned int i = 0; i < propertyCount; i++) {
        let property = propertyList[i];
        let propertyName = [NSString stringWithUTF8String:property_getName(property)];
        [result addObject:propertyName];
    }

    free(propertyList);

    return result;
}

//-------------------------------------------------------------------------------------------
#pragma mark - Overridden Methods
//-------------------------------------------------------------------------------------------

//-------------------------------------------------------------------------------------------
#pragma mark - Private Methods
//-------------------------------------------------------------------------------------------

@end
