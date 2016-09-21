//
//  DetailedAnswerViewController.m
//  ShangTest
//
//  Created by len on 16/9/6.
//  Copyright © 2016年 sxt. All rights reserved.
//

#import "DetailedAnswerViewController.h"

@interface DetailedAnswerViewController ()<UIScrollViewDelegate>

@end

@implementation DetailedAnswerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"试题详解";
    self.Problemlbl.text = _ProblemStr;
    self.Answerlbl.text = _AnswerStr;
    //_scrollview.backgroundColor = [UIColor yellowColor];
    _scrollview.contentSize = CGSizeMake(SCREEN_WIDTH, SCREEN_HEIGHT * 2);
    _scrollview.scrollEnabled = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
