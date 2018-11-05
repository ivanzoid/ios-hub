////////////////////////////////////////////////////////////////////////////////
//
//  Fernwood
//  Created by ivan at 30.11.2017.
//
//  Copyright 2017 Loud & Clear Pty Ltd Pty Ltd
//  All Rights Reserved.
//
////////////////////////////////////////////////////////////////////////////////

#import "UIView+CCAnimate.h"
#import "CCMacroses.h"

static CGFloat const kDefaultAnimationDuration = 0.5;

static CGFloat const kDefaultSpringAnimationDamping = 1;
static CGFloat const kDefaultSpringAnimationVelocity = 0.5;

static UIViewAnimationOptions const kDefaultAnimationOptions = UIViewAnimationOptionBeginFromCurrentState;

@implementation UIView (CCAnimate)

+ (void)cc_animate:(BOOL)animate
          duration:(NSTimeInterval)duration
             delay:(NSTimeInterval)delay
           options:(UIViewAnimationOptions)options
         animation:(dispatch_block_t)animation
        completion:(dispatch_block_t)completion
{
    if (!animate) {
        CCSafeCall(animation);
        return;
    }

    [UIView animateWithDuration:duration
                          delay:delay
                        options:kDefaultAnimationOptions | options
                     animations:animation
                     completion:^(BOOL finished) {
        CCSafeCall(completion);
    }];
}

+ (void)cc_animate:(dispatch_block_t)animation
{
    [self cc_animate:YES
            duration:kDefaultAnimationDuration
               delay:0
             options:0
           animation:animation
          completion:nil];
}

+ (void)cc_animateWithDuration:(NSTimeInterval)duration animation:(dispatch_block_t)animation
{
    [self cc_animate:YES
            duration:duration
               delay:0
             options:0
           animation:animation
          completion:nil];
}

+ (void)cc_animateWithDelay:(NSTimeInterval)delay duration:(NSTimeInterval)duration animation:(dispatch_block_t)animation
{
    [self cc_animate:YES
            duration:duration
               delay:delay
             options:0
           animation:animation
          completion:nil];
}

+ (void)cc_animate:(dispatch_block_t)animation completion:(dispatch_block_t)completion
{
    [self cc_animate:YES
            duration:kDefaultAnimationDuration
               delay:0
             options:0
           animation:animation
          completion:completion];
}

+ (void)cc_animate:(BOOL)animated options:(UIViewAnimationOptions)options animation:(dispatch_block_t)animation
{
    [self cc_animate:animated
            duration:kDefaultAnimationDuration
               delay:0
             options:options
           animation:animation
          completion:nil];
}

+ (void)cc_animate:(BOOL)animated animation:(dispatch_block_t)animation
{
    [self cc_animate:animated
            duration:kDefaultAnimationDuration
               delay:0
             options:0
           animation:animation
          completion:nil];
}

+ (void)cc_animate:(BOOL)animated duration:(NSTimeInterval)duration animation:(dispatch_block_t)animation
{
    [self cc_animate:animated
            duration:duration
               delay:0
             options:0
           animation:animation
          completion:nil];
}

- (void)cc_animateCrossDissolve:(BOOL)animated duration:(NSTimeInterval)duration animation:(dispatch_block_t)animation
{
    if (!animated) {
        CCSafeCall(animation);
        return;
    }

    [UIView transitionWithView:self
                      duration:duration
                       options:UIViewAnimationOptionTransitionCrossDissolve
                    animations:animation
                    completion:nil];
}


- (void)cc_animateCrossDissolve:(BOOL)animated animation:(dispatch_block_t)animation
{
    if (!animated) {
        CCSafeCall(animation);
        return;
    }

    [UIView transitionWithView:self
                      duration:kDefaultAnimationDuration
                       options:UIViewAnimationOptionTransitionCrossDissolve
                    animations:animation
                    completion:nil];
}

+ (void)cc_animateSpring:(BOOL)animate
          duration:(NSTimeInterval)duration
             delay:(NSTimeInterval)delay
                 damping:(CGFloat)damping 
                velocity:(CGFloat)velocity
        options:(UIViewAnimationOptions)options
         animation:(dispatch_block_t)animation
        completion:(dispatch_block_t)completion
{
    if (!animate) {
        CCSafeCall(animation);
        return;
    }

    [UIView animateWithDuration:duration
                          delay:delay
         usingSpringWithDamping:damping
          initialSpringVelocity:velocity
                        options:kDefaultAnimationOptions | options
                     animations:animation
                     completion:^(BOOL finished)
            {
                CCSafeCall(completion);
            }];
}

+ (void)cc_animateSpring:(dispatch_block_t)animation
{
    [self cc_animateSpring:YES
                  duration:kDefaultAnimationDuration
                     delay:0
                   damping:kDefaultSpringAnimationDamping
                  velocity:kDefaultSpringAnimationVelocity
                   options:0
                 animation:animation
                completion:nil];
}

+ (void)cc_animateSpring:(dispatch_block_t)animation completion:(dispatch_block_t)completion
{
    [self cc_animateSpring:YES
                  duration:kDefaultAnimationDuration
                     delay:0
                   damping:kDefaultSpringAnimationDamping
                  velocity:kDefaultSpringAnimationVelocity
                   options:0
                 animation:animation
                completion:completion];
}

@end
