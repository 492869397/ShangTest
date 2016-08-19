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
    self.index = index;
    self.question = question;
    self.questionTitle.text = [NSString stringWithFormat:@"%ld.%@",index,question.question];
    [_answerBorad setViewLayoutWithQuestion:question withDelegate:self];
    
    //刷新answerView的高度
    _heightConstraint.constant = _answerBorad.height;
    
    _delegate.centerScroll.contentSize = CGSizeMake(SCREEN_WIDTH, _answerBorad.frame.origin.y + _answerBorad.frame.size.height);

}

-(void)selectOption:(NSString*)option
{
    [_answerBorad selectOption:option];
}

@end
