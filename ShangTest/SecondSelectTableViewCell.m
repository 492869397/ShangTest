//
//  SecondSelectTableViewCell.m
//  ShangTest
//
//  Created by len on 16/8/17.
//  Copyright © 2016年 sxt. All rights reserved.
//

#import "SecondSelectTableViewCell.h"


@implementation SecondSelectTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    _number.layer.masksToBounds = YES;
    _number.layer.cornerRadius = 12.5;
    _number.layer.borderWidth = 0.5;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
