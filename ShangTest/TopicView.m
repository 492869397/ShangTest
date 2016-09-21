//
//  TopicView.m
//  ShangTest
//
//  Created by mac on 16/9/20.
//  Copyright © 2016年 sxt. All rights reserved.
//

#import "TopicView.h"

@implementation TopicView

-(void)setSubviewContentWithModel:(PracticeHistoryModel*)model andIndex:(NSInteger)index
{
    _title.text = model.title;
    _content.text = model.content;
    _index = index;
}

@end
