//
//  TestMainView.h
//  ShangTest
//
//  Created by len on 16/8/9.
//  Copyright © 2016年 sxt. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TestViewController.h"
#import "QuestionModel.h"

@interface TestMainView : UIView<UIGestureRecognizerDelegate>

@property(nonatomic,weak)TestViewController *delegate;

@property(nonatomic,assign)NSInteger index;

@property(nonatomic,weak)NSMutableArray *selectArray;

-(void)setContentWithQuestion:(QuestionModel*)question withIndex:(NSInteger)index;

-(void)selectOption:(NSString*)option;

@end
