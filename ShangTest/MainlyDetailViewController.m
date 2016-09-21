//
//  MainlyDetailViewController.m
//  ShangTest
//
//  Created by mac on 16/9/20.
//  Copyright © 2016年 sxt. All rights reserved.
//

#import "MainlyDetailViewController.h"
#import "PracticeHistoryModel.h"

@interface MainlyDetailViewController ()

@property(strong,nonatomic)UIScrollView *scroll;

@property(strong,nonatomic)UILabel *count;

@end

@implementation MainlyDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    
    _displayIndex = 0;
    _leftIndex = 0;
    
    self.scroll = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT-64)];
    _scroll.contentSize = CGSizeMake(SCREEN_WIDTH*3, 0.0);
    _scroll.pagingEnabled = YES;
    
    _scroll.delegate = self;
    _scroll.contentOffset = CGPointMake(SCREEN_WIDTH, 0);
    
    [self.view addSubview:_scroll];
    
    self.count = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 30)];
    _count.textAlignment = NSTextAlignmentRight;
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc]initWithCustomView:_count];
    self.navigationItem.rightBarButtonItem = rightButton;
    
    
    
    [self initViewLayout];
    
    [self setInfoByCurrentIndex:_displayIndex];
}



-(void)initViewLayout
{
    self.leftView = [[[NSBundle mainBundle]loadNibNamed:@"TopicView" owner:nil options:nil] firstObject];
    _leftView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-64);
    
    
    self.centerView = [[[NSBundle mainBundle]loadNibNamed:@"TopicView" owner:nil options:nil] firstObject];
    _centerView.frame = CGRectMake(SCREEN_WIDTH, 0, SCREEN_WIDTH, SCREEN_HEIGHT-64);
    
    self.rightView = [[[NSBundle mainBundle]loadNibNamed:@"TopicView" owner:nil options:nil] firstObject];
    _rightView.frame = CGRectMake( SCREEN_WIDTH*2, 0, SCREEN_WIDTH, SCREEN_HEIGHT-64);
    
    
    
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
    
    //设置导航栏右标签
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
    
    PracticeHistoryModel *ques = _dataArray[leftIndex];
    [_leftView setSubviewContentWithModel:ques andIndex:leftIndex];
    
    
    
    
    NSInteger rightIndex = currentIndex+1;
    if (currentIndex >= _dataArray.count - 1) {
        rightIndex = _dataArray.count - 1;
    }
    ques = _dataArray[rightIndex];
    [_rightView setSubviewContentWithModel:ques andIndex:rightIndex];
    

    
    
    ques = _dataArray[currentIndex];
    [_centerView setSubviewContentWithModel:ques andIndex:currentIndex];
    
    
    
}








@end
