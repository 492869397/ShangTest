//
//  AnswerDetailViewController.m
//  ShangTest
//
//  Created by mac on 16/9/20.
//  Copyright © 2016年 sxt. All rights reserved.
//

#import "AnswerDetailViewController.h"
#import "OptionModel.h"


@interface AnswerDetailViewController ()

@property (weak, nonatomic) IBOutlet UILabel *questionTitle;
@property (weak, nonatomic) IBOutlet UILabel *A;
@property (weak, nonatomic) IBOutlet UILabel *B;
@property (weak, nonatomic) IBOutlet UILabel *C;
@property (weak, nonatomic) IBOutlet UILabel *D;
@property (weak, nonatomic) IBOutlet UILabel *answer;

@end

@implementation AnswerDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setSubview];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setSubview
{
    _questionTitle.text = [NSString stringWithFormat:@"%@",_question.question];
    OptionModel *option = (OptionModel*)_question.answerArray[0];
    _A.text = [NSString stringWithFormat:@"A. %@",option.title];
    
    option = (OptionModel*)_question.answerArray[1];
    _B.text = [NSString stringWithFormat:@"B. %@",option.title];
    
    option = (OptionModel*)_question.answerArray[2];
    _C.text = [NSString stringWithFormat:@"C. %@",option.title];
    
    option = (OptionModel*)_question.answerArray[3];
    _D.text = [NSString stringWithFormat:@"D. %@",option.title];
    
    
    _answer.text = [NSString stringWithFormat:@"正确答案是:%@",_question.optionLetter];
}

@end
