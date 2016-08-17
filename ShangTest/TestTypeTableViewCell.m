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
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)rand15:(UIButton *)sender {
    
    TestViewController *test = [[TestViewController alloc]init];
    
    [self.delegate.navigationController pushViewController:test animated:YES];
    
    test.testType = sender.tag;
    
}

@end
