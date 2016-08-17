//
//  SecondSelectViewController.m
//  ShangTest
//
//  Created by len on 16/8/9.
//  Copyright © 2016年 sxt. All rights reserved.
//

#import "SecondSelectViewController.h"
#import "SecondSelectTableViewCell.h"
#import "TestTypeViewController.h"

@interface SecondSelectViewController ()

@property(strong,nonatomic)NSMutableArray *array;

@end

@implementation SecondSelectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.array = [NSMutableArray arrayWithObjects:@"javaScript",@"jsp",@"jQuery", nil];

    self.automaticallyAdjustsScrollViewInsets = NO;
    
    [self initViewLayout];
}

-(void)initViewLayout
{
    UITableView *table = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT-64)];
    table.delegate = self;
    table.dataSource = self;
//    [table flashScrollIndicators];
    
    [self.view addSubview:table];
    
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
    return _array.count;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"cell";
    SecondSelectTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"SecondSelectTableViewCell" owner:nil options:nil]firstObject];
    }
    
    cell.number.text = [NSString stringWithFormat:@"%ld",indexPath.row+1];
    cell.title.text = _array[indexPath.row];
    
    return  cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    TestTypeViewController *test = [[TestTypeViewController alloc]init];
    [self.navigationController pushViewController:test animated:YES];
}

@end
