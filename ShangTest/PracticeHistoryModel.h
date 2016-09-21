//
//  PracticeHistoryModel.h
//  SHANG
//
//  Created by len on 16/8/24.
//  Copyright (c) 2016年 com.sxt. All rights reserved.
//
/*{
 "createtime": null,
 "total": 3,
 "message": "查询用户对应的答题记录的题信息成功!",
 "result": [
 {
 "title": "HTML",
 "suite_code": "1"
 },
 {
 "title": "反射",
 "suite_code": "10"
 },
 {
 "title": "网络",
 "suite_code": "7"
 }
 ],
 "time": null
 }
 */
#import <Foundation/Foundation.h>

@interface PracticeHistoryModel : NSObject
@property (nonatomic ,copy)NSString *total;
@property (nonatomic ,copy)NSString *title;
@property (nonatomic ,copy)NSString *content;
@property (nonatomic ,copy)NSString *companyGradeId;
@property (nonatomic ,copy)NSString *interviewTypeId;
@property (nonatomic ,copy)NSString *reviewTypeId;

-(instancetype)initWithDict:(NSDictionary *)dic;
+(instancetype)initWithDict:(NSDictionary *)dic;
@end
