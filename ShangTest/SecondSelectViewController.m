//
//  SecondSelectViewController.m
//  ShangTest
//
//  Created by len on 16/8/9.
//  Copyright © 2016年 sxt. All rights reserved.
//

#import "SecondSelectViewController.h"
#import "TestViewController.h"

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
    UITableView *table = [[UITableView alloc]initWithFrame:CGRectMake(0, 110, SCREEN_WIDTH, SCREEN_HEIGHT-110)];
    table.delegate = self;
    table.dataSource = self;
    [table flashScrollIndicators];
    
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
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    cell.textLabel.text = _array[indexPath.row];
    
    return  cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    TestViewController *test = [[TestViewController alloc]init];
    [self.navigationController pushViewController:test animated:YES];
}

@end
