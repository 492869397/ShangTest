//
//  InitModel.m
//  ShangTest
//
//  Created by len on 16/8/16.
//  Copyright © 2016年 sxt. All rights reserved.
//

#import "InitModel.h"

@implementation InitModel

+(void)setModel
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager POST:@"http://123.57.28.11:8080/sxt_studentsystem/selectTModule.do" parameters:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        NSLog(@"%@",responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
    }];
}

@end
