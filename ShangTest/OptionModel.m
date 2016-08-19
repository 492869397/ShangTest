//
//  OptionModel.m
//  ShangTest
//
//  Created by len on 16/8/18.
//  Copyright © 2016年 sxt. All rights reserved.
//

#import "OptionModel.h"

@implementation OptionModel

+(instancetype)creatOptionWithDict:(NSDictionary*)dict
{
    OptionModel *op = [[OptionModel alloc]init];
    op.title = dict[@"title"];
    op.option_code = dict[@"option_code"];
    
    return op;
}

@end
