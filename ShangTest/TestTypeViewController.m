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



#define LINK_SUITE @"http://139.224.73.86:8080/sxt_studentsystem/selectTSuite.do"

@interface TestTypeViewController ()

@property(nonatomic,assign)NSInteger index;

@property(nonatomic,strong)NSMutableArray *dataArray;
@property(nonatomic,strong)NSMutableArray *easyArray;
@property(nonatomic,strong)NSMutableArray *normolArray;
@property(nonatomic,strong)NSMutableArray *hardArray;
@property (weak, nonatomic) IBOutlet UITableView *table;

@end

@implementation TestTypeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.easyArray = [NSMutableArray array];
    self.normolArray = [NSMutableArray array];
    self.hardArray = [NSMutableArray array];
    self.dataArray = [NSMutableArray arrayWithObjects:_easyArray,_normolArray,_hardArray, nil];
    _index = 1;
    
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
            
            [_easyArray removeAllObjects];
            [_normolArray removeAllObjects];
            [_hardArray removeAllObjects];
            
            for (NSDictionary *dic in arr) {
                SuiteModel *s = [SuiteModel creatSuiteWithDict:dic];
                
                if ([dic[@"type"] isEqualToString:@"初级"]) {
                    [_easyArray addObject:s];
                }else if([dic[@"type"] isEqualToString:@"中级"])
                {
                    [_normolArray addObject:s];
                }else if ([dic[@"type"] isEqualToString:@"高级"])
                    [_hardArray addObject:s];
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
    NSArray *arr = _dataArray[_index - 1];
    return arr.count;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TestTypeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (cell == nil) {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"TestTypeTableViewCell" owner:nil options:nil]firstObject];
        
    }
    
    cell.delegate = self;
    
    cell.number.text = [NSString stringWithFormat:@"%ld",indexPath.row+1];
    
    NSArray *arr = _dataArray[_index - 1];
    SuiteModel *suite = arr[indexPath.row];
    cell.suite = suite;
    
    return  cell;
}

- (IBAction)selectType:(UIButton *)sender {
    
    _index = sender.tag;
    
    [_table reloadData];
    
}

@end
