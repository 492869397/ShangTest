//
//  SecondSelectTableViewCell.m
//  ShangTest
//
//  Created by len on 16/8/17.
//  Copyright © 2016年 sxt. All rights reserved.
//

#import "SecondSelectTableViewCell.h"

@interface SecondSelectTableViewCell ()

@property (weak, nonatomic) IBOutlet UILabel *count;

@property (weak, nonatomic) IBOutlet UILabel *title;


@end

@implementation SecondSelectTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    _number.layer.masksToBounds = YES;
    _number.layer.cornerRadius = 11;
    _number.layer.borderWidth = 0.5;
    _number.layer.borderColor = [UIColor lightGrayColor].CGColor;
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setModule:(ModuleModel *)module
{
    _module = module;
    _title.text = module.module_name;
    
    //    cell.count.text =
}

@end
