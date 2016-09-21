//
//  CompanyInterviewTableViewCell.m
//  ShangTest
//
//  Created by len on 16/9/6.
//  Copyright © 2016年 sxt. All rights reserved.
//

#import "CompanyInterviewTableViewCell.h"
@interface CompanyInterviewTableViewCell ()

@property (weak, nonatomic) IBOutlet UILabel *ProblemTitle;
@property (weak, nonatomic) IBOutlet UILabel *AnswerTitle;

@end
@implementation CompanyInterviewTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
   
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(void)setModel:(PracticeHistoryModel *)model
{
    _model = model;
    [self.ProblemTitle setText:model.title];
    [self.AnswerTitle setText:model.content];
    //        [self.ProblemTitle setText:[NSString stringWithFormat:@"%@",model.title]];
    //        [self.AnswerTitle setText:[NSString stringWithFormat:@"%@",model.content]];
    //    [self.Smalltitle setText:model.content];
    //    NSURL *url = [NSURL URLWithString:model.photo];
    //    [self.imageview  sd_setImageWithURL:url];
    
}

@end
