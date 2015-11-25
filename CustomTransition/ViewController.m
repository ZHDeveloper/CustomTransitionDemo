//
//  ViewController.m
//  CustomTransition
//
//  Created by AdminZhiHua on 15/11/25.
//  Copyright © 2015年 AdminZhiHua. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"
#import "PushAnimating.h"
#import "OverlayViewController.h"
#import "PresentAnimation.h"

@interface ViewController ()<UINavigationControllerDelegate,UIViewControllerTransitioningDelegate>

@property (nonatomic,strong) NSArray *optionsArr;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.optionsArr = @[];
    
}


- (IBAction)pushDemoAction:(id)sender {
    
    SecondViewController *secondVC = [[SecondViewController alloc] init];
    
    UINavigationController *navi = [[UINavigationController alloc] initWithRootViewController:secondVC];
    
    navi.delegate = self;
    
    [self presentViewController:navi animated:YES completion:nil];
    
}


- (IBAction)modalDemoAction:(id)sender {
    
    OverlayViewController *overlayVC = [[OverlayViewController alloc] init];
    //自定义modal样式
    overlayVC.modalPresentationStyle = UIModalPresentationCustom;
    overlayVC.transitioningDelegate = self;
    
    [self presentViewController:overlayVC animated:YES completion:nil];
}



#pragma mark - UINavigationController的代理方法
- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC {
    
    PushAnimating *animating = [[PushAnimating alloc] initWithDuration:0.5 options:UIViewAnimationOptionTransitionFlipFromRight];
    
    return animating;
    
}

#pragma mark - UIViewControllerTransitioningDelegate代理
- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    
    return [[PresentAnimation alloc] init];
}


@end
