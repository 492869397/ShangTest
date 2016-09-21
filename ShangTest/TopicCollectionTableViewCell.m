//
//  TopicCollectionTableViewCell.m
//  ShangTest
//
//  Created by mac on 16/9/20.
//  Copyright © 2016年 sxt. All rights reserved.
//

#import "TopicCollectionTableViewCell.h"
#import "AnswerDetailViewController.h"

@implementation TopicCollectionTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (IBAction)lookDetail:(id)sender {
    
    [_delegate showMessage:@"正在加载"];
    
    NSDictionary *pass = [NSDictionary dictionaryWithObject:_question_code forKey:@"question_code"];
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager POST:@"http://139.224.73.86:8080/sxt_studentsystem/selectTCollection2.do" parameters:pass success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        
        [_delegate hiddenWaitHUD];
        
        NSDictionary *dic = responseObject;
        
        
        self.question = [QuestionModel creatQuestionWithDict:dic];
        
        [self showQuestion];
        
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        [_delegate hiddenWaitHUD];
        [_delegate showHUDWithMessage:@"网络错误" HiddenDelay:0.5];
        
    }];
}

-(void)showQuestion{
    AnswerDetailViewController *detail = [[AnswerDetailViewController alloc]init];
    
    detail.question = _question;
    
    [_delegate.navigationController pushViewController:detail animated:YES];
}

@end
