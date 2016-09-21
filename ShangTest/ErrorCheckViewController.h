//
//  ErrorCheckViewController.h
//  ShangTest
//
//  Created by mac on 16/9/21.
//  Copyright © 2016年 sxt. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QuestionView.h"

@interface ErrorCheckViewController : UIViewController<UIScrollViewDelegate>

@property(nonatomic,strong)NSString *suite_code;

@property(strong,nonatomic)NSMutableArray *dataArray;

//选择的选项数组
@property(strong,nonatomic)NSMutableArray *selectArray;

@property(assign,nonatomic)NSInteger displayIndex;



@property(strong,nonatomic)QuestionView *leftView;

@property(strong,nonatomic)QuestionView *centerView;

@property(strong,nonatomic)QuestionView *rightView;


@end
