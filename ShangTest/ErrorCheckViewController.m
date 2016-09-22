//
//  ErrorCheckViewController.m
//  ShangTest
//
//  Created by mac on 16/9/21.
//  Copyright © 2016年 sxt. All rights reserved.
//

#import "ErrorCheckViewController.h"
#import "QuestionModel.h"

#import "TestResultViewController.h"


typedef NS_ENUM(NSInteger,SelectCode)
{
    NoSelected = 1,
    SelectedTrue,
    SelectedFalse
};

@interface ErrorCheckViewController ()




//答题正确错误数组
@property(strong,nonatomic)NSMutableArray *correctArray;

@property(strong,nonatomic)UIScrollView *scroll;

@property(strong,nonatomic)UILabel *count;

@property(assign,nonatomic)NSInteger leftIndex;

@end

@implementation ErrorCheckViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"查看错题";
    
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    //    UIButton *b = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 35, 35)];
    //    [b setImage:[UIImage imageNamed:@"1"] forState:UIControlStateNormal];
    //    [b addTarget:self action:@selector(collectQuestion:) forControlEvents:UIControlEventTouchUpInside];
    //    UIBarButtonItem *collect = [[UIBarButtonItem alloc]initWithCustomView:b];
    //    self.navigationItem.rightBarButtonItem = collect;
    
    self.count = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 30)];
    _count.textAlignment = NSTextAlignmentRight;
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc]initWithCustomView:_count];
    self.navigationItem.rightBarButtonItem = rightButton;
    
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
    [pass setObject:@"201505050101002" forKey:@"student_id"];
    
    [manager POST:@"http://139.224.73.86:8080/sxt_studentsystem/selectTMistakeCollectionByAll1.do" parameters:pass success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        
        [self hiddenWaitHUD];
        
        if (![responseObject[@"result"] isKindOfClass:[NSArray class]]) {
            [self showHUDWithMessage:@"暂无错题记录" HiddenDelay:0.5];
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
    
//    _leftView.delegate = self;
//    _centerView.delegate = self;
//    _rightView.delegate = self;
    
    _leftView.canTouch = NO;
    _centerView.canTouch = NO;
    _rightView.canTouch = NO;
    
    
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
    
}


- (void)setInfoByCurrentIndex:(NSInteger)currentIndex {
    
    //设置题目个数提示
    _count.text = [NSString stringWithFormat:@"%ld/%ld",currentIndex+1,_dataArray.count];
    
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
    
    [_leftView selectOption:nil];
    
    
    NSInteger rightIndex = currentIndex+1;
    if (currentIndex >= _dataArray.count - 1) {
        rightIndex = _dataArray.count - 1;
    }
    
    ques = _dataArray[rightIndex];
    [_rightView setContentWithQuestion:ques withIndex:rightIndex];
    
    [_rightView selectOption:nil];

    
    
    
    ques = _dataArray[currentIndex];
    [_centerView setContentWithQuestion:ques withIndex:currentIndex];
    
    [_centerView selectOption:nil];
    
}


@end
