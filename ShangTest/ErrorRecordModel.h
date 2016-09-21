//
//  ErrorRecordModel.h
//  SHANG
//
//  Created by len on 16/8/25.
//  Copyright © 2016年 com.sxt. All rights reserved.
//
/*{
 "total": 151,
 "message": "查询错题信息成功!",
 "result": [
 {
 "suite_code": "9",
 "count": 43,
 "suite_title": "异常",
 "module_code": "M001",
 "module_title": "java测试"
 },
 {
 "suite_code": "1",
 "count": 82,
 "suite_title": "HTML",
 "module_code": "M001",
 "module_title": "java测试"
 },
 {
 "suite_code": "3",
 "count": 26,
 "suite_title": "常用类",
 "module_code": "M001",
 "module_title": "java测试"
 }
 ]
 }
*/

#import <Foundation/Foundation.h>

@interface ErrorRecordModel : NSObject

@property (nonatomic ,copy)NSString *total;
@property (nonatomic ,copy)NSString *suite_title;
@property (nonatomic ,copy)NSString *module_title;
@property (nonatomic ,copy)NSString *suite_code;
@property (nonatomic ,copy)NSString *module_code;

-(instancetype)initWithDict:(NSDictionary *)dic;
+(instancetype)initWithDict:(NSDictionary *)dic;

@end
