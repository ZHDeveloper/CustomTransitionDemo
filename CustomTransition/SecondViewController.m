//
//  SecondViewController.m
//  CustomTransition
//
//  Created by AdminZhiHua on 15/11/25.
//  Copyright © 2015年 AdminZhiHua. All rights reserved.
//

#import "SecondViewController.h"

// 颜色
#define HMColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
#define HMColorRGBA(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:a]

// 随机色
#define HMRandomColor HMColor(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256))

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = HMRandomColor;
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"push" style:UIBarButtonItemStylePlain target:self action:@selector(rightBtnItemAction)];

}

- (void)rightBtnItemAction {
    
    SecondViewController *secondViewController = [[SecondViewController alloc] init];
    
    [self.navigationController pushViewController:secondViewController animated:YES];
    
}

@end
