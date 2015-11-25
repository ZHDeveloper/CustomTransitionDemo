//
//  PresentAnimation.m
//  CustomTransition
//
//  Created by AdminZhiHua on 15/11/25.
//  Copyright © 2015年 AdminZhiHua. All rights reserved.
//

#import "PresentAnimation.h"

@implementation PresentAnimation

- (instancetype)init {
    return [self initWithDuration:0.5 options:0];
}

- (instancetype)initWithDuration:(NSTimeInterval)duration options:(UIViewAnimationOptions)options {
    
    if ([super init]) {
        _options = options;
        _duration = duration;
    }
    return self;
}

#pragma mark - 代理方法
- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return self.duration;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    
//    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    //获取上下文的容器视图
    UIView *containerView = [transitionContext containerView];
    CGRect frame = containerView.bounds;
    
    frame = UIEdgeInsetsInsetRect(frame, UIEdgeInsetsMake(40, 40, 200, 40));
    
    toVC.view.frame = frame;
    
    [containerView addSubview:toVC.view];
    
    toVC.view.alpha = 0;
    toVC.view.transform = CGAffineTransformScale(toVC.view.transform, 0.3, 0.3);
    
    //获取动画的时间
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    
    [UIView animateWithDuration:duration*0.5 animations:^{
        toVC.view.alpha = 1;
    }];
    
    //弹力系数
    CGFloat damping = 0.55;
    //初始速度
    CGFloat velocity = 3;
    
    [UIView animateWithDuration:duration delay:0 usingSpringWithDamping:damping initialSpringVelocity:velocity options:0 animations:^{
        toVC.view.transform = CGAffineTransformIdentity;
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:YES];
    }];
    
}

@end
