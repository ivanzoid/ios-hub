////////////////////////////////////////////////////////////////////////////////
//
//  CopyObjectData
//  Created by ivan at 27.02.2018.
//
//  Copyright 2018 Ivan Zezyulya Pty Ltd
//  All Rights Reserved.
//
////////////////////////////////////////////////////////////////////////////////

#import "NSObject+CCMerge.h"
#import "NSObject+CCPropertiesNames.h"
#import "CCMacroses.h"


@implementation NSObject (CCMerge)

//-------------------------------------------------------------------------------------------
#pragma mark - Initialization & Destruction
//-------------------------------------------------------------------------------------------

//-------------------------------------------------------------------------------------------
#pragma mark - Interface Methods
//-------------------------------------------------------------------------------------------

- (void)cc_mergeFrom:(id)object
{
    [self cc_mergeFrom:object useCopy:NO excludingProperties:nil];
}

- (void)cc_mergeFrom:(NSObject *)object useCopy:(BOOL)useCopy excludingProperties:(NSArray<NSString *> *)excludedProperties
{
    let differentClasses = ![self.class isEqual:object.class];

    NSArray<NSString *> *sourcePropertiesNames = nil;
    if (differentClasses) {
        sourcePropertiesNames = [object cc_propertiesNames];
    }
    let targetPropertiesNames = [self cc_propertiesNames];

    for (NSString *propertyName in targetPropertiesNames) {
        if (differentClasses && ![sourcePropertiesNames containsObject:propertyName]) {
            continue;
        }

        if ([excludedProperties containsObject:propertyName]) {
            continue;
        }

        if (differentClasses) {
            let sourcePropertyClass = [object cc_classOfPropertyNamed:propertyName];
            let targetPropertyClass = [self cc_classOfPropertyNamed:propertyName];
            if (![targetPropertyClass isSubclassOfClass:sourcePropertyClass]) {
                continue;
            }
        }

        id propertyValue = [object valueForKey:propertyName];
        id copiedValue = propertyValue;

        if (useCopy && [propertyValue conformsToProtocol:@protocol(NSCopying)]) {
            copiedValue = [propertyValue copy];
        }

        if (copiedValue) {
            [self setValue:copiedValue forKey:propertyName];
        }
    }
}

//-------------------------------------------------------------------------------------------
#pragma mark - Overridden Methods
//-------------------------------------------------------------------------------------------

//-------------------------------------------------------------------------------------------
#pragma mark - Private Methods
//-------------------------------------------------------------------------------------------

- (Class)cc_classOfPropertyNamed:(NSString *)propertyName
{
    Class propertyClass = nil;
    let property = class_getProperty([self class], [propertyName UTF8String]);
    let propertyAttributes = [NSString stringWithCString:property_getAttributes(property) encoding:NSUTF8StringEncoding];
    let splitPropertyAttributes = [propertyAttributes componentsSeparatedByString:@","];
    if (splitPropertyAttributes.count > 0) {
        let encodeType = splitPropertyAttributes[0];
        let splitEncodeType = [encodeType componentsSeparatedByString:@"\""];
        let className = splitEncodeType[1];
        propertyClass = NSClassFromString(className);
    }
    return propertyClass;
}

@end
