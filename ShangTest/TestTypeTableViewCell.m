//
//  TestTypeTableViewCell.m
//  ShangTest
//
//  Created by len on 16/8/17.
//  Copyright © 2016年 sxt. All rights reserved.
//

#import "TestTypeTableViewCell.h"
#import "TestViewController.h"

@implementation TestTypeTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];

    _number.layer.masksToBounds = YES;
    _number.layer.cornerRadius = 12.5;
    _number.layer.borderWidth = 0.5;
    _number.layer.borderColor = [UIColor lightGrayColor].CGColor;

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setSuite:(SuiteModel *)suite
{
    _suite = suite;
    
    self.title.text = _suite.title;
    
    _count.text = [NSString stringWithFormat:@"(共%@道题)",_suite.question_num];
}

- (IBAction)rand15:(UIButton *)sender {
    
    TestViewController *test = [[TestViewController alloc]init];
    
    [self.delegate.navigationController pushViewController:test animated:YES];
    test.suite_code = _suite.suite_code;
    
    test.testType = sender.tag;
    
}

@end
