////////////////////////////////////////////////////////////////////////////////
//
//  Fernwood
//  Created by ivan at 30.11.2017.
//
//  Copyright 2017 Loud & Clear Pty Ltd Pty Ltd
//  All Rights Reserved.
//
////////////////////////////////////////////////////////////////////////////////

@import UIKit;


@interface UIView (CCAnimate)

+ (void)cc_animate:(BOOL)animate
          duration:(NSTimeInterval)duration
             delay:(NSTimeInterval)delay
           options:(UIViewAnimationOptions)options // UIViewAnimationOptionBeginFromCurrentState is appended all the times
         animation:(dispatch_block_t)animation
        completion:(dispatch_block_t)completion;

+ (void)cc_animate:(dispatch_block_t)animation;
+ (void)cc_animateWithDuration:(NSTimeInterval)duration animation:(dispatch_block_t)animation;
+ (void)cc_animate:(dispatch_block_t)animation completion:(dispatch_block_t)completion;
+ (void)cc_animateWithDelay:(NSTimeInterval)delay duration:(NSTimeInterval)duration animation:(dispatch_block_t)animation;
+ (void)cc_animate:(BOOL)animated animation:(dispatch_block_t)animation;
+ (void)cc_animate:(BOOL)animated duration:(NSTimeInterval)duration animation:(dispatch_block_t)animation;

- (void)cc_animateCrossDissolve:(BOOL)animated duration:(NSTimeInterval)duration animation:(dispatch_block_t)animation;
- (void)cc_animateCrossDissolve:(BOOL)animated animation:(dispatch_block_t)animation;

+ (void)cc_animateSpring:(BOOL)animate
                duration:(NSTimeInterval)duration
                   delay:(NSTimeInterval)delay
                 damping:(CGFloat)damping
                velocity:(CGFloat)velocity
                 options:(UIViewAnimationOptions)options
               animation:(dispatch_block_t)animation
              completion:(dispatch_block_t)completion;

+ (void)cc_animateSpring:(dispatch_block_t)animation;
+ (void)cc_animateSpring:(dispatch_block_t)animation completion:(dispatch_block_t)completion;

@end
