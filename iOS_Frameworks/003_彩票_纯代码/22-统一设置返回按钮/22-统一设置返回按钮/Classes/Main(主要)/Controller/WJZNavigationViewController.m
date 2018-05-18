//
//  WJZNavigationViewController.m
//  08-自定义导航控制器
//
//  Created by 吴佳臻 on 2018/5/16.
//  Copyright © 2018年 wjz. All rights reserved.
//

#import "WJZNavigationViewController.h"

@interface WJZNavigationViewController ()

@end

@implementation WJZNavigationViewController

/*
 1.什么时候调用:当程序一启动的时候就会调用
 2.作用:将当前类加载进内存，放在代码区
 */
+(void)load{
    NSLog(@"%s",__func__);
}

/*
 1.什么时候调用:当第一次初始化这个类的时候调用
 2.作用:初始化这个类
 */
+ (void)initialize{
    NSLog(@"%s",__func__);
    
    //1.获取导航条标识
    //获取APP的导航条标识
    //appearance是一个协议，只要遵守了这个协议都有这个方法
    //如果这样写会有bug
//    UINavigationBar *bar = [UINavigationBar appearance];
    //Class获取某几个类的导航条标识
    UINavigationBar *bar = [UINavigationBar appearanceWhenContainedIn:self, nil];
    [bar setBackgroundImage:[UIImage imageNamed:@"NavBar64"] forBarMetrics:UIBarMetricsDefault];
    //设置字体颜色大小
    NSMutableDictionary *dictM = [NSMutableDictionary dictionary];
    //字体大小
    dictM[NSFontAttributeName] = [UIFont boldSystemFontOfSize:22];
    // 字体颜色
    dictM[NSForegroundColorAttributeName] = [UIColor whiteColor];
    
    [bar setTitleTextAttributes:dictM];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //每创建一个对象，就会调用一次
    NSLog(@"%s, line = %d", __FUNCTION__, __LINE__);
    
    //1.获取导航条标识
    //获取APP的导航条标识
    //appearance是一个协议,只要遵守了这个协议都有这个方法
    //如果这样写有重大bug
    //UINavigationBar *bar = [UINavigationBar appearance];
    
    //UIButton
//    [UIButton appearance];
    //UILabel
//    [UILabel appearance];
    
//    // Class 获取某个类的导航条标识
//    UINavigationBar *bar = [UINavigationBar appearanceWhenContainedIn:[WJZNavigationViewController  class], nil];
//
//    //[UINavigationBar appearanceWhenContainedInInstancesOfClasses:<#(nonnull NSArray<Class<UIAppearanceContainer>> *)#>]
//
//    [bar setBackgroundImage:[UIImage imageNamed:@"NavBar64"] forBarMetrics:UIBarMetricsDefault];
//
//    // 设置字体颜色大小
//    NSMutableDictionary *dictM = [NSMutableDictionary dictionary];
//
//    //字体大小
//    dictM[NSFontAttributeName] = [UIFont boldSystemFontOfSize:22];
//    // 字体颜色
//    dictM[NSForegroundColorAttributeName] = [UIColor whiteColor];
//
//    [bar setTitleTextAttributes:dictM];
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    [super pushViewController:viewController animated:animated];
    //当非根控制器设置导航条左侧返回按钮
    //    self.viewControllers
    //    self.childViewControllers
    NSLog(@"---->%ld",self.viewControllers.count);
    // self.viewControllers.count == 1 根控制器
    if (self.viewControllers.count > 1) {
        //非根控制器
        //设置导航条左侧返回按钮
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageWithRenderOriginalName:@"NavBack"] style:UIBarButtonItemStylePlain target:self action:@selector(back)];
    }
}

-(void)back{
    [self popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
