//
//  TestTypeViewController.m
//  ShangTest
//
//  Created by len on 16/8/17.
//  Copyright © 2016年 sxt. All rights reserved.
//

#import "TestTypeViewController.h"
#import "TestTypeTableViewCell.h"
#import "SuiteModel.h"



#define LINK_SUITE @"http://123.57.28.11:8080/sxt_studentsystem/selectTSuite.do"

@interface TestTypeViewController ()

@property(nonatomic,strong)NSMutableArray *dataArray;
@property (weak, nonatomic) IBOutlet UITableView *table;

@end

@implementation TestTypeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.dataArray = [NSMutableArray array];
    
    [self getDataFromNet];
    
}

-(void)getDataFromNet
{
    [self showMessage:@"加载中..."];
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    NSDictionary *pass = [NSDictionary dictionaryWithObjectsAndKeys:_module_code,@"module_code", nil];
    
    [manager POST:LINK_SUITE parameters:pass success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        
        [self hiddenWaitHUD];
        
        if ([responseObject[@"result"] isKindOfClass:[NSArray class]]) {
            NSArray *arr = responseObject[@"result"];
            [_dataArray removeAllObjects];
            
            for (NSDictionary *dic in arr) {
                SuiteModel *s = [SuiteModel creatSuiteWithDict:dic];
                [_dataArray addObject:s];
            }
            
            [_table reloadData];
        }
        
        
        
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
    return _dataArray.count;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TestTypeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (cell == nil) {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"TestTypeTableViewCell" owner:nil options:nil]firstObject];
        
    }
    
    cell.delegate = self;
    
    cell.number.text = [NSString stringWithFormat:@"%ld",indexPath.row+1];
    
    SuiteModel *suite = _dataArray[indexPath.row];
    cell.suite = suite;
    
    return  cell;
}


@end
