//
//  ModuleModel.m
//  ShangTest
//
//  Created by len on 16/8/18.
//  Copyright © 2016年 sxt. All rights reserved.
//

#import "ModuleModel.h"

@implementation ModuleModel

+(NSDictionary*)mj_replacedKeyFromPropertyName
{
    return @{
             @"ID":@"id",
             @"module_name":@"module_name",
             @"module_code":@"module_code"
             };
}

+(instancetype)creatModuleWithDict:(NSDictionary*)dict
{
    ModuleModel *m = [[ModuleModel alloc]init];
    m.ID = dict[@"id"];
    m.module_name = dict[@"module_name"];
    m.module_code = dict[@"module_code"];
    
    return m;
}


@end
