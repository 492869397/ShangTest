//
//  AppDelegate.m
//  ShangTest
//
//  Created by len on 16/8/9.
//  Copyright © 2016年 sxt. All rights reserved.
//

#import "AppDelegate.h"
#import "SelectViewController.h"
#import "ApplyViewController.h"


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [self initMagicRecord];
    
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    
    ApplyViewController *apply = [[ApplyViewController alloc]init];
    UIImage *image = [[UIImage imageNamed:@"shop_home_base11"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIImage *selectImage = [[UIImage imageNamed:@"shop_home_base12"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    apply.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"报名" image:image selectedImage:selectImage];
    
    
    SelectViewController *select = [[SelectViewController alloc]init];
    image = [[UIImage imageNamed:@"shop_home_base21"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    selectImage = [[UIImage imageNamed:@"shop_home_base22"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    select.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"答题" image:image selectedImage:selectImage];
    
    
    
    UITabBarController *tab = [[UITabBarController alloc]init];
    tab.tabBar.backgroundColor = [UIColor redColor];
    tab.viewControllers = @[apply,select];
    
    
    RootNavigationController *nav = [[RootNavigationController alloc]initWithRootViewController:tab];
    
    
    UINavigationBar * navBar =[UINavigationBar appearance] ;
    [navBar setBackgroundColor:[UIColor blueColor]];
    [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(0, -70) forBarMetrics:UIBarMetricsDefault];
    //将返回，左，右 item的字体颜色设置为白色
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
    
    
    _window.rootViewController = nav;
    
    [_window makeKeyAndVisible];
    
    return YES;
}

-(void)initMagicRecord
{
//    [MagicalRecord setupCoreDataStackWithStoreNamed:@"Model.sqlite"];
//    
//    //判断是否需要从网络获取数据
////    if () {
//    [self getModelDataFromNet];
////    }
}

-(void)getModelDataFromNet
{
    
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
