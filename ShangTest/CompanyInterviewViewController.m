//
//  CompanyInterviewViewController.m
//  ShangTest
//
//  Created by len on 16/9/6.
//  Copyright © 2016年 sxt. All rights reserved.
//

#import "CompanyInterviewViewController.h"
#import "CompanyInterviewTableViewCell.h"
#import "PracticeHistoryModel.h"
#import "DetailedAnswerViewController.h"

#define URL	@"http://139.224.73.86:8080/sxt_app/getCompanyAnswer.do"

@interface CompanyInterviewViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,assign)NSInteger index;
@property (nonatomic ,strong)UITableView *TableView;
@property (nonatomic ,strong)NSMutableArray *array;
@property(nonatomic,strong)NSMutableArray *easyArray;
@property(nonatomic,strong)NSMutableArray *normolArray;
@property(nonatomic,strong)NSMutableArray *hardArray;

@end

@implementation CompanyInterviewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"企业面试";
    
    self.easyArray = [NSMutableArray array];
    self.normolArray = [NSMutableArray array];
    self.hardArray = [NSMutableArray array];
    self.array = [NSMutableArray arrayWithObjects:_easyArray,_normolArray,_hardArray, nil];
    _index = 1;
    
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
         if ([responsObject isKindOfClass:[NSArray class]]){
         [_easyArray removeAllObjects];
         [_normolArray removeAllObjects];
         [_hardArray removeAllObjects];
         
             for (NSMutableDictionary *dict in responsObject)
             {
                 
                 PracticeHistoryModel *model = [PracticeHistoryModel initWithDict:dict];
                
                 if ([dict[@"companyGradeId"] isEqualToNumber:@1]) {
                     [_easyArray addObject:model];
                     NSLog(@"%@",model.companyGradeId);
                 }else if([dict[@"companyGradeId"] isEqualToNumber:@2])
                 {
                     [_normolArray addObject:model];
                      NSLog(@"%@",model.companyGradeId);
                 }else if ([dict[@"companyGradeId"] isEqualToNumber:@3])
                     [_hardArray addObject:model];
                     NSLog(@"%@",model.companyGradeId);

             }
             [self.TableView reloadData];
         }
        
         
         
     } failure:^(AFHTTPRequestOperation * operation, NSError * error)
     {
         [self hiddenWaitHUD];
         [self showHUDWithMessage:@"网络错误" HiddenDelay:0.5];
     }];
}
#pragma mark 懒加载表格
-(UITableView *)TableView{
    if (!_TableView) {
        _TableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT -64 - 40)style:(UITableViewStylePlain)];
        _TableView.separatorColor = [UIColor lightGrayColor];
        _TableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        _TableView.backgroundColor = [UIColor whiteColor];
        _TableView.allowsSelection = YES;
        _TableView.delegate = self;
        _TableView.dataSource = self;
        [_TableView registerNib:[UINib nibWithNibName:@"CompanyInterviewTableViewCell" bundle:nil] forCellReuseIdentifier:@"CompanyInterviewTableViewCell"];
        [self.view addSubview:_TableView];
        
    }
    return _TableView;
}
#pragma mark dalegte 代理
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifer = @"CompanyInterviewTableViewCell";
    CompanyInterviewTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifer];
    
    
    NSArray *arr = _array[_index - 1];
    PracticeHistoryModel *model = arr[indexPath.row];
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
    NSArray *arr = _array[_index - 1];
    return arr.count;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DetailedAnswerViewController *DAVC = [[DetailedAnswerViewController alloc]init];
    
    PracticeHistoryModel *model = self.array[_index-1][indexPath.row];
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

- (IBAction)selectType:(UIButton *)sender {
    
    _index = sender.tag;
    [self requestMethod];
    [_TableView reloadData];
    
}

@end
