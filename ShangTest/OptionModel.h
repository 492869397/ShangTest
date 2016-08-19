//
//  OptionModel.h
//  ShangTest
//
//  Created by len on 16/8/18.
//  Copyright © 2016年 sxt. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OptionModel : NSObject

@property(nonatomic,strong)NSString *title;

@property(nonatomic,strong)NSString *option_code;


+(instancetype)creatOptionWithDict:(NSDictionary*)dict;

@end
