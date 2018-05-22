//
//  WJZRootVC.m
//  34-业务逻辑类
//
//  Created by 吴佳臻 on 2018/5/22.
//  Copyright © 2018年 wjz. All rights reserved.
//

#define WJZVersion @"version"

#import "WJZRootVC.h"
#import "WJZTabBarViewController.h"
#import "WJZNewFeatureCollectionViewController.h"
#import "WJZSaveTool.h"

@implementation WJZRootVC
+(UIViewController *)chooseWindowRootVC{
    //增加新特性业务逻辑
    //当前版本更新，或者第一次安装的时候显示新特性界面
    //1.获取当前版本好
    NSString *currVersion = [NSBundle mainBundle].infoDictionary[@"CFBundleShortVersionString"];
    NSLog(@"%@",currVersion);
    //2.上一次版本好
    NSString *lastVersion = [WJZSaveTool objectForKey:WJZVersion];
    
    UIViewController *rootVc;
    if (![currVersion isEqualToString:lastVersion]) {
        //进入新特性界面
        rootVc = [[WJZNewFeatureCollectionViewController alloc] init];
        //rootVc.view.backgroundColor = [UIColor yellowColor];
        //存储当前版本号
        //[[NSUserDefaults standardUserDefaults] setObject:currVersion forKey:@"version"];
        //[[NSUserDefaults standardUserDefaults] synchronize];
        [WJZSaveTool setObject:currVersion forKey:WJZVersion];
    }else{
        //进入主框架
        rootVc = [[WJZTabBarViewController alloc] init];
    }
    return rootVc;
}
@end
