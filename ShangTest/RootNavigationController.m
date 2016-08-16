//
//  RootNavigationController.m
//  ShangTest
//
//  Created by len on 16/8/15.
//  Copyright © 2016年 sxt. All rights reserved.
//

#import "RootNavigationController.h"

@interface RootNavigationController ()

@end

@implementation RootNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.navigationBar.hidden = YES;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.viewControllers.count == 1) {
        self.navigationBar.hidden = NO;
    }
    
    [super pushViewController:viewController animated:animated];
}

- (nullable UIViewController *)popViewControllerAnimated:(BOOL)animated
{
    if (self.viewControllers.count <= 2) {
        self.navigationBar.hidden = YES;
    }
    return [super popViewControllerAnimated:animated];
}

- (nullable NSArray<__kindof UIViewController *> *)popToViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if ([self.viewControllers indexOfObject:viewController] == 0) {
        self.navigationBar.hidden = YES;
    }
    return [super popToViewController:viewController animated:
            animated];
}

- (nullable NSArray<__kindof UIViewController *> *)popToRootViewControllerAnimated:(BOOL)animated
{
    self.navigationBar.hidden = YES;
    return [super popToRootViewControllerAnimated:animated];
}


@end
