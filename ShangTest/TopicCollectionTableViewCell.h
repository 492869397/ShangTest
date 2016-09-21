//
//  TopicCollectionTableViewCell.h
//  ShangTest
//
//  Created by mac on 16/9/20.
//  Copyright © 2016年 sxt. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QuestionModel.h"


@interface TopicCollectionTableViewCell : UITableViewCell

@property(strong,nonatomic)QuestionModel *question;

@property (weak, nonatomic) IBOutlet UILabel *title;

@property(strong,nonatomic)NSString *question_code;

@property(weak,nonatomic)UIViewController *delegate;

@end
