//
//  TestViewController.h
//  ShangTest
//
//  Created by len on 16/8/9.
//  Copyright © 2016年 sxt. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TestMainView;

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


@property(assign,nonatomic)NSInteger displayIndex;

@property(strong,nonatomic)UIScrollView *centerScroll;

@property(strong,nonatomic)UIScrollView *leftScroll;

@property(strong,nonatomic)UIScrollView *rightScroll;

@property(strong,nonatomic)TestMainView *leftView;

@property(strong,nonatomic)TestMainView *centerView;

@property(strong,nonatomic)TestMainView *rightView;

@end
