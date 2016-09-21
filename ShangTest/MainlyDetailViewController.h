//
//  MainlyDetailViewController.h
//  ShangTest
//
//  Created by mac on 16/9/20.
//  Copyright © 2016年 sxt. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TopicView.h"

@interface MainlyDetailViewController : UIViewController<UIScrollViewDelegate>



@property(strong,nonatomic)NSMutableArray *dataArray;

//选择的选项数组

@property(assign,nonatomic)NSInteger displayIndex;
@property(assign,nonatomic)NSInteger leftIndex;


@property(strong,nonatomic)TopicView *leftView;

@property(strong,nonatomic)TopicView *centerView;

@property(strong,nonatomic)TopicView *rightView;

@end
