//
//  SecondSelectTableViewCell.h
//  ShangTest
//
//  Created by len on 16/8/17.
//  Copyright © 2016年 sxt. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ModuleModel.h"


@interface SecondSelectTableViewCell : UITableViewCell

@property(nonatomic,strong)ModuleModel *module;

@property (weak, nonatomic) IBOutlet UILabel *number;

@end
