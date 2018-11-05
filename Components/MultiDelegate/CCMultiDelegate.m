////////////////////////////////////////////////////////////////////////////////
//
//  Momatu
//  Created by ivan at 13.11.2017.
//
//  Copyright 2017 LoudClear Pty Ltd
//  All Rights Reserved.
//
////////////////////////////////////////////////////////////////////////////////

#import "CCMultiDelegate.h"


@implementation CCMultiDelegate

//-------------------------------------------------------------------------------------------
#pragma mark - Initialization & Destruction
//-------------------------------------------------------------------------------------------

- (void)setup
{
    _delegates = [NSHashTable hashTableWithOptions:NSHashTableWeakMemory];
}

//-------------------------------------------------------------------------------------------
#pragma mark - Interface Methods
//-------------------------------------------------------------------------------------------

- (void)addDelegate:(id)delegate
{
    [_delegates addObject:delegate];
}

- (void)removeDelegate:(id)delegate
{
    [_delegates removeObject:delegate];
}

- (void)removeAllDelegates
{
    [_delegates removeAllObjects];
}

//-------------------------------------------------------------------------------------------
#pragma mark - Private Methods
//-------------------------------------------------------------------------------------------

- (BOOL)respondsToSelector:(SEL)selector
{
    if ([super respondsToSelector:selector]) {
        return YES;
    }

    for (id delegate in _delegates) {
        if (delegate && [delegate respondsToSelector:selector]) {
            return YES;
        }
    }

    return NO;
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)selector
{
    NSMethodSignature *signature = [super methodSignatureForSelector:selector];
    if (signature) {
        return signature;
    }

    if (_delegates.count == 0) {
        // return any method signature, it doesn't really matter
        return [self methodSignatureForSelector:@selector(description)];
    }

    for (id delegate in _delegates) {
        if (!delegate) {
            continue;
        }

        signature = [delegate methodSignatureForSelector:selector];
        if (signature) {
            break;
        }
    }

    return signature;
}

- (void)forwardInvocation:(NSInvocation *)invocation
{
    SEL selector = [invocation selector];

    NSArray *copiedDelegates = [_delegates allObjects];
    for (id delegate in copiedDelegates) {
        if (delegate && [delegate respondsToSelector:selector]) {
            [invocation invokeWithTarget:delegate];
        }
    }
}

@end
