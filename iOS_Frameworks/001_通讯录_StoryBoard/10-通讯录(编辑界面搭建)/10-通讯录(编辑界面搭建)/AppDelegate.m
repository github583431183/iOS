//
//  AppDelegate.m
//  01-通讯录(界面搭建)
//
//  Created by 吴佳臻 on 2018/4/28.
//  Copyright © 2018年 wjz. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

// 1、应用程序启动，并进行初始化时候调用该方法：application:didFimnishLanuchingWithOptions:
- (BOOL)application:(UIApplication *)application
    didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    NSLog(@"%s",__func__);
    return YES;
}

// 3、应用从活动状态进入到非活动状态：applicationWillResignActive ：
- (void)applicationWillResignActive:(UIApplication *)application {
    NSLog(@"%s",__func__);
}

// 4、应用进入到后台时候调用的方法:applicationDidEnterBackground：
- (void)applicationDidEnterBackground:(UIApplication *)application {
    NSLog(@"%s",__func__);
}

// 5、应用进入到前台时候调用的方法:appplicationWillEnterForeground：
- (void)applicationWillEnterForeground:(UIApplication *)application {
    NSLog(@"%s",__func__);
}

// 2、应用进入前台并处于活动状态时候调用：applicationDidBecomeActive:
- (void)applicationDidBecomeActive:(UIApplication *)application {
    NSLog(@"%s",__func__);
}

// 6、applicationWillTeminate：应用被终止的状态:
- (void)applicationWillTerminate:(UIApplication *)application {
    NSLog(@"%s",__func__);
}


@end
