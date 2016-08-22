//
//  UIViewController+HUD.m
//  ShangTest
//
//  Created by len on 16/8/22.
//  Copyright © 2016年 sxt. All rights reserved.
//

#import "UIViewController+HUD.h"
#import "MBProgressHUD.h"

@implementation UIViewController (HUD)

-(void)showWaitHUD
{
    
}

-(MBProgressHUD *)showMessage:(NSString *)message
{
    UIView *view;
    if (self.view == nil)
        view = [[UIApplication sharedApplication].windows lastObject];
    else
        view = self.view;
    
    // 快速显示一个提示信息
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.tag = 1000;
    hud.label.text = message;
    // 隐藏时候从父控件中移除
    hud.removeFromSuperViewOnHide = YES;
    // YES代表需要蒙版效果
    hud.dimBackground = YES;
    return hud;
}

-(void)hiddenWaitHUD
{
    MBProgressHUD *hud = [self.view viewWithTag:1000];
    if (hud) {
        hud.hidden = YES;
    }
}

@end
