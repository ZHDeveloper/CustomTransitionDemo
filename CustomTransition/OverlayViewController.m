//
//  OverlayViewController.m
//  CustomTransition
//
//  Created by AdminZhiHua on 15/11/25.
//  Copyright © 2015年 AdminZhiHua. All rights reserved.
//

#import "OverlayViewController.h"

@interface OverlayViewController ()

@end

@implementation OverlayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.clipsToBounds = NO;
    
    self.view.layer.shadowColor = [UIColor blackColor].CGColor;
    self.view.layer.shadowOpacity = 0.5;
    self.view.layer.shadowRadius = 10;
    
    self.view.backgroundColor = [UIColor redColor];
    
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    UIBezierPath *shadowPath = [UIBezierPath bezierPathWithRect:self.view.bounds];
    self.view.layer.shadowPath = shadowPath.CGPath;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
