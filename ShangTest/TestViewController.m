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


typedef NS_ENUM(NSInteger,SelectCode)
{
    NoSelected = 1,
    SelectedTrue,
    SelectedFalse
};

@interface TestViewController ()

@property(strong,nonatomic)NSMutableArray *dataArray;

//选择的选项数组
@property(strong,nonatomic)NSMutableArray *selectArray;

//答题正确错误数组
@property(strong,nonatomic)NSMutableArray *correctArray;

@property(strong,nonatomic)UIScrollView *scroll;

@property(strong,nonatomic)TestMainView *leftView;
@property(strong,nonatomic)UIScrollView *leftScroll;

@property(strong,nonatomic)TestMainView *centerView;


@property(strong,nonatomic)TestMainView *rightView;
@property(strong,nonatomic)UIScrollView *rightScroll;

@property(assign,nonatomic)NSInteger currentIndex;

@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    self.dataArray = [NSMutableArray array];
    self.selectArray = [NSMutableArray array];
    self.correctArray = [NSMutableArray array];
    
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
        [_selectArray removeAllObjects];
        
        for (NSDictionary *dic in arr) {
            QuestionModel *q = [QuestionModel creatQuestionWithDict:dic];
            [_dataArray addObject:q];
            
            //还未答题的所选答案置为空字符串
            [_selectArray addObject:@""];
            
            NSNumber *s = [NSNumber numberWithInteger:NoSelected];
            [_correctArray addObject:s];
            
            
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
    self.leftScroll = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-64)];
    
    
    self.centerView =[[[NSBundle mainBundle] loadNibNamed:@"TestMainView" owner:nil options:nil] lastObject];
    self.centerScroll = [[UIScrollView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH, 0, SCREEN_WIDTH, SCREEN_HEIGHT-64)];
    
    self.rightView =[[[NSBundle mainBundle] loadNibNamed:@"TestMainView" owner:nil options:nil] lastObject];
    self.rightScroll = [[UIScrollView alloc]initWithFrame:CGRectMake( SCREEN_WIDTH*2, 0, SCREEN_WIDTH, SCREEN_HEIGHT-64)];
    
    _leftView.delegate = self;
    _centerView.delegate = self;
    _rightView.delegate = self;
    
    self.leftView.frame =CGRectMake(0, 0,SCREEN_WIDTH ,SCREEN_HEIGHT-64);
    self.centerView.frame =CGRectMake(0, 0,SCREEN_WIDTH ,SCREEN_HEIGHT-64);
    self.rightView.frame =CGRectMake(0, 0,SCREEN_WIDTH ,SCREEN_HEIGHT-64);
    
    [_leftScroll addSubview:_leftView];
    [_centerScroll addSubview:_centerView];
    [_rightScroll addSubview:_rightView];
    
    [_scroll addSubview:_leftScroll];
    [_scroll addSubview:_centerScroll];
    [_scroll addSubview:_rightScroll];

    
//    [_leftView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.left.right.equalTo(_leftView.superview);
//        
//    }];
//    
//    [_leftScroll mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.edges.mas_equalTo(self.view);
//        
//        // 让scrollview的contentSize随着内容的增多而变化
//        make.bottom.mas_equalTo(_leftView.mas_bottom);
//    }];
//    
//    [_centerView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.left.right.equalTo(_centerView.superview);
//        
//    }];
//    
//    [_centerScroll mas_makeConstraints:^(MASConstraintMaker *make) {
//                make.edges.mas_equalTo(self.view);
//        
//        // 让scrollview的contentSize随着内容的增多而变化
//        make.bottom.mas_equalTo(_centerView.mas_bottom);
//    }];

    
    
    
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
    [_centerView setContentWithQuestion:ques withIndex:currentIndex];
    
    _centerView.selectArray = self.selectArray;
    
    if (![_selectArray[currentIndex] isEqualToString:@""]) {
        [_centerView selectOption:_selectArray[currentIndex]];
    }
    
    
    
    
    ques = _dataArray[(currentIndex - 1 + _dataArray.count)%_dataArray.count];
    [_leftView setContentWithQuestion:ques withIndex:(currentIndex - 1 + _dataArray.count)%_dataArray.count];
    
    _leftView.selectArray = self.selectArray;
    
    if (![_selectArray[(currentIndex - 1 + _dataArray.count)%_dataArray.count] isEqualToString:@""]) {
        [_leftView selectOption:_selectArray[(currentIndex - 1 + _dataArray.count)%_dataArray.count]];
    }
   
    
    
    ques = _dataArray[(currentIndex+1)%_dataArray.count];
    [_rightView setContentWithQuestion:ques withIndex:(currentIndex+1)%_dataArray.count];
    
    _rightView.selectArray = self.selectArray;
    
    if (![_selectArray[(currentIndex+1)%_dataArray.count] isEqualToString:@""]) {
        [_rightView selectOption:_selectArray[(currentIndex+1)%_dataArray.count]];
    }


}


@end
