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

//代理
@property(weak,nonatomic)AnswerBoard *answer;

@property(strong,nonatomic)NSString *key;

@property(strong,nonatomic)UILabel *sequenceNumber;

@property(strong,nonatomic)UILabel *answerContent;

-(void)showResult:(BOOL)result;

-(void)setViewLayoutWithAnswers:(NSString*)answer withOptionCode:(NSString*)option_code andIndex:(int)i andOriginY:(float)originY;

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

-(void)setViewLayoutWithAnswers:(NSString*)answer withOptionCode:(NSString*)option_code andIndex:(int)i andOriginY:(float)originY
{
    if (i % 2 == 0) {
        self.backgroundColor = [UIColor lightGrayColor];
    }
    
    //序号
    _sequenceNumber.text = [NSString stringWithFormat:@"%c",'A'+i];
    
    self.key = option_code;
    
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

@property(nonatomic,strong)UIScrollView *scroll;

@end

@implementation AnswerBoard

-(void)willMoveToSuperview:(UIView *)newSuperview
{
    self.singleAnswerArray = [NSMutableArray array];
    
}



-(void)setViewLayoutWithQuestion:(QuestionModel*)question withDelegate:(TestMainView*)delegate
{
    self.delegate = delegate;
    
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
        NSString *option = op.option_code;
        
        [singleAnswerView setViewLayoutWithAnswers:answer withOptionCode:option andIndex:i andOriginY:_height];
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
    
    NSString *s = [NSString stringWithString:answerView.key];
    [_delegate.selectArray replaceObjectAtIndex:_delegate.index withObject:s];
    
    [self selectOption:s];
    
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




@end
