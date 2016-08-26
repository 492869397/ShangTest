//
//  ErrorRecordModel.m
//  SHANG
//
//  Created by len on 16/8/25.
//  Copyright © 2016年 com.sxt. All rights reserved.
//

#import "ErrorRecordModel.h"

@implementation ErrorRecordModel

-(instancetype)initWithDict:(NSDictionary *)dic
{
    
    if ( self = [super init])
    {
        self.total = dic[@"total"];
        self.suite_title = dic[@"suite_title"];
        self.module_title = dic[@"module_title"];
        
    }
    return self;
}
+(instancetype)initWithDict:(NSDictionary *)dic
{
    return [[self alloc]initWithDict:dic];
}

@end
