//
//  TestMainView.m
//  ShangTest
//
//  Created by len on 16/8/9.
//  Copyright © 2016年 sxt. All rights reserved.
//

#import "TestMainView.h"
#import "AnswerBoard.h"


@interface TestMainView()

@property(nonatomic,strong)QuestionModel *question;

@property (weak, nonatomic) IBOutlet UILabel *questionTitle;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *heightConstraint;

@property (weak, nonatomic) IBOutlet AnswerBoard *answerBorad;


@end

@implementation TestMainView

-(void)didMoveToSuperview
{
    _heightConstraint.constant = _answerBorad.height;

}




-(void)setContentWithQuestion:(QuestionModel*)question withIndex:(NSInteger)index
{
    UIView *v = [self viewWithTag:100];
    [v removeFromSuperview];
    
    self.index = index;
    self.question = question;
    self.questionTitle.text = [NSString stringWithFormat:@"%ld.%@",index+1,question.question];
    [_answerBorad setViewLayoutWithQuestion:question withDelegate:self];
    
    //刷新answerView的高度
    _heightConstraint.constant = _answerBorad.height;
    
    UIScrollView *view ;
    if (self == _delegate.rightView) {
        view = _delegate.rightScroll;
    }
    if (self == _delegate.leftView) {
        view = _delegate.leftScroll;
    }
    if (self == _delegate.centerView) {
        view = _delegate.centerScroll;
    }
    
    CGFloat hei = 0;
    if (index >= _delegate.dataArray.count-1) {
        UIButton *b = [[UIButton alloc]initWithFrame:CGRectMake((SCREEN_WIDTH-80)/2,_answerBorad.frame.origin.y + _answerBorad.height +20, 80, 40)];
        b.backgroundColor = [UIColor redColor];
        b.tag = 100;
        [self addSubview:b];
        hei = 60;
    }
    
    view.contentSize = CGSizeMake(SCREEN_WIDTH, _answerBorad.frame.origin.y + _answerBorad.height + hei);
    

}




-(void)selectOption:(NSString*)option
{
    [_answerBorad selectOption:option];
}

@end
