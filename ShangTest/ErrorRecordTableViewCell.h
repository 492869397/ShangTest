//
//  ErrorRecordTableViewCell.h
//  SHANG
//
//  Created by len on 16/8/25.
//  Copyright © 2016年 com.sxt. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ErrorRecordModel.h"
@interface ErrorRecordTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *Titlelbl;
@property (weak, nonatomic) IBOutlet UIButton *LookTitlelbl;
@property (weak, nonatomic) IBOutlet UIButton *ErrorPracticelbl;
@property (strong ,nonatomic)ErrorRecordModel *model;

@property(weak,nonatomic)UIViewController *delegate;

@end
