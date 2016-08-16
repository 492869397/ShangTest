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




-(void)setContentWithQuestion:(QuestionModel*)question
{
    self.question = question;
    self.questionTitle.text = question.title;
    [_answerBorad setViewLayoutWithQuestion:question];
    
    //刷新answerView的高度
    _heightConstraint.constant = _answerBorad.height;

}


@end
