//
//  QuestionModel.h
//  ShangTest
//
//  Created by len on 16/8/10.
//  Copyright © 2016年 sxt. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QuestionModel : NSObject

@property (nonatomic,strong)NSString *question;

@property (nonatomic,strong)NSString *question_code;

@property (nonatomic,strong)NSString *option_code ;

@property (nonatomic,strong)NSString *optionLetter;

@property (nonatomic,strong)NSMutableArray *answerArray;

+(instancetype)creatQuestionWithDict:(NSDictionary*)dict;


@end
