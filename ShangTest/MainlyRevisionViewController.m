//
//  MainlyRevisionViewController.m
//  ShangTest
//
//  Created by len on 16/9/8.
//  Copyright © 2016年 sxt. All rights reserved.
//

#import "MainlyRevisionViewController.h"
#import "MainlyRevisionTableViewCell.h"
#import "PracticeHistoryModel.h"
#define URL @"http://139.224.73.86:8080/sxt_app/getReviewAnswer.do"

@interface MainlyRevisionViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,assign)NSInteger index;
//@property (nonatomic ,strong)NSMutableArray *dataArray;
@property (nonatomic ,strong)UITableView *TableView;

@property (nonatomic ,strong)NSMutableArray *array;
@property (nonatomic ,strong)NSMutableArray *chuji;
@property (nonatomic ,strong)NSMutableArray *zhongji;
@property (nonatomic ,strong)NSMutableArray *gaoji;

@property (nonatomic ,strong)NSMutableArray *topicArray;


@end

@implementation MainlyRevisionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"阶段复习";

    self.topicArray = [NSMutableArray array];
#pragma mark 初级
    self.chuji = [NSMutableArray arrayWithObjects:@"零散知识",@"面向对象",@"数组",@"异常",@"常用类",@"容器",@"泛型",@"IO流",@"线程",@"网络", nil];
#pragma mark 中级
    self.zhongji = [NSMutableArray arrayWithObjects:@"数据库",@"JavaScript",@"JQuery",@"反射",@"servlet",@"JSP",@"JSTL",@"设计模式",nil];
    
#pragma mark 高级
     self.gaoji = [NSMutableArray arrayWithObjects:@"Struts2",@"Hibernate",@"Spring",@"SpringMVC",@"Mybatis", nil];
     
    self.array = [NSMutableArray arrayWithObjects:_chuji,_zhongji,_gaoji, nil];

    _index = 1;
    [self.view addSubview:self.TableView];
    [self requestMethod];
     
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
#pragma mark Request 请求方法
-(void)requestMethod{
    
    [self showMessage:@"正在加载"];
    
    NSMutableDictionary *params2=[NSMutableDictionary dictionary];
  
    AFHTTPRequestOperationManager *mgr2=[AFHTTPRequestOperationManager manager];
    [mgr2 POST:URL parameters:params2  success:^(AFHTTPRequestOperation * operation, id responsObject)
     {
         [self hiddenWaitHUD];
 
         [_topicArray removeAllObjects];
         for (int i = 0; i < 23; i++) {
             NSMutableArray *arr = [NSMutableArray array];
             [_topicArray addObject:arr];
         }
         
         if ([responsObject isKindOfClass:[NSArray class]]){
             
            for (NSMutableDictionary *dict in responsObject)
            {
                PracticeHistoryModel *model = [PracticeHistoryModel initWithDict:dict];
                
                [_topicArray[model.reviewTypeId.integerValue - 1] addObject:model];

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
        _TableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 95, SCREEN_WIDTH, SCREEN_HEIGHT - 95)style:(UITableViewStylePlain)];
        _TableView.separatorColor = [UIColor lightGrayColor];
        _TableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        _TableView.backgroundColor = [UIColor whiteColor];
        _TableView.allowsSelection = NO;
        _TableView.delegate = self;
        _TableView.dataSource = self;
        [_TableView registerNib:[UINib nibWithNibName:@"MainlyRevisionTableViewCell" bundle:nil] forCellReuseIdentifier:@"MainlyRevisionTableViewCell"];
        [self.view addSubview:_TableView];
        
    }
    return _TableView;
}
#pragma mark dalegte 代理
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifer = @"MainlyRevisionTableViewCell";
    MainlyRevisionTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifer];

    cell.catage = _array[_index-1][indexPath.row];
    cell.lblTitleOne.text = cell.catage;
    cell.delegate = self;
    
    if (_topicArray.count > 0) {
        NSMutableArray *arr = _topicArray[indexPath.row];
        cell.lblTitleTwo.text = [NSString stringWithFormat:@"(共%lu道题)",(unsigned long)arr.count];
        cell.array = arr;
    }
    
    
    return cell;
    
}
#pragma mark 高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return [(NSMutableArray*)_array[_index-1] count];
    
}



- (IBAction)selectType:(UIButton *)sender {
    
    for (int i = 1; i<=3; i++) {
        UIView *v = [self.view viewWithTag:i];
        if (v == sender) {
            v.backgroundColor = [UIColor yellowColor];
        }else
        {
            v.backgroundColor = [UIColor cyanColor];
        }
    }
    
    _index = sender.tag;
    [_TableView reloadData];
    
}
@end
