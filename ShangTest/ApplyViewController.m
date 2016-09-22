//
//  ApplyViewController.m
//  ShangTest
//
//  Created by len on 16/8/15.
//  Copyright © 2016年 sxt. All rights reserved.
//

#import "ApplyViewController.h"
#import "SchoolTableViewCell.h"
#import "SchoolDetailViewController.h"
#import "ProblemViewController.h"

#import "StaticStarLevelView.h"

#import <SDCycleScrollView.h>

@interface ApplyViewController ()

@property(strong,nonatomic)UIView *headerView;

@property(strong,nonatomic)NSArray *array;

@end

@implementation ApplyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self initViewLayout];
    
    
}

-(void)initViewLayout
{
    UIView *v = [[UIView alloc]initWithFrame:CGRectMake(0,64,SCREEN_WIDTH,1)];
    [self.view addSubview:v];
    
    //tableview头视图
    self.headerView = [[UIView alloc]init];
    
    NSArray *a = @[@"studytop.jpg",@"2"];
    
    SDCycleScrollView *adview = [SDCycleScrollView cycleScrollViewWithFrame:CGRectZero imageNamesGroup:a];
    [_headerView addSubview:adview];
    
    [adview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_headerView);
        make.left.right.equalTo(_headerView);
        make.height.mas_equalTo(SCREEN_WIDTH/3.83);
    }];
    
    UIView *buttonView = [[UIView alloc]init];
    [_headerView addSubview:buttonView];
    

    
    [buttonView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(adview.bottom).offset(0);
        make.left.right.equalTo(_headerView);
        make.height.equalTo(@70);
    }];
    
    UIView *v1 = [self setButtonViewWithImage:@"p1.png" Title:@"报名流程" withSEL:(@selector(tapView:))];
    UIView *v2 = [self setButtonViewWithImage:@"p2.png" Title:@"学习流程" withSEL:(@selector(tapView:))];
    UIView *v3 = [self setButtonViewWithImage:@"p3.png" Title:@"服务保障" withSEL:(@selector(tapView:))];
    UIView *v4 = [self setButtonViewWithImage:@"p4.png" Title:@"常见问题" withSEL:(@selector(tapView:))];
    
    v1.tag = 1;
    v2.tag = 2;
    v3.tag = 3;
    v4.tag = 4;
    
    [buttonView addSubview:v1];
    [buttonView addSubview:v2];
    [buttonView addSubview:v3];
    [buttonView addSubview:v4];
    
    
    [v1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(buttonView);
        make.width.equalTo(v2);
        make.width.equalTo(v3);
        make.width.equalTo(v4);
        make.left.equalTo(buttonView);
        make.right.equalTo(v2.mas_left);
    }];
    [v3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(buttonView);
        make.left.equalTo(v2.mas_right);
        make.right.equalTo(v4.mas_left);
    }];
    [v2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(buttonView);
    }];
    [v4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(buttonView);
        make.right.equalTo(buttonView);
    }];
    
    
    
    UITableView *table = [[UITableView alloc]init];
    table.delegate = self;
    table.dataSource = self;
    table.rowHeight = 84;
    [self.view addSubview:table];
    

    table.frame = CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT-49-64);
    
    _headerView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 170);
    
    table.tableHeaderView = _headerView;
    
    
}

-(UIView*)setButtonViewWithImage:(NSString*)imageName Title:(NSString*)title withSEL:(SEL)sel
{
    UIView *view = [[UIView alloc]init];
    UIImage *image = [UIImage imageNamed:imageName];
    UIImageView *img = [[UIImageView alloc]initWithImage:image];
    UILabel *label = [[UILabel alloc]init];
    label.text = title;
    
    
    [view addSubview:img];
    [view addSubview:label];
    [self.view addSubview:view];
    
    [img mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(view);
        make.height.width.equalTo(@35);
        make.top.equalTo(view);
        make.bottom.equalTo(label.mas_top).offset(-5);
    }];
    
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(view);
        make.bottom.equalTo(view);
    }];
    
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:sel];
    [view addGestureRecognizer:tap];
    
    return view;
}


-(void)tapView:(UITapGestureRecognizer*)tap
{
    ProblemViewController *pro = [[ProblemViewController alloc]init];
    [self.tabBarController.navigationController pushViewController:pro animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"cell";
    SchoolTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"SchoolTableViewCell" owner:nil options:nil]firstObject];
    }
    
    if (![cell viewWithTag:10]) {
        StaticStarLevelView *v = [[StaticStarLevelView alloc]initWithFrame:CGRectMake(0, 0, 75, 15)];
        [v setScore:1];
        v.tag = 10;
        [cell.starView addSubview:v];
    }
    
    
    
    
    return  cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    SchoolDetailViewController *school = [[SchoolDetailViewController alloc]init];
    [self.tabBarController.navigationController pushViewController:school animated:YES];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


@end
