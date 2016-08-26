//
//  TestViewController.m
//  ShangTest
//
//  Created by len on 16/8/9.
//  Copyright © 2016年 sxt. All rights reserved.
//

#import "TestViewController.h"
#import "QuestionModel.h"

#import "TestResultViewController.h"


typedef NS_ENUM(NSInteger,SelectCode)
{
    NoSelected = 1,
    SelectedTrue,
    SelectedFalse
};

@interface TestViewController ()




//答题正确错误数组
@property(strong,nonatomic)NSMutableArray *correctArray;

@property(strong,nonatomic)UIScrollView *scroll;




@property(assign,nonatomic)NSInteger leftIndex;

@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    UIButton *b = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 35, 35)];
    [b setImage:[UIImage imageNamed:@"1"] forState:UIControlStateNormal];
    [b addTarget:self action:@selector(collectQuestion:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *collect = [[UIBarButtonItem alloc]initWithCustomView:b];
    self.navigationItem.rightBarButtonItem = collect;
    
    self.dataArray = [NSMutableArray array];
    self.selectArray = [NSMutableArray array];
    self.correctArray = [NSMutableArray array];
    
    _displayIndex = 0;
    _leftIndex = 0;
    
    self.scroll = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT-64)];
    _scroll.contentSize = CGSizeMake(SCREEN_WIDTH*3, 0.0);
    _scroll.pagingEnabled = YES;
    
    _scroll.delegate = self;
    _scroll.contentOffset = CGPointMake(SCREEN_WIDTH, 0);
    
    [self.view addSubview:_scroll];
    
    [self initViewLayout];
    
    [self getDataFromNet];
    
}

-(void)getDataFromNet
{
    [self showMessage:@"加载中..."];
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    NSMutableDictionary *pass = [NSMutableDictionary dictionary];
    [pass setObject:_suite_code forKey:@"suite_code"];
    int n;
    switch (_testType) {
        case 1:
            n = 15;
            break;
        case 2:
            n = 30;
            break;
        case 3:
            n = 60;
            break;
        case 4:
            n = 0;
            break;
            
        default:
            break;
    }
    
    
    NSNumber *number;
    if (n != 0) {
        number = [NSNumber numberWithInt:n];
        [pass setObject:number forKey:@"number"];
    }else
    {
#pragma -mark 顺序做题怎么操作，不知道
    }
    
    [pass setObject:@1 forKey:@"page"];
    [pass setObject:number forKey:@"rows"];
    
    [manager POST:@"http://139.224.73.86:8080/sxt_studentsystem/selectTQuestion.do" parameters:pass success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        
        [self hiddenWaitHUD];
        
        if (![responseObject[@"result"] isKindOfClass:[NSArray class]]) {
            [self showHUDWithMessage:@"获取数据失败，请重试" HiddenDelay:0.5];
            return ;
        }
        
        NSArray *arr = responseObject[@"result"];
        [_dataArray removeAllObjects];
        [_selectArray removeAllObjects];
        _displayIndex = 0 ;
        
        for (NSDictionary *dic in arr) {
            QuestionModel *q = [QuestionModel creatQuestionWithDict:dic];
            [_dataArray addObject:q];
            
            //还未答题的所选答案置为空字符串
            [_selectArray addObject:@""];
            
            NSNumber *s = [NSNumber numberWithInteger:NoSelected];
            [_correctArray addObject:s];
            
            
        }
        
        [self setInfoByCurrentIndex:_displayIndex];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [self hiddenWaitHUD];

        [self showHUDWithMessage:@"网络连接失败" HiddenDelay:0.5];
    }];
}

-(void)initViewLayout
{
    self.leftView =[[QuestionView alloc]initWithFrame: CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-64)];
    
    
    self.centerView =[[QuestionView alloc]initWithFrame: CGRectMake(SCREEN_WIDTH, 0, SCREEN_WIDTH, SCREEN_HEIGHT-64)];
    
    self.rightView =[[QuestionView alloc]initWithFrame: CGRectMake( SCREEN_WIDTH*2, 0, SCREEN_WIDTH, SCREEN_HEIGHT-64)];
    
    _leftView.delegate = self;
    _centerView.delegate = self;
    _rightView.delegate = self;
    

    
    [_scroll addSubview:_leftView];
    [_scroll addSubview:_centerView];
    [_scroll addSubview:_rightView];

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UIScrollViewDelegate


- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    
    [self reloadImage];
    
    [self setInfoByCurrentIndex:_displayIndex];
    
    _scroll.contentOffset = CGPointMake(SCREEN_WIDTH, 0.0);
    

}

- (void)reloadImage {
    
    CGPoint contentOffset = [_scroll contentOffset];
    
    NSInteger centerIndex = _displayIndex  ;
    
    if (contentOffset.x > SCREEN_WIDTH) { //向左滑动
        
        centerIndex = _displayIndex +1;
        
     } else if (contentOffset.x < SCREEN_WIDTH) { //向右滑动
        centerIndex = _displayIndex - 1;
    }

    if (centerIndex < 0 ) {
        _displayIndex = 0;
    }else if(centerIndex > _dataArray.count - 1 )
    {
        _displayIndex = _dataArray.count-1;
        
    }else
    {
        _displayIndex = centerIndex;
    }
    NSLog(@"%ld",_displayIndex);
    
}


- (void)setInfoByCurrentIndex:(NSInteger)currentIndex {
   
    
    //再重新建立questionView
    [_leftView removeFromSuperview];
    [_centerView removeFromSuperview];
    [_rightView removeFromSuperview];
    
    [self initViewLayout];
    
    
    
    NSInteger leftIndex = currentIndex - 1;
    if (currentIndex == 0) {
        leftIndex = 0;
    }
    
    QuestionModel *ques = _dataArray[leftIndex];
    [_leftView setContentWithQuestion:ques withIndex:leftIndex];
    
    
    if (![_selectArray[leftIndex] isEqualToString:@""]) {
        [_leftView selectOption:_selectArray[(currentIndex - 1 + _dataArray.count)%_dataArray.count]];
    }
   
    
    NSInteger rightIndex = currentIndex+1;
    if (currentIndex >= _dataArray.count - 1) {
        rightIndex = _dataArray.count - 1;
    }
    ques = _dataArray[rightIndex];
    [_rightView setContentWithQuestion:ques withIndex:rightIndex];
    
    if (![_selectArray[rightIndex] isEqualToString:@""]) {
        [_rightView selectOption:_selectArray[rightIndex]];
    }
    
    
    
    ques = _dataArray[currentIndex];
    [_centerView setContentWithQuestion:ques withIndex:currentIndex];

    if (![_selectArray[currentIndex] isEqualToString:@""]) {
        [_centerView selectOption:_selectArray[currentIndex]];
    }

}


-(void)commitAnswer
{
    
    int i = 0;
    for (NSString *s in _selectArray) {
        if ([s isEqualToString:@""]) {
            i ++;
            break;
        }
    }
    
    if (i != 0) {
        [self showHUDWithMessage:@"做完所有题目之后才能交卷" HiddenDelay:1];
        return;
    }
    
    NSMutableString *s = [NSMutableString string];
    for (QuestionModel *ques in _dataArray) {
        NSInteger i = [_dataArray indexOfObject:ques];
        
        [s appendFormat:@"question_code:%@,option_code:%@,",ques.question_code,_selectArray[i] ];
    }
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    NSMutableDictionary *pass = [NSMutableDictionary dictionaryWithCapacity:3];
    [pass setObject:@"0101101" forKey:@"student_id"];
    [pass setObject:@"00:00:00" forKey:@"time"];
    [pass setObject:s forKey:@"list"];
    

    [manager POST:@"http://139.224.73.86:8080/sxt_studentsystem/addTTestorRecordForList1.do" parameters:pass success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        
        TestResultViewController *t = [[TestResultViewController alloc]init];
        t.dataArray = _dataArray;
        t.selectArray = _selectArray;
        [self.navigationController pushViewController:t animated:YES];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [self showHUDWithMessage:@"网络连接失败" HiddenDelay:0.5];
    }];
    
    
}



-(void)collectQuestion:(UIBarButtonItem*)sender
{
    QuestionModel *ques = _dataArray[_displayIndex];
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    NSMutableDictionary *pass = [NSMutableDictionary dictionaryWithCapacity:2];

    [pass setObject:ques.question_code forKey:@"question_code"];
    [pass setObject:@"0101101" forKey:@"student_id"];
    
    [manager POST:@"http://139.224.73.86:8080/sxt_studentsystem/addTMistakeCollection1.do" parameters:pass success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        if ([responseObject[@"result"] isEqualToNumber:@1]) {
            [self showHUDWithMessage:@"收藏成功" HiddenDelay:0.5];
        }else
        {
            [self showHUDWithMessage:responseObject[@"message"] HiddenDelay:0.5];
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [self showHUDWithMessage:@"网络连接失败" HiddenDelay:0.5];
    }];
}
@end
