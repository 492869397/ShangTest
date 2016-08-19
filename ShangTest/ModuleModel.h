//
//  ModuleModel.h
//  ShangTest
//
//  Created by len on 16/8/18.
//  Copyright © 2016年 sxt. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ModuleModel : NSObject

@property(nonatomic,strong)NSString *module_name;

@property(nonatomic,strong)NSString *module_code;

@property(nonatomic,strong)NSNumber *ID;


+(instancetype)creatModuleWithDict:(NSDictionary*)dict;

@end
