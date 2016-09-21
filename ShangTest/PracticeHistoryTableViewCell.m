//
//  PracticeHistoryTableViewCell.m
//  SHANG
//
//  Created by len on 16/8/24.
//  Copyright (c) 2016年 com.sxt. All rights reserved.
//

#import "PracticeHistoryTableViewCell.h"
#import "ResultViewController.h"
#import "QuestionModel.h"

@interface PracticeHistoryTableViewCell ()

@property (weak, nonatomic) IBOutlet UILabel *CoursesTitle;
@property (weak, nonatomic) IBOutlet UIButton *Check;
@end

@implementation PracticeHistoryTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}
-(void)setCellContent:(NSDictionary *)dict
{
    _suiteCode = dict[@"suite_code"];
    [self.CoursesTitle setText:[NSString stringWithFormat:@"%@",dict[@"title"]]];
    
}

- (IBAction)CheckClick:(id)sender {
    [self getDataFromNet];
}

-(void)getDataFromNet
{
    NSMutableDictionary *params2=[NSMutableDictionary dictionary];
    params2[@"student_id"] = @"201505050101002";
    params2[@"suite_code"] = _suiteCode;
    
    AFHTTPRequestOperationManager *mgr2=[AFHTTPRequestOperationManager manager];
    [mgr2 POST:@"http://139.224.73.86:8080//sxt_studentsystem/selectTTestorRecord1.do" parameters:params2  success:^(AFHTTPRequestOperation * operation, id responsObject)
     {
         NSMutableArray *arr = [NSMutableArray array];
         NSMutableArray *selectArr = [NSMutableArray array];
         
         for (NSDictionary *dic in responsObject[@"result"]) {
             QuestionModel *q = [QuestionModel creatQuestionWithDict:dic];
             [arr addObject:q];
             [selectArr addObject:dic[@"recordResult"]];
         }
         
         ResultViewController *result = [[ResultViewController alloc]init];
         result.dataArray = arr;
         result.selectArray = selectArr;
         [_delegate.navigationController pushViewController:result animated:YES];
         
     } failure:^(AFHTTPRequestOperation * operation, NSError * error)
     {
         
     }];
    
}

@end
