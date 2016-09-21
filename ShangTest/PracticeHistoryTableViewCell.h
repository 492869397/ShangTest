//
//  PracticeHistoryTableViewCell.h
//  SHANG
//
//  Created by len on 16/8/24.
//  Copyright (c) 2016年 com.sxt. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface PracticeHistoryTableViewCell : UITableViewCell

@property (strong ,nonatomic)NSString *suiteCode;

@property(strong,nonatomic)UIViewController *delegate;


-(void)setCellContent:(NSDictionary *)dict;
@end
