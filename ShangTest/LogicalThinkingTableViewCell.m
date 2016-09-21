//
//  LogicalThinkingTableViewCell.m
//  ShangTest
//
//  Created by len on 16/9/6.
//  Copyright © 2016年 sxt. All rights reserved.
//

#import "LogicalThinkingTableViewCell.h"
@interface LogicalThinkingTableViewCell ()

@property (weak, nonatomic) IBOutlet UILabel *ProblemTitle;
@property (weak, nonatomic) IBOutlet UILabel *AnswerTitle;

@end@implementation LogicalThinkingTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
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
    [self.ProblemTitle setText:[NSString stringWithFormat:@"%@",model.title]];
    [self.AnswerTitle setText:[NSString stringWithFormat:@"%@",model.content]];
    
    //    [self.Smalltitle setText:model.content];
    //    NSURL *url = [NSURL URLWithString:model.photo];
    //    [self.imageview  sd_setImageWithURL:url];
    
}

@end
