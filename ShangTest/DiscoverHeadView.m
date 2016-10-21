//
//  DiscoverHeadView.m
//  ShangTest
//
//  Created by mac on 16/9/23.
//  Copyright © 2016年 sxt. All rights reserved.
//

#import "DiscoverHeadView.h"

@implementation DiscoverHeadView

-(instancetype)init
{
    self = [super init];
    
    if (self ) {
        
        //collection头视图
        __weak UIView *head = self;
        
        UILabel *title = [[UILabel alloc]init];
        title.text = @"公司领导莅临尚学堂专长招聘";
        title.font = [UIFont systemFontOfSize:19];
        title.textColor = [UIColor redColor];
        
        [head addSubview:title];
        
        [title mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(20);
            make.centerX.equalTo(head);
        }];
        
        NSArray *arr = @[@"北京融汇兴业网络技术有限公司",@"中数博阳信息技术有限公司",@"信达财产保险有限公司",@"中软通达（北京）科技有限公司",@"北京米花互动科技有限公司",@"北京万维通港科技有限公司",@"北京华夏迅联信息技术有限公司",@"北京盛华实科技有限公司"];
        
        int i = 1 ;
        UILabel *lastLabel , *l;
        for (NSString *s in arr) {
            l = [[UILabel alloc]init];
            l.text = [NSString stringWithFormat:@"%d.%@",i,s];
            [head addSubview:l];
            i++;
            
            if (i == 1) {
                [l mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.top.mas_equalTo(head.bottom).offset(20);
                    make.left.equalTo(head).offset(15);
                }];
            }else if (i % 2 == 0) {
                [l mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.top.mas_equalTo(lastLabel.bottom).offset(5);
                    make.left.equalTo(head).offset(SCREEN_WIDTH/2);
                }];
            }else
            {
                [l mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.top.mas_equalTo(lastLabel.bottom).offset(5);
                    make.left.equalTo(head).offset(15);
                }];
            }
            
            lastLabel = l;
        }
        [l mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(head).offset(20);
        }];
    }
    
    return self;
    
}

@end
