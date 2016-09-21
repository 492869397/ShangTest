//
//  ErrorRecordTableViewCell.m
//  SHANG
//
//  Created by len on 16/8/25.
//  Copyright © 2016年 com.sxt. All rights reserved.
//

#import "ErrorRecordTableViewCell.h"
#import "ErrorCheckViewController.h"
#import "ErrorRemakeViewController.h"

@implementation ErrorRecordTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(void)setModel:(ErrorRecordModel *)model
{
    _model = model;
    NSString *strSign = @"--";
    [self.Titlelbl setText:[NSString stringWithFormat:@"%@%@%@",model.module_title,strSign,model.suite_title]];
    
}

- (IBAction)lookMistakeTopic:(id)sender {
    ErrorCheckViewController *viewController = [[ErrorCheckViewController alloc]init];
    [_delegate.navigationController pushViewController:viewController animated:YES];
    viewController.suite_code = _model.suite_code;
}

- (IBAction)practiceMistakeTopic:(id)sender {
    ErrorRemakeViewController *viewController = [[ErrorRemakeViewController alloc]init];
    [_delegate.navigationController pushViewController:viewController animated:YES];
    viewController.suite_code = _model.suite_code;
}

@end
