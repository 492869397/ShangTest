//
//  AnswerBoard.h
//  ShangTest
//
//  Created by len on 16/8/11.
//  Copyright © 2016年 sxt. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QuestionModel.h"
#import "TestMainView.h"

@interface AnswerBoard : UIView<UIGestureRecognizerDelegate>

@property(nonatomic,assign)NSInteger index;

@property(nonatomic,weak)TestMainView *delegate;


@property(nonatomic,assign)float height;

-(void)setViewLayoutWithQuestion:(QuestionModel*)question withDelegate:(TestMainView*)delegate;

-(void)selectOption:(NSString*)option;

@end
