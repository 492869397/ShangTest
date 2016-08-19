//
//  AnswerBoard.m
//  ShangTest
//
//  Created by len on 16/8/11.
//  Copyright © 2016年 sxt. All rights reserved.
//

#import "AnswerBoard.h"
#import "TestMainView.h"
#import "OptionModel.h"

@interface SingleAnswerView : UIView

@property(strong,nonatomic)NSString *key;

@property(strong,nonatomic)UILabel *sequenceNumber;

@property(strong,nonatomic)UILabel *answerContent;

-(void)showResult:(BOOL)result;

-(void)setViewLayoutWithAnswers:(NSString*)answer andIndex:(int)i andOriginY:(float)originY;

@end

@implementation SingleAnswerView

-(SingleAnswerView*)init
{
    self = [super init];
    if (self) {
        
        self.sequenceNumber = [[UILabel alloc]init];
        _sequenceNumber.layer.cornerRadius = 10;
        _sequenceNumber.layer.masksToBounds = YES;
        _sequenceNumber.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_sequenceNumber];
        
        
        self.answerContent = [[UILabel alloc]init];
        _answerContent.lineBreakMode = NSLineBreakByWordWrapping;
        _answerContent.numberOfLines = 0;
        [self addSubview:_answerContent];
    }
    return self;
}

-(void)setViewLayoutWithAnswers:(NSString*)answer andIndex:(int)i andOriginY:(float)originY
{
    if (i % 2 == 0) {
        self.backgroundColor = [UIColor lightGrayColor];
    }
    
    //序号
    _sequenceNumber.text = [NSString stringWithFormat:@"%c",'A'+i];
    
    self.key = answer;
    
    //答案内容
    _answerContent.text = answer;
    
    
    //布局
    
    CGSize answerContentSize = [_answerContent sizeThatFits:CGSizeMake(SCREEN_WIDTH - 60, 1000)];
    _answerContent.frame = CGRectMake(40, 5, answerContentSize.width, answerContentSize.height);
    
    
    _sequenceNumber.bounds = CGRectMake(0, 0,20, 20);
    _sequenceNumber.center = CGPointMake(20, _answerContent.center.y);
    _sequenceNumber.backgroundColor = [UIColor grayColor];
    
    self.frame = CGRectMake(0, originY, SCREEN_WIDTH,answerContentSize.height+10 );
    
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










@interface AnswerBoard()

@property(nonatomic,strong)QuestionModel *question;

@property(nonatomic,strong)NSMutableArray *array;

@property(nonatomic,strong)NSMutableArray *singleAnswerArray;

@end

@implementation AnswerBoard

-(void)willMoveToSuperview:(UIView *)newSuperview
{
    self.singleAnswerArray = [NSMutableArray array];
}



-(void)setViewLayoutWithQuestion:(QuestionModel*)question
{
    self.question = question;
    
    _height = 0;
    
    [_singleAnswerArray removeAllObjects];
    
    NSArray* views = [self subviews];
    for(UIView *view in views)
    {
        [view removeFromSuperview];
    }
    
    
        
    for (int i = 0; i < _question.answerArray.count; i++) {
        SingleAnswerView *singleAnswerView = [[SingleAnswerView alloc]init];
        
        OptionModel *op = _question.answerArray[i];
        NSString *answer = op.title;
        
        [singleAnswerView setViewLayoutWithAnswers:answer andIndex:i andOriginY:_height];
        [self addSubview:singleAnswerView];
        
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(selectAnswer:)];
        [singleAnswerView addGestureRecognizer:tap];
        
        [_singleAnswerArray addObject:singleAnswerView];
        
        
        //设置自设高度标识
        _height += singleAnswerView.frame.size.height;
        
        
    }
    
}



#pragma mark -选择一个答案
-(void)selectAnswer:(UITapGestureRecognizer*)tap
{
    SingleAnswerView* answerView = (SingleAnswerView*)tap.view;
    if ([answerView.key isEqualToString:_question.option_code]) {
        [answerView showResult:YES];
        
#pragma mark ******* 添加进入下一题的代码
        
    }else
    {
        [answerView showResult:NO];
        for (SingleAnswerView* ansView in _singleAnswerArray) {
            if ([ansView.key isEqualToString:_question.option_code]) {
                [ansView showResult:YES];
            }
        }
    }
}




@end
