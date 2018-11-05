////////////////////////////////////////////////////////////////////////////////
//
//  Fernwood
//  Created by ivan at 6.06.2018.
//
//  Copyright 2018 Loud & Clear Pty Ltd Pty Ltd
//  All Rights Reserved.
//
////////////////////////////////////////////////////////////////////////////////

@interface NSArray<__covariant ObjectType> (CCForEach)

- (void)cc_forEach:(void (__attribute__((noescape)) ^)(ObjectType object))block;

@end
