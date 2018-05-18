//
//  WJZTabBarViewController.m
//  03_彩票_自定义tabBar_1
//
//  Created by 吴佳臻 on 2018/5/14.
//  Copyright © 2018年 wjz. All rights reserved.
//

#import "WJZTabBarViewController.h"
#import "WJZHallTableViewController.h"
#import "WJZArenaViewController.h"
#import "WJZDiscoverTableViewController.h"
#import "WJZHistoryTableViewController.h"
#import "WJZMyLotteryViewController.h"
#import "WJZTabBar.h"
#import "WJZNavigationViewController.h"
#import "WJZArenaNavViewController.h"
@interface WJZTabBarViewController () <WJZTabBarDelegate>
/** taBBar item 模型数组 */
@property (nonatomic, strong) NSMutableArray *items;
@end

@implementation WJZTabBarViewController
- (NSMutableArray *)items{
    if (!_items) {
        _items = [NSMutableArray array];
    }
    return _items;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //1.添加子控制器
    [self setupAllChildViewController];
    
    // 2.自定义tabBar
    [self setupTabBar];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// 自定义tabBar
- (void)setupTabBar{
    /*
     // 1.移除(简单粗暴)
     1.tabBar UIView
     2.UIButton
     3.切换自控制 selectedIndex
     */
    // 1.移除系统的tabBar
    //[self.tabBar removeFromSuperview];
    //iOS11上只能隐藏，不能删除。因为控件内部在下一次layout时会自动把删除的元素加上去
    [self.tabBar setHidden:YES];
    
    // 2.添加自己的tabBar
    WJZTabBar *tabBar = [[WJZTabBar alloc] init];
    //    tabBar.count = self.childViewControllers.count;
    tabBar.items = self.items;
    
    [self.view addSubview:tabBar];
    tabBar.frame = self.tabBar.frame;
    tabBar.backgroundColor = [UIColor redColor];
    //设置代理
    tabBar.delegate = self;
    
    // 1.子控制器的个数
    // 2.UIButton 内容
    
    //    NSLog(@"%@",NSStringFromCGSize(self.tabBar.frame.));
    //    NSLog(@"%@",NSStringFromCGRect(self.tabBar.frame));
    
    
}

#pragma mark - WJZTabBarDelegate
-(void)tabBar:(WJZTabBar *)tabBar index:(NSInteger)index{
    //切换子控制器
    self.selectedIndex = index;
}

/**
 添加所有自控制器
 */
-(void)setupAllChildViewController{
    
    //图片的高度大于tabBar的高度，解决方案 \
        1.找UI调整图片，项目负责，pm   \
        2.自定义   \
            1.tabBar UIView     \
            2.UIButton  \
            3.切换控制器 selectedIndex   \
            4.移除tabBar子控件
    
    //tabBarItem模型,对应子控制器的tabBarItem 决定
    //1.购彩大厅
    WJZHallTableViewController *hall = [[WJZHallTableViewController alloc] init];
    //hall.view.backgroundColor = [UIColor yellowColor];
    [self setupOneChildViewController:hall image:[UIImage imageNamed:@"TabBar_Discovery_new"] selImage:[UIImage imageNamed:@"TabBar_Discovery_selected_new"] title:@"购彩大厅"];
    
    // 2.竞技场
    WJZArenaViewController *arena = [[WJZArenaViewController alloc] init];
    //arena.view.backgroundColor =[UIColor greenColor];
    
    [self setupOneChildViewController:arena image:[UIImage imageNamed:@"TabBar_Arena_new"] selImage:[UIImage imageNamed:@"TabBar_Arena_selected_new"] title:nil];
    
    // 3.发现
    WJZDiscoverTableViewController *discover = [[WJZDiscoverTableViewController alloc] init];
    //discover.view.backgroundColor  = [UIColor orangeColor];
    
    [self setupOneChildViewController:discover image:[UIImage imageNamed:@"TabBar_Discovery_new"] selImage:[UIImage imageNamed:@"TabBar_Discovery_selected_new"] title:@"发现"];
    
    // 4.开奖信息
    WJZHistoryTableViewController *history = [[WJZHistoryTableViewController alloc] init];
    //history.view.backgroundColor = [UIColor blueColor];
    
    [self setupOneChildViewController:history image:[UIImage imageNamed:@"TabBar_History_new"] selImage:[UIImage imageNamed:@"TabBar_History_selected_new"] title:@"开奖信息"];
    
    // 5.我的彩票
    WJZMyLotteryViewController *myLottery = [[WJZMyLotteryViewController alloc] init];
    //myLottery.view.backgroundColor = [UIColor purpleColor];
    
    [self setupOneChildViewController:myLottery image:[UIImage imageNamed:@"TabBar_MyLottery_new"] selImage:[UIImage imageNamed:@"TabBar_MyLottery_selected_new"] title:@"我的彩票"];
}

/**
 添加一个子控制器
 将各个子控制器包装成导航控制器
 */
-(void)setupOneChildViewController:(UIViewController *)vc image:(UIImage *)image selImage:(UIImage *)selImage title:(NSString *)title{
//    [self addChildViewController:vc];
//    vc.tabBarItem.image = image;
//    vc.tabBarItem.selectedImage = selImage;
//    [self.items addObject:vc.tabBarItem];
    
    //包装成导航控制器
    
//    //1.创建导航控制器
//    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
//    [self addChildViewController:nav];
//
//    //2.导航控制器上的内容有栈顶控制器navigationItem
//    vc.navigationItem.title = title;
//
//    //3.设置背景颜色
//    //3.1背景颜色被设置为底色，上层白色无法去掉
//    //    vc.navigationItem se
////        [nav.navigationBar setBackgroundColor:[UIColor redColor]];
//
//    //3.2设置背景图片
//    // UIBarMetricsDefault 设置 背景图片 值能用UIBarMetricsDefault 控制器viewController的尺寸 {{0, 64}, {375, 603}}
//    // UIBarMetricsCompact 控制器view的尺寸{{0, 0}, {375, 667}}
//    // UIBarMetricsDefaultPrompt
//    // 只要 给导航设置背景图片 只能 用默认模式,但是控制器的view的尺寸是从64 开始, \
//        高度 = 屏幕的高度 - 64
//    [nav.navigationBar setBackgroundImage:[UIImage imageNamed:@"NavBar64"] forBarMetrics:UIBarMetricsDefault];
//
//    //4.设置字体颜色大小
//    NSMutableDictionary *dictM = [NSMutableDictionary dictionary];
//    //设置字体大小
//    dictM[NSFontAttributeName] = [UIFont boldSystemFontOfSize:22];
//    //设置字体颜色
//    dictM[NSForegroundColorAttributeName] = [UIColor whiteColor];
//
//    [nav.navigationBar setTitleTextAttributes:dictM];
//
//    vc.tabBarItem.image = image;
//    vc.tabBarItem.selectedImage = selImage;
//    //    vc.tabBarItem.title =
//    [self.items addObject:vc.tabBarItem];

    UINavigationController *nav = [[WJZNavigationViewController alloc] initWithRootViewController:vc];
    
    if ([vc isKindOfClass:[WJZArenaViewController class]]) {
        //竞技场
        nav = [[WJZArenaNavViewController alloc] initWithRootViewController:vc];
    }
    [self addChildViewController:nav];
    
    //导航控制器上的内容有栈顶控制器navigationItem
    vc.navigationItem.title = title;
    
    vc.tabBarItem.image = image;
    vc.tabBarItem.selectedImage = selImage;
    //    vc.tabBarItem.title =
    [self.items addObject:vc.tabBarItem];

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
