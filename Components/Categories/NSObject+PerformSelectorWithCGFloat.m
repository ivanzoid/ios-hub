////////////////////////////////////////////////////////////////////////////////
//
//  LOUD&CLEAR
//  Copyright 2017 Loud&Clear Pty Ltd
//  All Rights Reserved.
//
//  NOTICE: Prepared by AppsQuick.ly on behalf of Loud&Clear. This software
//  is proprietary information. Unauthorized use is prohibited.
//
////////////////////////////////////////////////////////////////////////////////

#import "NSObject+PerformSelectorWithCGFloat.h"


@implementation NSObject (PerformSelectorWithCGFloat)

- (void)cc_performSelector:(SEL)selector withCGFloat:(CGFloat)value
{
    NSInvocation *inv = [NSInvocation invocationWithMethodSignature:[self methodSignatureForSelector:selector]];
    [inv setSelector:selector];

    [inv setArgument:&(value) atIndex:2];

    [inv invokeWithTarget:self];
}

@end
