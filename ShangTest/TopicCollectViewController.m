//
//  TopicCollectViewController.m
//  SHANG
//
//  Created by len on 16/8/25.
//  Copyright (c) 2016年 com.sxt. All rights reserved.
//

#import "TopicCollectViewController.h"
#import "AFNetworking.h"
#import "PracticeHistoryTableViewCell.h"
#import "PracticeHistoryModel.h"


#define URL @"http://139.224.73.86:8080/sxt_studentsystem/selectTCollection4.do"

@interface TopicCollectViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic ,strong)UITableView *TableView;
@property (nonatomic ,strong)NSMutableArray *array;
@property (nonatomic ,strong)NSDictionary *Dic;
@property (nonatomic , nonatomic) UILabel *lblNum;

@end

@implementation TopicCollectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"习题收藏";
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.TableView];
    [self requestMethod];
    [self.view addSubview:self.lblNum];
    
}
#pragma mark Request 请求方法
-(void)requestMethod{
    
    [self showMessage:@"正在加载"];
    
    NSMutableDictionary *params2=[NSMutableDictionary dictionary];
    params2[@"student_id"] = @"201505050101002";
    AFHTTPRequestOperationManager *mgr2=[AFHTTPRequestOperationManager manager];
    [mgr2 POST:URL parameters:params2  success:^(AFHTTPRequestOperation * operation, id responsObject)
     {
         [self hiddenWaitHUD];
        
         for (NSMutableDictionary *dict in responsObject[@"result"]) {
             PracticeHistoryModel *model = [PracticeHistoryModel initWithDict:dict];
             NSLog(@"%@",model.title);
             [self.array addObject:model];
    
         }
         
         [self.TableView reloadData];
         
     } failure:^(AFHTTPRequestOperation * operation, NSError * error)
     {
         [self showHUDWithMessage:@"网络错误" HiddenDelay:0.5];
     }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}
#pragma mark 懒加载lable
-(UILabel *)lblNum{
    if (!_lblNum) {
        _lblNum = [[UILabel alloc]initWithFrame:CGRectMake(15, 74, 200, 21)];
        _lblNum.text = @"共有多少条收藏记录";
        
    }
    return _lblNum;
}
#pragma mark 懒加载表格
-(UITableView *)TableView{
    if (!_TableView) {
        _TableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 95, SCREEN_WIDTH, SCREEN_HEIGHT - 95)style:(UITableViewStylePlain)];
        _TableView.separatorColor = [UIColor lightGrayColor];
        _TableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        _TableView.backgroundColor = [UIColor whiteColor];
        _TableView.allowsSelection = NO;
        _TableView.delegate = self;
        _TableView.dataSource = self;
        [_TableView registerNib:[UINib nibWithNibName:@"PracticeHistoryTableViewCell" bundle:nil] forCellReuseIdentifier:@"PracticeHistoryTableViewCell"];
        [self.view addSubview:_TableView];
        
    }
    return _TableView;
}
#pragma mark dalegte 代理
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifer = @"PracticeHistoryTableViewCell";
    PracticeHistoryTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifer];
    PracticeHistoryModel *model = self.array[indexPath.row];
    cell.model = model;
    return cell;
}
#pragma mark 高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 66;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return self.array.count;
}

-(NSMutableArray *)array
{
    if (!_array) {
        _array = [NSMutableArray array];
    }
    return _array;
}
-(NSDictionary *)Dic
{
    if (!_Dic) {
        _Dic = [NSDictionary dictionary];
    }
    return _Dic;
}

@end
