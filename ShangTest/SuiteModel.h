//
//  SuiteModel.h
//  ShangTest
//
//  Created by len on 16/8/18.
//  Copyright © 2016年 sxt. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SuiteModel : NSObject

@property(nonatomic,strong)NSString *suite_code;

@property(nonatomic,strong)NSString *type;

@property(nonatomic,strong)NSString *title;

@property(nonatomic,strong)NSNumber *ID;

@property(nonatomic,strong)NSNumber *question_num;

@property(nonatomic,strong)NSString *module_code;



+(instancetype)creatSuiteWithDict:(NSDictionary*)dict;


@end
