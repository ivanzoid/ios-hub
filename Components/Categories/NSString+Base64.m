////////////////////////////////////////////////////////////////////////////////
//
//  Fernwood
//  Created by ivan at 13.02.2018.
//
//  Copyright 2018 Loud & Clear Pty Ltd Pty Ltd
//  All Rights Reserved.
//
////////////////////////////////////////////////////////////////////////////////

#import "NSString+Base64.h"
#import "CCMacroses.h"

@implementation NSString (Base64)

- (NSString *)base64String
{
    let data = [self dataUsingEncoding:NSUTF8StringEncoding];
    let base64String = [data base64EncodedStringWithOptions:0];
    return base64String;
}

@end
