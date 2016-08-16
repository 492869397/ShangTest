//
//  AnswerBoard.h
//  ShangTest
//
//  Created by len on 16/8/11.
//  Copyright © 2016年 sxt. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QuestionModel.h"

@interface AnswerBoard : UIView<UIGestureRecognizerDelegate>


@property(nonatomic,assign)float height;

-(void)setViewLayoutWithQuestion:(QuestionModel*)question;

@end
