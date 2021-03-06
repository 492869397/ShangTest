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
    
    if ([dict[@"question"] isKindOfClass:[NSDictionary class]]) {
        
        ques.question = (dict[@"question"])[@"title"];
        ques.question_code = (dict[@"question"])[@"question_code"];
        
    }else
    {
        ques.question = ([dict[@"question"] firstObject])[@"title"];
        ques.question_code = ([dict[@"question"] firstObject])[@"question_code"];
    }
    
    
    ques.option_code = [dict[@"result"] firstObject] [@"option_code"];
    ques.optionLetter = [dict[@"result"] firstObject] [@"result"];
    
    ques.answerArray = [NSMutableArray array];
    
    
    for (NSDictionary *dic in dict[@"option"]) {
        OptionModel *op = [OptionModel creatOptionWithDict:dic];
        [ques.answerArray addObject:op];
        
    }
    
    return ques;
}

@end
