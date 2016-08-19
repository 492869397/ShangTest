//
//  TestTypeTableViewCell.h
//  ShangTest
//
//  Created by len on 16/8/17.
//  Copyright © 2016年 sxt. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SuiteModel.h"

@interface TestTypeTableViewCell : UITableViewCell

@property(nonatomic,weak)UIViewController *delegate;
@property (weak, nonatomic) IBOutlet UILabel *number;
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *count;

@property(nonatomic,strong)SuiteModel *suite;

@end
