//
//  MainlyRevisionTableViewCell.h
//  ShangTest
//
//  Created by len on 16/9/8.
//  Copyright © 2016年 sxt. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface MainlyRevisionTableViewCell : UITableViewCell

@property(weak,nonatomic)UIViewController *delegate;

@property(strong,nonatomic)NSMutableArray *array;
@property(strong,nonatomic)NSString *catage;

@property (weak, nonatomic) IBOutlet UILabel *lblTitleOne;
@property (weak, nonatomic) IBOutlet UILabel *lblTitleTwo;
@property (weak, nonatomic) IBOutlet UIButton *btnClick;

@end
