//
//  ErrorRecordViewController.m
//  SHANG
//
//  Created by len on 16/8/25.
//  Copyright © 2016年 com.sxt. All rights reserved.
//

#import "ErrorRecordViewController.h"
#import "AFNetworking.h"
#import "ErrorRecordTableViewCell.h"
#import "ErrorRecordModel.h"


#define URL @"http://139.224.73.86:8080/sxt_studentsystem/selectTMistakeCollection1.do"

@interface ErrorRecordViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic ,strong)UITableView *TableView;
@property (nonatomic ,strong)NSMutableArray *array;
@property (nonatomic ,strong)NSDictionary *Dic;
@property (nonatomic , nonatomic) UILabel *lblNum;

@end

@implementation ErrorRecordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"错题记录";
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    [self.view addSubview:self.TableView];
    [self requestMethod];
    [self.view addSubview:self.lblNum];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)requestMethod{
    NSMutableDictionary *params2=[NSMutableDictionary dictionary];
    params2[@"student_id"] = @"201505050101002";
    AFHTTPRequestOperationManager *mgr2=[AFHTTPRequestOperationManager manager];
    [mgr2 POST:URL parameters:params2  success:^(AFHTTPRequestOperation * operation, id responsObject)
     {
         NSMutableString *a = [[NSMutableString alloc ] initWithString :@"共有条做题记录"];
         NSLog(@"%@",responsObject);
         NSNumber *time =responsObject[@"total"];
         NSString *strTime = [NSString stringWithFormat:@"%@",time];
         [a insertString:strTime atIndex:2];
         NSString *str = a;
         _lblNum.text = str;
         
         for (NSMutableDictionary *dict in responsObject[@"result"]) {
             ErrorRecordModel *model = [ErrorRecordModel initWithDict:dict];
            // NSLog(@"%@",model.title);
             [self.array addObject:model];
             
         }
         
         [self.TableView reloadData];
         
     } failure:^(AFHTTPRequestOperation * operation, NSError * error)
     {
         
     }];
}

#pragma mark 懒加载lable
-(UILabel *)lblNum{
    if (!_lblNum) {
        _lblNum = [[UILabel alloc]initWithFrame:CGRectMake(15, 74, 200, 21)];
        //_lblNum.text = @"共有几道错误习题";
        
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
        [_TableView registerNib:[UINib nibWithNibName:@"ErrorRecordTableViewCell" bundle:nil] forCellReuseIdentifier:@"ErrorRecordTableViewCell"];
        [self.view addSubview:_TableView];
        
    }
    return _TableView;
}
#pragma mark dalegte 代理
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifer = @"ErrorRecordTableViewCell";
    ErrorRecordTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifer];
    
    
    ErrorRecordModel *model = self.array[indexPath.row];
    cell.model = model;
    cell.delegate = self;
    
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
