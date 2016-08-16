//
//  SelectViewController.m
//  ShangTest
//
//  Created by len on 16/8/9.
//  Copyright © 2016年 sxt. All rights reserved.
//

#import "SelectViewController.h"
#import "SecondSelectViewController.h"

@interface SelectViewController ()

@end

@implementation SelectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initSubviews];
    
}

-(void)initSubviews
{
    UIButton *java = [[UIButton alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/2-30, SCREEN_HEIGHT/2-40, 60, 40)];
    [java setTitle:@"java" forState:UIControlStateNormal];
    [self.view addSubview:java];
    [java addTarget:self action:@selector(enterNext:) forControlEvents:UIControlEventTouchUpInside];
    
    
}

-(void)enterNext:(UIButton *)sender
{
    SecondSelectViewController *viewController = [[SecondSelectViewController alloc]init];
    [self.navigationController pushViewController:viewController animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
