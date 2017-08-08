//
//  AppDelegate.m
//  ZXLottery
//
//  Created by zhixiongchen on 2017/8/5.
//  Copyright © 2017年 zhixiongchen. All rights reserved.
//

#import "AppDelegate.h"
#import "ZXTabBarController.h"
#import "ZXGuideViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
//    //判断沙盒中的版本号是不是和当前的版本号一致
//    if([[self loadSaveAppVersion]isEqualToString:[self loadAppVersion]])
//    {
//        //如果一致的话就去显示tabbarController
//        NSLog(@"1");
//    }
//    else
//    {
//        //如果不一致就去显示新特性的页面
//        NSLog(@"2");
//    }
    //创建UIWindow
    self.window=[[UIWindow alloc]initWithFrame:kScreenSize];
    //创建UITabbarController
    ZXTabBarController * tabbar=[[ZXTabBarController alloc]init];
    //设置UIWindow的跟视图控制器
    self.window.rootViewController=[self choiceViewController];
    //设置Window成为主窗口并显示
    [self.window makeKeyAndVisible];
    //把当前的版本号写到沙盒中
    [self saveAppVersion];
    return YES;
}
-(UIViewController *)choiceViewController
{
    //判断沙盒中的版本号是不是和当前的版本号一致
    if([[self loadSaveAppVersion]isEqualToString:[self loadAppVersion]])
    {
        //如果一致的话就去显示tabbarController
        return [[ZXTabBarController alloc]init];
    }
    else
    {
        //如果不一致就去显示新特性的页面
        
        return [[ZXGuideViewController alloc]init];
    }
   
}
//获取info.plist中的版本号
-(NSString *)loadAppVersion
{
    //获取info的字典
    NSDictionary * info=[NSBundle mainBundle].infoDictionary;
    //获取版本号
    NSString * str=info[@"CFBundleShortVersionString"];
    
    return str;
}
//获取沙盒中的版本号
-(NSString *)loadSaveAppVersion
{
    //获取单例
    NSUserDefaults * ud=[NSUserDefaults standardUserDefaults];
    //获取版本号
    NSString * str=[ud objectForKey:@"AppVersion"];
    
    return str;
}
-(void)saveAppVersion
{
    //获取info字典
    NSDictionary * info=[NSBundle mainBundle].infoDictionary;
    //获取当前程序的版本号
    NSString * str=info[@"CFBundleShortVersionString"];
    //获取单例
    NSUserDefaults * ud=[NSUserDefaults standardUserDefaults];
    //把数据保存到沙盒中
    [ud setObject:str forKey:@"AppVersion"];
}
- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
