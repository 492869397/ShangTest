//
//  TestViewController.m
//  ShangTest
//
//  Created by len on 16/8/9.
//  Copyright © 2016年 sxt. All rights reserved.
//

#import "TestViewController.h"
#import "TestMainView.h"
#import "QuestionModel.h"

@interface TestViewController ()

@property(strong,nonatomic)NSMutableArray *dataArray;

@property(strong,nonatomic)UIScrollView *scroll;

@property(strong,nonatomic)TestMainView *leftView;

@property(strong,nonatomic)TestMainView *centerView;

@property(strong,nonatomic)TestMainView *rightView;

@property(assign,nonatomic)NSInteger currentIndex;

@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    self.dataArray = [NSMutableArray array];
    self.currentIndex = 0;
    
    [self getDataFromNet];
    
    [self initViewLayout];
}

-(void)getDataFromNet
{
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
    
    [manager POST:@"http://123.57.28.11:8080/sxt_studentsystem/selectTQuestion.do" parameters:pass success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        
        NSArray *arr = responseObject[@"result"];
        [_dataArray removeAllObjects];
        
        for (NSDictionary *dic in arr) {
            QuestionModel *q = [QuestionModel creatQuestionWithDict:dic];
            [_dataArray addObject:q];
        }
        
        [self setInfoByCurrentIndex:_currentIndex];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
}

-(void)initViewLayout
{
    self.scroll = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT-64)];
    _scroll.contentSize = CGSizeMake(SCREEN_WIDTH*3, 0.0);
    _scroll.pagingEnabled = YES;
//    _scroll.showsHorizontalScrollIndicator = NO;
//    _scroll.alwaysBounceVertical = NO;
    
    _scroll.delegate = self;
    
    
    _scroll.contentOffset = CGPointMake(SCREEN_WIDTH, 0);
    
    [self.view addSubview:_scroll];
    
    
    self.leftView =[[[NSBundle mainBundle] loadNibNamed:@"TestMainView" owner:nil options:nil] lastObject];
    self.centerView =[[[NSBundle mainBundle] loadNibNamed:@"TestMainView" owner:nil options:nil] lastObject];
    self.rightView =[[[NSBundle mainBundle] loadNibNamed:@"TestMainView" owner:nil options:nil] lastObject];
    self.leftView.frame =CGRectMake(0, 0,SCREEN_WIDTH ,SCREEN_HEIGHT-64);
    self.centerView.frame =CGRectMake(SCREEN_WIDTH, 0,SCREEN_WIDTH ,SCREEN_HEIGHT-64);
    self.rightView.frame =CGRectMake(SCREEN_WIDTH*2, 0,SCREEN_WIDTH ,SCREEN_HEIGHT-64);
    
    
    [_scroll addSubview:_leftView];
    [_scroll addSubview:_centerView];
    [_scroll addSubview:_rightView];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollVie
{
    [self reloadImage];

    _scroll.contentOffset = CGPointMake(SCREEN_WIDTH, 0.0);
    

}

- (void)reloadImage {
    CGPoint contentOffset = [_scroll contentOffset];
    if (contentOffset.x > SCREEN_WIDTH) { //向左滑动
        _currentIndex = (_currentIndex + 1) % _dataArray.count;
     } else if (contentOffset.x < SCREEN_WIDTH) { //向右滑动
        _currentIndex = (_currentIndex - 1 + _dataArray.count) % _dataArray.count;
     }

    
    [self setInfoByCurrentIndex:_currentIndex];
}


- (void)setInfoByCurrentIndex:(NSInteger)currentIndex {
    
    QuestionModel *ques = _dataArray[currentIndex];
    [_centerView setContentWithQuestion:ques];
    
    ques = _dataArray[(currentIndex - 1 + _dataArray.count)%_dataArray.count];
    [_leftView setContentWithQuestion:ques];
   
    ques = _dataArray[(currentIndex+1)%_dataArray.count];
    [_rightView setContentWithQuestion:ques];


}


@end
