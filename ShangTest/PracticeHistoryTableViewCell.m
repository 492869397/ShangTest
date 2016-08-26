//
//  PracticeHistoryTableViewCell.m
//  SHANG
//
//  Created by len on 16/8/24.
//  Copyright (c) 2016年 com.sxt. All rights reserved.
//

#import "PracticeHistoryTableViewCell.h"

@interface PracticeHistoryTableViewCell ()

@property (weak, nonatomic) IBOutlet UILabel *CoursesTitle;
@property (weak, nonatomic) IBOutlet UIButton *Check;
- (IBAction)CheckClick:(id)sender;
@end

@implementation PracticeHistoryTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}
-(void)setModel:(PracticeHistoryModel *)model
{
    _model = model;
    //[self.CoursesTitle setText:PHmodel.title];
    [self.CoursesTitle setText:[NSString stringWithFormat:@"%@",model.title]];
//    [self.Smalltitle setText:model.content];
//    NSURL *url = [NSURL URLWithString:model.photo];
//    [self.imageview  sd_setImageWithURL:url];
    
}

- (IBAction)CheckClick:(id)sender {
    
}

@end
