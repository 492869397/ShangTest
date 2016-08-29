//
//  TestResultViewController.m
//  ShangTest
//
//  Created by len on 16/8/23.
//  Copyright © 2016年 sxt. All rights reserved.
//

#import "TestResultViewController.h"
#import "SHPieChartView.h"
#import "OptionModel.h"
#import "QuestionModel.h"

@interface TestResultViewController ()
@property (weak, nonatomic) IBOutlet UILabel *quesCount;

@property (weak, nonatomic) IBOutlet UILabel *wrongCount;

@property (weak, nonatomic) IBOutlet SHPieChartView *pieCharView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *buttonHeight;
@property (weak, nonatomic) IBOutlet UIView *buttonView;
@property (weak, nonatomic) IBOutlet UIView *analyseView;


@property (weak, nonatomic) IBOutlet UILabel *questionTitle;
@property (weak, nonatomic) IBOutlet UILabel *A;
@property (weak, nonatomic) IBOutlet UILabel *B;
@property (weak, nonatomic) IBOutlet UILabel *C;

@property (weak, nonatomic) IBOutlet UILabel *D;

@property (weak, nonatomic) IBOutlet UILabel *answer;


@end

@implementation TestResultViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [_pieCharView addAngleValue:.6 andColor:[UIColor redColor]];
    [_pieCharView addAngleValue:.4 andColor:[UIColor yellowColor]];
    
    
}



-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self setButtonViewLayout];

}

-(void)setButtonViewLayout
{
    
    
    for (UIView *v in _buttonView.subviews) {
        [v removeFromSuperview];
    }
    
    
    float singleWidth = (SCREEN_WIDTH-20-3*9)/10;
    
    int i;
    int wrongCount = 0;
    for ( i = 0; i < ceilf(_dataArray.count/10.0); i++) {
        for (int j = 0; i*10+j < _dataArray.count && j < 10; j++) {
            UIButton *b = [[UIButton alloc]init];
            [_buttonView addSubview:b];
            [b setTitle:[NSString stringWithFormat:@"%d",i*10+j +1] forState:UIControlStateNormal];
            b.tag = i*10+j+1;
            [b addTarget:self action:@selector(showAnalyse:) forControlEvents:UIControlEventTouchUpInside];
            
            [b setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            b.layer.masksToBounds = YES;
            b.layer.borderWidth = 0.5;
            b.layer.borderColor = [UIColor blueColor].CGColor;
            b.frame = CGRectMake(10+j*(singleWidth+3),3+ i*(singleWidth+3), singleWidth, singleWidth);
            
            //设置做错题的按钮颜色
            
            QuestionModel *ques = _dataArray[i*10+j];
            NSString *code = ques.option_code;
            NSString *s = _selectArray[i*10+j];
            if(![s isEqualToString:code])
            {
               [b setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
                wrongCount++;
            }
        }
    }
    _buttonHeight.constant = i * (singleWidth +3) +3;
    
    
    _quesCount.text = [NSString stringWithFormat:@"本次练习含：%ld道题",_dataArray.count];
    _wrongCount.text = [NSString stringWithFormat:@"答错%d道",wrongCount];
    
}

-(void)showAnalyse:(UIButton*)sender
{
    QuestionModel *ques = _dataArray[sender.tag-1];
    _questionTitle.text = [NSString stringWithFormat:@"%ld.%@",sender.tag,ques.question];
    OptionModel *option = (OptionModel*)ques.answerArray[0];
    _A.text = [NSString stringWithFormat:@"A. %@",option.title];
    
    option = (OptionModel*)ques.answerArray[1];
    _B.text = [NSString stringWithFormat:@"B. %@",option.title];
    
    option = (OptionModel*)ques.answerArray[2];
    _C.text = [NSString stringWithFormat:@"C. %@",option.title];
    
    option = (OptionModel*)ques.answerArray[3];
    _D.text = [NSString stringWithFormat:@"D. %@",option.title];
    
    NSString *a = _selectArray[sender.tag-1];
    NSString *s = [a substringFromIndex:a.length-1];
    
    _answer.text = [NSString stringWithFormat:@"正确答案是:%@,您的选择是:%c",ques.optionLetter,s.intValue+'A'-1];
    
    
    //设置按钮选中的背景颜色
    for (int i=1; i<=_dataArray.count;i++ ) {
        UIButton *b = [_buttonView viewWithTag:i];
        b.backgroundColor = [UIColor whiteColor];
    }
    sender.backgroundColor = [UIColor lightGrayColor];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
