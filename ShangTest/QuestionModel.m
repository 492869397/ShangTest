//
//  QuestionModel.m
//  ShangTest
//
//  Created by len on 16/8/10.
//  Copyright © 2016年 sxt. All rights reserved.
//

#import "QuestionModel.h"
#import "OptionModel.h"

@implementation QuestionModel

+(instancetype)creatQuestionWithDict:(NSDictionary*)dict
{
    QuestionModel *ques = [[QuestionModel alloc]init];
    ques.question = (dict[@"question"])[@"title"];
    ques.option_code = [dict[@"result"] firstObject] [@"option_code"];
    ques.question_code = (dict[@"question"])[@"question_code"];
    ques.answerArray = [NSMutableArray array];
    
    for (NSDictionary *dic in dict[@"option"]) {
        OptionModel *op = [OptionModel creatOptionWithDict:dic];
        [ques.answerArray addObject:op];
        
    }
    
    return ques;
}

@end
