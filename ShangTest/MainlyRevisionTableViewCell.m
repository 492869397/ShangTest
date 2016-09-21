//
//  MainlyRevisionTableViewCell.m
//  ShangTest
//
//  Created by len on 16/9/8.
//  Copyright © 2016年 sxt. All rights reserved.
//

#import "MainlyRevisionTableViewCell.h"
#import "MainlyDetailViewController.h"

@implementation MainlyRevisionTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    
}



- (IBAction)lookDetail:(id)sender {
    MainlyDetailViewController *detail = [[MainlyDetailViewController alloc]init];
    
    detail.dataArray = _array;
    detail.title = _catage;
    
    [_delegate.navigationController pushViewController:detail animated:YES] ;
}


@end
