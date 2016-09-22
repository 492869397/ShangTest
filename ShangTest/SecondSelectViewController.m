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

#import "ModuleModel.h"



#define LINK_MODULE @"http://139.224.73.86:8080/sxt_studentsystem/selectTModule.do"

@interface SecondSelectViewController ()

@property(strong,nonatomic)NSMutableArray *array;

@property(strong,nonatomic)UITableView *table;

@end

@implementation SecondSelectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"考试测试";
    
    self.array = [NSMutableArray array];

    self.automaticallyAdjustsScrollViewInsets = NO;
    
    [self initViewLayout];

    
    [self getDataFromNet];
    
}

-(void)initViewLayout
{
    self.table = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT-64)];
    _table.delegate = self;
    _table.dataSource = self;
    
    _table.rowHeight = 70;
    
    [self.view addSubview:_table];
    
}

-(void)getDataFromNet
{
    [self showMessage:@"加载中..."];
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager POST:LINK_MODULE parameters:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        
        [self hiddenWaitHUD];
        
        NSArray *arr = responseObject[@"result"];
        
        [self.array removeAllObjects];
        
        for (NSDictionary *dic in arr) {
            ModuleModel *m = [ModuleModel creatModuleWithDict:dic];
            [_array addObject:m];
        }
        
        
        
        
        [_table reloadData];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [self hiddenWaitHUD];
        
        [self showHUDWithMessage:@"网络连接失败" HiddenDelay:0.5];
    }];
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
    
    
    ModuleModel *module = _array[indexPath.row];
    cell.module = module;
    cell.number.text = [NSString stringWithFormat:@"%ld",indexPath.row+1];
    
    return  cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    TestTypeViewController *test = [[TestTypeViewController alloc]init];
    ModuleModel *m = _array[indexPath.row];
    test.module_code = m.module_code;
    
    test.title = m.module_name;
    
    [self.navigationController pushViewController:test animated:YES];
}

@end
