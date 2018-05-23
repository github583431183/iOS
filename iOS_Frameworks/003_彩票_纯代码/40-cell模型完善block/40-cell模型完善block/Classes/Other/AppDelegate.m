//
//  AppDelegate.m
//  01_彩票_基本搭建
//
//  Created by 吴佳臻 on 2018/5/14.
//  Copyright © 2018年 wjz. All rights reserved.
//

#import "AppDelegate.h"
#import "WJZRootVC.h"
@interface AppDelegate ()

@end

@implementation AppDelegate

// LaunchScreen > LaunchImage

/**
新项目
 1.确认主框架
 2.确认开发方式
 3.工程的配置(部署)
 
 4.文件框架结构(MVC)
    1.让更多的功能复用
    2.方便多人开发
    3.当程序出现bug(需求)快速定位
 
 5.谁的事情谁管理(自己的事情自己做)
 
 6.自定义
    1.自定义控制器:一般都需要自定义(处理复杂的业务逻辑)
    2.自定义控件:当系统的需求不能满足的时候，一定要先还原系统原有方法，在增加自己的方法
        button 文字在左边，图片在右边  模型  view
 */
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    //1.创建窗口
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
//
//    //2.创建窗口的跟控制器
//    //2.1创建窗口跟控制器
//    UITabBarController *tabBarVc = [[WJZTabBarViewController alloc] init];
//    self.window.rootViewController = tabBarVc;
//
//    //2.2添加自控制器
////    UIViewController *vc = [[UIViewController alloc] init];
////    [tabBarVc addChildViewController:vc];
////    vc.view.backgroundColor = [UIColor yellowColor];
////
////    UIViewController *vc1 = [[UIViewController alloc] init];
////    [tabBarVc addChildViewController:vc1];
////    vc1.view.backgroundColor = [UIColor greenColor];

    //增加新特性业务逻辑
    //当前版本更新，或者第一次安装的时候显示新特性界面
    //1.获取当前版本好
//    NSString *currVersion = [NSBundle mainBundle].infoDictionary[@"CFBundleShortVersionString"];
//    NSLog(@"%@",currVersion);
//    //2.上一次版本好
//    NSString *lastVersion = [[NSUserDefaults standardUserDefaults] objectForKey:@"version"];
//
//    UIViewController *rootVc;
//    if ([currVersion isEqualToString:lastVersion]) {
//        //进入新特性界面
//        rootVc = [[WJZNewFeatureCollectionViewController alloc] init];
//        rootVc.view.backgroundColor = [UIColor yellowColor];
//        //存储当前版本号
//        [[NSUserDefaults standardUserDefaults] setObject:currVersion forKey:@"version"];
//        [[NSUserDefaults standardUserDefaults] synchronize];
//    }else{
//        //进入主框架
//        rootVc = [[WJZTabBarViewController alloc] init];
//    }
    
    //设置窗口根控制器
    self.window.rootViewController = [WJZRootVC chooseWindowRootVC];
    
    //3.让窗口显示
    [self.window makeKeyAndVisible];
    
    //打印主窗口大小
    NSLog(@"%@",NSStringFromCGRect([UIScreen mainScreen].bounds));
    return YES;
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
