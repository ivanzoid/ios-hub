////////////////////////////////////////////////////////////////////////////////
//
//  Fernwood
//  Created by ivan at 1.03.2018.
//
//  Copyright 2018 Loud & Clear Pty Ltd Pty Ltd
//  All Rights Reserved.
//
////////////////////////////////////////////////////////////////////////////////

@interface NSArray (CCAddRemoveObjects)

- (NSMutableArray *)cc_arrayByRemovingObject:(id)object;
- (NSMutableArray *)cc_arrayByAddingObject:(id)object;

@end
