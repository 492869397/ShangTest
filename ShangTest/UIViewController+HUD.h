//
//  UIViewController+HUD.h
//  ShangTest
//
//  Created by len on 16/8/22.
//  Copyright © 2016年 sxt. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MBProgressHUD.h"


@interface UIViewController (HUD)

-(MBProgressHUD *)showMessage:(NSString *)message;

-(void)hiddenWaitHUD;

-(void)showHUDWithMessage:(NSString*)message HiddenDelay:(NSTimeInterval)delay;

@end
