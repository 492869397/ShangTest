//
//  PracticeHistoryViewController.m
//  SHANG
//
//  Created by len on 16/8/24.
//  Copyright (c) 2016年 com.sxt. All rights reserved.
//

#import "PracticeHistoryViewController.h"
#import "AFNetworking.h"
#import "PracticeHistoryTableViewCell.h"
#import "PracticeHistoryModel.h"


#define URL @"http://139.224.73.86:8080/sxt_studentsystem/selectTTestorRecordByUserID1.do"
@interface PracticeHistoryViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic ,strong)UITableView *TableView;
@property (nonatomic ,strong)NSMutableArray *array;
@property (nonatomic ,strong)NSDictionary *Dic;
@property (nonatomic , nonatomic) UILabel *lblNum;
@end

@implementation PracticeHistoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"练习历史";
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.TableView];
    [self requestMethod];
    [self.view addSubview:self.lblNum];
}
-(void)requestMethod{
    NSMutableDictionary *params2=[NSMutableDictionary dictionary];
    params2[@"student_id"] = @"201505050101002";
    AFHTTPRequestOperationManager *mgr2=[AFHTTPRequestOperationManager manager];
    [mgr2 POST:URL parameters:params2  success:^(AFHTTPRequestOperation * operation, id responsObject)
     {
#pragma mark insert
         NSMutableString *a = [[NSMutableString alloc ] initWithString :@"共有条做题记录"];
         //NSLog(@"qqqq=%@",a);
         NSNumber *time =responsObject[@"total"];
         //NSLog(@"wwww=%@",time);
         NSString *strTime = [NSString stringWithFormat:@"%@",time];
         [a insertString:strTime atIndex:2];
         NSString *str = a;
         _lblNum.text = str;
       
         for (NSMutableDictionary *dict in responsObject[@"result"]) {
             PracticeHistoryModel *model = [PracticeHistoryModel initWithDict:dict];
             [self.array addObject:model];
         }
         
         [self.TableView reloadData];
         
     } failure:^(AFHTTPRequestOperation * operation, NSError * error)
     {
         
     }];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
-(UILabel *)lblNum{
    if (!_lblNum) {
        _lblNum = [[UILabel alloc]initWithFrame:CGRectMake(15, 74, 200, 21)];
       // _lblNum.backgroundColor = [UIColor redColor];
        
    }
    return _lblNum;
}
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
#pragma mark dalegte
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *identifer = @"PracticeHistoryTableViewCell";
    PracticeHistoryTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifer];
    PracticeHistoryModel *model = self.array[indexPath.row];
    cell.model = model;
    return cell;
}


 
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
