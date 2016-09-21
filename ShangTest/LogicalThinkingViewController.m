//
//  LogicalThinkingViewController.m
//  ShangTest
//
//  Created by len on 16/9/6.
//  Copyright © 2016年 sxt. All rights reserved.
//

#import "LogicalThinkingViewController.h"
#import "LogicalThinkingTableViewCell.h"
#import "PracticeHistoryModel.h"
#import "DetailedAnswerViewController.h"
#define URL	@"http://139.224.73.86:8080/sxt_app/getOtherInterview.do"
@interface LogicalThinkingViewController ()<UITableViewDelegate,UITableViewDataSource>
 
@property (nonatomic ,strong)UITableView *TableView;
@property (nonatomic ,strong)NSMutableArray *array;

@end

@implementation LogicalThinkingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"逻辑思维";
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.TableView];
    [self requestMethod];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark Request 请求方法
-(void)requestMethod{
    
    [self showMessage:@"正在加载"];
    
    NSMutableDictionary *params2=[NSMutableDictionary dictionary];
    AFHTTPRequestOperationManager *mgr2=[AFHTTPRequestOperationManager manager];
    [mgr2 POST:URL parameters:params2  success:^(AFHTTPRequestOperation * operation, id responsObject)
     {
         
         [self hiddenWaitHUD];
         
         for (NSMutableDictionary *dict in responsObject) {
             PracticeHistoryModel *model = [PracticeHistoryModel initWithDict:dict];
             if(_num == 1){
                 if ([dict[@"interviewTypeId"] isEqualToNumber:@1]){
                 [self.array addObject:model];
                 }
             }
             else{
                 if ([dict[@"interviewTypeId"] isEqualToNumber:@2]){
                     [self.array addObject:model];
                 }

             }
         }
         [self.TableView reloadData];
         
     } failure:^(AFHTTPRequestOperation * operation, NSError * error)
     {
         [self showHUDWithMessage:@"网络错误" HiddenDelay:0.5];
     }];
}
#pragma mark 懒加载表格
-(UITableView *)TableView{
    if (!_TableView) {
        _TableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 74, SCREEN_WIDTH, SCREEN_HEIGHT -74)style:(UITableViewStylePlain)];
        _TableView.separatorColor = [UIColor lightGrayColor];
        _TableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        _TableView.backgroundColor = [UIColor whiteColor];
        _TableView.allowsSelection = YES;
        _TableView.delegate = self;
        _TableView.dataSource = self;
        [_TableView registerNib:[UINib nibWithNibName:@"LogicalThinkingTableViewCell" bundle:nil] forCellReuseIdentifier:@"LogicalThinkingTableViewCell"];
        [self.view addSubview:_TableView];
        
    }
    return _TableView;
}
#pragma mark dalegte 代理
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifer = @"LogicalThinkingTableViewCell";
    LogicalThinkingTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifer];
    PracticeHistoryModel *model = self.array[indexPath.row];
    cell.model = model;
    return cell;
}
#pragma mark 高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 70;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return self.array.count;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DetailedAnswerViewController *DAVC = [[DetailedAnswerViewController alloc]init];
    
    PracticeHistoryModel *model = self.array[indexPath.row];
    _stringProblem = [NSString stringWithFormat:@"%@", model.title];
    _stringAnswer = [NSString stringWithFormat:@"%@", model.content];
    DAVC.ProblemStr = _stringProblem;
    DAVC.AnswerStr = _stringAnswer;
    
    [self.navigationController pushViewController:DAVC animated:YES];
}

-(NSMutableArray *)array
{
    if (!_array) {
        _array = [NSMutableArray array];
    }
    return _array;
}

@end
