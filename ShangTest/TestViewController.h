//
//  TestViewController.h
//  ShangTest
//
//  Created by len on 16/8/9.
//  Copyright © 2016年 sxt. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger,TestType)
{
    rand15 = 1,
    rand30,
    rand60,
    noRand
};

@interface TestViewController : UIViewController<UIScrollViewDelegate>

@property(nonatomic,assign)TestType testType;

@end
