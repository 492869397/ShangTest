//
//  QuestionView.m
//  ShangTest
//
//  Created by len on 16/8/24.
//  Copyright © 2016年 sxt. All rights reserved.
//

#import "QuestionView.h"
#import "OptionModel.h"
#import "TestViewController.h"
#import "TestResultViewController.h"


@interface SingleAnswerView : UIView


//代理
@property(weak,nonatomic)id delegate;

@property(strong,nonatomic)NSString *key;

@property(strong,nonatomic)UILabel *sequenceNumber;

@property(strong,nonatomic)UILabel *answerContent;


-(void)showResult:(BOOL)result;

-(void)setViewLayoutWithAnswers:(NSString*)answer withOptionCode:(NSString*)option_code andIndex:(int)i;


@end

@implementation SingleAnswerView

-(SingleAnswerView*)init
{
    self = [super init];
    if (self) {
        
        
    }
    return self;
}

-(void)setViewLayoutWithAnswers:(NSString*)answer withOptionCode:(NSString*)option_code andIndex:(int)i
{
    self.sequenceNumber = [[UILabel alloc]init];
    _sequenceNumber.layer.cornerRadius = 10;
    _sequenceNumber.layer.masksToBounds = YES;
    _sequenceNumber.textAlignment = NSTextAlignmentCenter;
    [self addSubview:_sequenceNumber];
    
    
    self.answerContent = [[UILabel alloc]init];
    _answerContent.lineBreakMode = NSLineBreakByWordWrapping;
    _answerContent.numberOfLines = 0;
    [self addSubview:_answerContent];
    
//    if (i % 2 == 0) {
//        self.backgroundColor = [UIColor lightGrayColor];
//    }
    
    //序号
    _sequenceNumber.text = [NSString stringWithFormat:@"%c",'A'+i];
    
    self.key = option_code;
    
    //答案内容
    _answerContent.text = answer;
    
    
    //布局
    [_sequenceNumber mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.equalTo(@20);
        make.centerY.equalTo(self);
        make.left.equalTo(self).offset(15);
        
    }];
    
    [_answerContent mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.right.equalTo(self).offset(-10);
        make.top.equalTo(self).offset(5);
        make.left.equalTo(_sequenceNumber.mas_right).offset(5);
    }];
    
    
}


-(void)showResult:(BOOL)result
{
    if (result) {
        _sequenceNumber.text = @"√";
        _sequenceNumber.backgroundColor = [UIColor orangeColor];
        [_answerContent setTextColor:[UIColor orangeColor]];
        
    }else
    {
        _sequenceNumber.text = @"×";
        _sequenceNumber.backgroundColor = [UIColor redColor];
        [_answerContent setTextColor:[UIColor redColor]];
    }
}

@end





@interface QuestionView ()

@property(nonatomic,strong)QuestionModel *question;

//存放选择的视图数组
@property(nonatomic,strong)NSMutableArray *singleAnswerArray;

@property(nonatomic,strong)UIScrollView *scrollView;

@property(nonatomic,strong)UIView *analyze;


@end

@implementation QuestionView

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _canTouch = YES;
        
        self.singleAnswerArray = [NSMutableArray array];
        self.scrollView = [[UIScrollView alloc]init];
        [self addSubview:_scrollView];
    }
    return self;
}



-(void)setContentWithQuestion:(QuestionModel*)question withIndex:(NSInteger)index
{
    self.index = index;
    self.question = question;
    
    
    [_singleAnswerArray removeAllObjects];
    //如果有的题的选项不是4个，那么应该删除重建子视图
    NSArray* views = [_scrollView subviews];
    for(UIView *view in views)
    {
        [view removeFromSuperview];
    }
    
    
    //containerView
    UIView *containerView = [[UIView alloc]init];
    [_scrollView addSubview:containerView];
    
    
    [containerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(SCREEN_WIDTH);
        
    }];
    
    [_scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
        make.left.right.top.bottom.equalTo(containerView);
    }];
    

    //题目
    UILabel *titleLabel = [[UILabel alloc]init];
    titleLabel.numberOfLines = 0;
    [containerView addSubview:titleLabel];
    titleLabel.text = [NSString stringWithFormat:@"%ld.%@",index+1,question.question];
    
    
    
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.equalTo(containerView).offset(15);
        make.right.equalTo(containerView).offset(-15);
    }];
    
    
    //选项
    UIView *optionView = [[UIView alloc]init];
    optionView.userInteractionEnabled = YES;
    [containerView addSubview:optionView];
    
    
    [optionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(titleLabel.bottom).offset(10);
        make.left.right.equalTo(containerView);
    }];
    
    SingleAnswerView *lastView;
    for (int i = 0; i < _question.answerArray.count; i++) {
        SingleAnswerView *singleAnswerView = [[SingleAnswerView alloc]init];
        [optionView addSubview:singleAnswerView];

        
        OptionModel *op = _question.answerArray[i];
        NSString *answer = op.title;
        NSString *option = op.option_code;
        
        [singleAnswerView setViewLayoutWithAnswers:answer withOptionCode:option andIndex:i];
        
        
        
        //对singeleAnswerView进行布局
        [singleAnswerView mas_makeConstraints:^(MASConstraintMaker *make) {
            if (_singleAnswerArray.count==0) {
                make.top.equalTo(optionView);
            }else
            {
                make.top.equalTo(lastView.mas_bottom);
            }
            
            make.left.right.equalTo(optionView);
            
        }];
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(selectAnAnswer:)];
        [singleAnswerView addGestureRecognizer:tap];
        
        [_singleAnswerArray addObject:singleAnswerView];
        lastView = singleAnswerView;

    }

    [lastView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(optionView);
    }];
    
    //答案解析View
    self.analyze = [[UIView alloc]init];
    [containerView addSubview:_analyze];
    
    [_analyze mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(lastView.mas_bottom);
        make.left.right.equalTo(containerView);
        make.height.equalTo(@1);
    }];
    
    
    
    
    if (!_delegate) {
        return;
    }
    
    UIButton *b = [[UIButton alloc]init];
    b.backgroundColor = [UIColor blueColor];
    [b setTitle:@"交卷" forState:UIControlStateNormal];
    b.layer.masksToBounds = YES;
    b.layer.cornerRadius = 8;
    [containerView addSubview:b];
    
    [b mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_analyze.bottom).offset(20);
        make.width.mas_equalTo(100);
        make.centerX.equalTo(_analyze);
        make.bottom.equalTo(containerView).offset(-20);
        
        if (index >= _delegate.dataArray.count-1) {
            make.height.mas_equalTo(40);
        }else
        {
            make.height.mas_equalTo(0);
        }
    }];
    
    [b addTarget:self action:@selector(enterNext:) forControlEvents:UIControlEventTouchUpInside];

    
}





-(void)selectAnAnswer:(UITapGestureRecognizer*)tap
{
    if (![_delegate.selectArray[_index] isEqualToString:@""]) {
        return;
    }
    
    if (!_delegate) {
        return;
    }
    
    if (!_canTouch) {
        return;
    }
    
    
    
    SingleAnswerView* answerView = (SingleAnswerView*)tap.view;
    
    NSString *s = [NSString stringWithString:answerView.key];
    
    
    [self selectOption:s];
    
    [_delegate.selectArray replaceObjectAtIndex:_index withObject:s];
}

-(void)selectOption:(NSString*)option
{
    
    
    for (SingleAnswerView* ansView in _singleAnswerArray) {
        if ([option isEqualToString:ansView.key]) {
            
            if ([ansView.key isEqualToString:_question.option_code]) {
                [ansView showResult:YES];
            }else
            {
                [ansView showResult:NO];
            }
            
        }
        if ([ansView.key isEqualToString:_question.option_code]) {
            [ansView showResult:YES];
        }
    }
    
}



-(void)enterNext:(id)sender
{
    [_delegate commitAnswer];
}




@end
