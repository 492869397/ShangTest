//
//  UIViewController+HUD.m
//  ShangTest
//
//  Created by len on 16/8/22.
//  Copyright © 2016年 sxt. All rights reserved.
//

#import "UIViewController+HUD.h"

@implementation UIViewController (HUD)

-(void)showHUDWithMessage:(NSString*)message HiddenDelay:(NSTimeInterval)delay
{
    UIView *view;
    if (self.view == nil)
        view = [[UIApplication sharedApplication].windows lastObject];
    else
        view = self.view;
    
 
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
//    hud.mode = MBProgressHUDModeAnnularDeterminate;
    hud.label.text = message;
    
    [hud hideAnimated:YES afterDelay:delay];
}

-(MBProgressHUD *)showMessage:(NSString *)message
{
    UIView *view;
    if (self.view == nil)
        view = [[UIApplication sharedApplication].windows lastObject];
    else
        view = self.view;
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.label.text = message;
    return hud;
}

-(void)hiddenWaitHUD
{
//    MBProgressHUD *hud = [self.view viewWithTag:1000];
//    if (hud) {
//        hud.hidden = YES;
//    }
    UIView *view;
    if (self.view == nil)
        view = [[UIApplication sharedApplication].windows lastObject];
    else
        view = self.view;
    
    [MBProgressHUD hideHUDForView:view animated:YES];
}

@end
