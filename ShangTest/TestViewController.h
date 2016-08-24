//
//  TestViewController.h
//  ShangTest
//
//  Created by len on 16/8/9.
//  Copyright © 2016年 sxt. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QuestionView.h"


typedef NS_ENUM(NSInteger,TestType)
{
    rand15 = 1,
    rand30,
    rand60,
    noRand
};

@interface TestViewController : UIViewController<UIScrollViewDelegate>

@property(nonatomic,assign)TestType testType;

@property(nonatomic,strong)NSString *suite_code;

@property(strong,nonatomic)NSMutableArray *dataArray;

//选择的选项数组
@property(strong,nonatomic)NSMutableArray *selectArray;

@property(assign,nonatomic)NSInteger displayIndex;



@property(strong,nonatomic)QuestionView *leftView;

@property(strong,nonatomic)QuestionView *centerView;

@property(strong,nonatomic)QuestionView *rightView;


-(void)commitAnswer;

@end
