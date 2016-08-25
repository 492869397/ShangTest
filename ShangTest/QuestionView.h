//
//  QuestionView.h
//  ShangTest
//
//  Created by len on 16/8/24.
//  Copyright © 2016年 sxt. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QuestionModel.h"
@class TestViewController;
@interface QuestionView : UIView

@property(nonatomic,assign)NSInteger index;

@property(nonatomic,assign)BOOL canTouch;

@property(nonatomic,weak)TestViewController *delegate;

-(void)setContentWithQuestion:(QuestionModel*)question withIndex:(NSInteger)index;

-(void)selectOption:(NSString*)option;

@end
