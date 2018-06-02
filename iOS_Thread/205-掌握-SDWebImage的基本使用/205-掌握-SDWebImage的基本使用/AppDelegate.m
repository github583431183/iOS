//
//  AppDelegate.m
//  205-掌握-SDWebImage的基本使用
//
//  Created by 吴佳臻 on 2018/6/2.
//  Copyright © 2018年 wjz. All rights reserved.
//

#import "AppDelegate.h"
#import "SDWebImageManager.h"
@interface AppDelegate ()

@end

@implementation AppDelegate
-(void)applicationDidReceiveMemoryWarning:(UIApplication *)application
{
    //1.清空缓存
    //clear:直接删除缓存目录下面的文件,然后重新创建空的缓存文件
    [[SDWebImageManager sharedManager].imageCache cleanDisk];
    //clean:清除过期缓存,计算当前缓存的大小,和设置的最大缓存数量比较,如果超出那么会继续删除(按照文件了创建的先后顺序)
    [[SDWebImageManager sharedManager].imageCache cleanDisk];
    //过期时间:7天
    
    
    //2.取消当前所有的操作
    [[SDWebImageManager sharedManager] cancelAll];
    
    //3.最大并发数量 == 6
    //4.缓存文件的保存名称如何处理? 拿到图片的URL路径,对该路径进行MD5加密
    //5.该框架内部对内存警告的处理方式? 内部通过监听通知的方式请你缓存
    //6.该框架进行缓存处理的方式:可变字典--->NSCache
    //7.如何判断图片的类型: 在判断图片类型的时候，只匹配第一个字节
    //8.队列中任务的处理方式:FIFO
    //9.如何下载图片的? 发送网络请求下载图片,NSURLConnection
    //10.请求超时的时间 15秒
    
    //[NSData dataWithContentsOfURL:<#(nonnull NSURL *)#>]
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
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
