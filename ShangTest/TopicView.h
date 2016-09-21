//
//  TopicView.h
//  ShangTest
//
//  Created by mac on 16/9/20.
//  Copyright © 2016年 sxt. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PracticeHistoryModel.h"

@interface TopicView : UIView
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *content;

@property(assign,nonatomic)NSInteger index;

-(void)setSubviewContentWithModel:(PracticeHistoryModel*)model andIndex:(NSInteger)index;

@end
