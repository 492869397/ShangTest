//
//  SuiteModel.m
//  ShangTest
//
//  Created by len on 16/8/18.
//  Copyright © 2016年 sxt. All rights reserved.
//

#import "SuiteModel.h"

@implementation SuiteModel

+(instancetype)creatSuiteWithDict:(NSDictionary*)dict
{
    SuiteModel *s = [[SuiteModel alloc]init];
    s.ID = dict[@"id"];
    s.suite_code = dict[@"suite_code"];
    s.type = dict[@"type"];
    s.title = dict[@"title"];
    s.question_num = dict[@"question_num"];
    s.module_code = dict[@"module_code"];
    
    return s;
}

@end
