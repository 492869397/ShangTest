//
//  PracticeHistoryModel.m
//  SHANG
//
//  Created by len on 16/8/24.
//  Copyright (c) 2016年 com.sxt. All rights reserved.
//

#import "PracticeHistoryModel.h"

@implementation PracticeHistoryModel
-(instancetype)initWithDict:(NSDictionary *)dic
{
    
    if ( self = [super init])
    {
        self.total = dic[@"total"];
        self.title = dic[@"title"];
   
    }
    return self;
}
+(instancetype)initWithDict:(NSDictionary *)dic
{
    return [[self alloc]initWithDict:dic];
}

@end
