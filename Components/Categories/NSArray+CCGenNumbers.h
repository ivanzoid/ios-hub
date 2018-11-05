////////////////////////////////////////////////////////////////////////////////
//
//  Fernwood
//  Created by ivan at 20.02.2018.
//
//  Copyright 2018 Loud & Clear Pty Ltd Pty Ltd
//  All Rights Reserved.
//
////////////////////////////////////////////////////////////////////////////////

@interface NSArray (CCGenNumbers)

+ (NSArray *)cc_generateNumbersFrom:(NSNumber *)from to:(NSNumber *)to step:(NSNumber *)step;
+ (NSArray *)cc_generateNumbersFrom:(NSNumber *)from toInclusive:(NSNumber *)to step:(NSNumber *)step;

@end
