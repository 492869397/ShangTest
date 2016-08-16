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
    
    [self initViewLayout];
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
    
    //测试代码，需删除
    
    for (int i = 0 ; i < 5; i++) {
        QuestionModel *q = [[QuestionModel alloc]init];
        NSString *s = [NSString stringWithFormat:@"%d.随便自己嘴边写的题目，反正你们也看不懂我也看不懂，答案自己蒙一个，我是不会告诉你的",i];
        q.title = s;
        q.key = @"B";
        q.answerArray = @[@"错误还是正确？",@"正确还是错误",@"上一堆乱码ffxxkggkaklsdfasklasdfasdfasdfasdfasdfads知道了吗",@"并不知道",@"自己猜"];
        [_dataArray addObject:q];
    }
    
    self.leftView =[[[NSBundle mainBundle] loadNibNamed:@"TestMainView" owner:nil options:nil] lastObject];
    self.centerView =[[[NSBundle mainBundle] loadNibNamed:@"TestMainView" owner:nil options:nil] lastObject];
    self.rightView =[[[NSBundle mainBundle] loadNibNamed:@"TestMainView" owner:nil options:nil] lastObject];
    self.leftView.frame =CGRectMake(0, 0,SCREEN_WIDTH ,SCREEN_HEIGHT-64);
    self.centerView.frame =CGRectMake(SCREEN_WIDTH, 0,SCREEN_WIDTH ,SCREEN_HEIGHT-64);
    self.rightView.frame =CGRectMake(SCREEN_WIDTH*2, 0,SCREEN_WIDTH ,SCREEN_HEIGHT-64);
    
    
    
//    self.leftView =[[TestMainView alloc]initWithFrame:CGRectMake(0, 0,SCREEN_WIDTH ,SCREEN_HEIGHT-64)];
    [_scroll addSubview:_leftView];
    
//    self.centerView =[[TestMainView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH, 0,SCREEN_WIDTH ,SCREEN_HEIGHT-64)];
    [_scroll addSubview:_centerView];
    
//    self.rightView =[[TestMainView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH*2, 0,SCREEN_WIDTH ,SCREEN_HEIGHT-64)];
    [_scroll addSubview:_rightView];
    
    [self setInfoByCurrentIndex:_currentIndex];
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
