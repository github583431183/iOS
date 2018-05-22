//
//  WJZNavigationViewController.m
//  08-自定义导航控制器
//
//  Created by 吴佳臻 on 2018/5/16.
//  Copyright © 2018年 wjz. All rights reserved.
//

#import "WJZNavigationViewController.h"
#import <objc/runtime.h>

@interface WJZNavigationViewController () <UINavigationControllerDelegate,UIGestureRecognizerDelegate>
//系统手势代理
@property(nonatomic,strong)id popGesture;
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
 1.什么时候调用:当第一次初始化这个类的时候调用,如果当这个类有子类会调用多次
 2.作用:初始化这个类
 */
+ (void)initialize{
    NSLog(@"%s",__func__);

    if (self == [WJZNavigationViewController class]) {
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
        
        //设置导航条前景色
        [bar setTintColor:[UIColor whiteColor]];
        
        //去掉导航条返回键的文字
        //获取导航条按钮的标识
        UIBarButtonItem *item = [UIBarButtonItem appearanceWhenContainedIn:self, nil];
        //修改返回按钮标题的位置,左移100px
        [item setBackButtonTitlePositionAdjustment:UIOffsetMake(-100, 0) forBarMetrics:UIBarMetricsDefault];
    }
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
    
    
//    //想统一设置返回按钮，滑动移除控制器
//
//    //清空手势代理就能实现滑动返回，iOS6 不支持   \
//    但是有bug，清空后，如果根控制器是NavController时，再滑动会死循环
////    self.interactivePopGestureRecognizer.delegate = nil;
//    //记录系统的手势代理
//    self.popGesture = self.interactivePopGestureRecognizer.delegate;
//    //当时根控制器时还原代理，如果非根控制器，清空代理
//    self.delegate = self;
    
    
    //全屏滑动移除控制器
    //1.先修改系统的手势，系统没有给我们提供属性
    /*
     interactivePopGestureRecognizer-><UIScreenEdgePanGestureRecognizer: 0x7fd54b310740; state = Possible; delaysTouchesBegan = YES; view = <UILayoutContainerView 0x7fd54b30b9b0>; target= <(action=handleNavigationTransition:, target=<_UINavigationInteractiveTransition 0x7fd54b310600>)>>
     */
    //NSLog(@"interactivePopGestureRecognizer->%@",self.interactivePopGestureRecognizer);
    UIScreenEdgePanGestureRecognizer *gest = self.interactivePopGestureRecognizer;
    //2.自己添加手势
    
//    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handleNavigationTransition:)];
//    [self.view addGestureRecognizer:pan];
    
    //缺少Target 系统的私有属性
    //KVC [gest valueForKeyPath:@""];
    //不知道 Target 真实类型
    //oc runtime 机制 只能动态获取当前类的成员属性，不能获取其子类或者父类的属性   \
        __unsafe_unretained Class 要获取哪个类的成员属性
    //导包 #import <objc/runtime.h>
    //unsigned int outCount 获取Class 下面的所有成员属性的个数

//    unsigned int outCount = 0;
//    Ivar *ivars = class_copyIvarList([UIGestureRecognizer class], &outCount);
//    for (int i = 0; i < outCount; i++) {
//        //ivars[i];
//        //获取成员属性的名字
//        NSString *name = @(ivar_getName(ivars[i]));
//        NSLog(@"ivar_getName->%@",name);
//        /*
//         2018-05-22 11:23:29.908658+0800 25-滑动移除控制器全屏实现[1721:41310] ivar_getName->_gestureFlags
//         2018-05-22 11:23:29.908759+0800 25-滑动移除控制器全屏实现[1721:41310] ivar_getName->_targets
//         2018-05-22 11:23:29.908868+0800 25-滑动移除控制器全屏实现[1721:41310] ivar_getName->_delayedTouches
//         2018-05-22 11:23:29.908966+0800 25-滑动移除控制器全屏实现[1721:41310] ivar_getName->_delayedPresses
//         2018-05-22 11:23:29.909084+0800 25-滑动移除控制器全屏实现[1721:41310] ivar_getName->_view
//         2018-05-22 11:23:29.909204+0800 25-滑动移除控制器全屏实现[1721:41310] ivar_getName->_lastTouchTimestamp
//         2018-05-22 11:23:29.909340+0800 25-滑动移除控制器全屏实现[1721:41310] ivar_getName->_firstEventTimestamp
//         */
//    }
    
    //获取target
//    NSArray *targets = [gest valueForKey:@"_targets"];
//    NSLog(@"targets[0]->%@",targets[0]);
//    /*
//     2018-05-22 11:26:21.329366+0800 25-滑动移除控制器全屏实现[1763:42877] targets[0]->(action=handleNavigationTransition:, target=<_UINavigationInteractiveTransition 0x7fdff2d0f4e0>)
//     */
//    id target = [targets[0] valueForKeyPath:@"_target"];
    
    //target 的简单实现，使用代理对象与类对象为统一对象
    id target = self.interactivePopGestureRecognizer.delegate;
    //2.添加自己的手势
    //禁止系统的手势
    self.interactivePopGestureRecognizer.enabled = NO;
    
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:target action:@selector(handleNavigationTransition:)];
    [self.view addGestureRecognizer:pan];
    //处理根控制滑动导致卡屏现象
    pan.delegate = self;
}

#pragma mard - UIGestureRecognizerDelegate
-(BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer{
    //当开始滑动时就会调用，如果返回YES，可以活动，返回NO，禁止手势
    return self.viewControllers.count > 1;
}

#pragma mark - UINavigationControllerDelegate
//当控制器显示完毕的时候调用
//-(void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated{
//    NSLog(@"didShowViewController - %@",viewController);
//
//    NSLog(@"didShowViewController - %@",self.viewControllers[0]);
//
//    // self.viewControllers 任务栈
//    if (self.viewControllers[0] == viewController) {
//        //根控制器
//        //还原代理
//        self.interactivePopGestureRecognizer.delegate = self.popGesture;
//    }else{
//        //非根控制器
//        //清空代理
//        self.interactivePopGestureRecognizer.delegate = nil;
//    }
//}

//pop的时候没有把控制器传入
//-(UIViewController *)popViewControllerAnimated:(BOOL)animated

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    [super pushViewController:viewController animated:animated];
//    //当非根控制器设置导航条左侧返回按钮
//    //    self.viewControllers
//    //    self.childViewControllers
//    NSLog(@"---->%ld",self.viewControllers.count);
//    // self.viewControllers.count == 1 根控制器
//    if (self.viewControllers.count > 1) {
//        //非根控制器
//        //设置导航条左侧返回按钮
//        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageWithRenderOriginalName:@"NavBack"] style:UIBarButtonItemStylePlain target:self action:@selector(back)];
//    }
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
