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
@interface WJZTabBarViewController ()

@end

@implementation WJZTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //1.添加子控制器
    [self setupAllChildViewController];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    hall.view.backgroundColor = [UIColor yellowColor];
    [self setupOneChildViewController:hall image:[UIImage imageNamed:@"TabBar_Discovery_new"] selImage:[UIImage imageNamed:@"TabBar_Discovery_selected_new"]];
    
    // 2.竞技场
    WJZArenaViewController *arena = [[WJZArenaViewController alloc] init];
    arena.view.backgroundColor =[UIColor greenColor];
    
    [self setupOneChildViewController:arena image:[UIImage imageNamed:@"TabBar_Arena_new"] selImage:[UIImage imageNamed:@"TabBar_Arena_selected_new"]];
    
    // 3.发现
    WJZDiscoverTableViewController *discover = [[WJZDiscoverTableViewController alloc] init];
    discover.view.backgroundColor  = [UIColor orangeColor];
    
    [self setupOneChildViewController:discover image:[UIImage imageNamed:@"TabBar_Discovery_new"] selImage:[UIImage imageNamed:@"TabBar_Discovery_selected_new"]];
    
    // 4.开奖信息
    WJZHistoryTableViewController *history = [[WJZHistoryTableViewController alloc] init];
    history.view.backgroundColor = [UIColor blueColor];
    
    [self setupOneChildViewController:history image:[UIImage imageNamed:@"TabBar_History_new"] selImage:[UIImage imageNamed:@"TabBar_History_selected_new"]];
    
    // 5.我的彩票
    WJZMyLotteryViewController *myLottery = [[WJZMyLotteryViewController alloc] init];
    myLottery.view.backgroundColor = [UIColor purpleColor];
    
    [self setupOneChildViewController:myLottery image:[UIImage imageNamed:@"TabBar_MyLottery_new"] selImage:[UIImage imageNamed:@"TabBar_MyLottery_selected_new"]];
}

/**
 添加一个子控制器
 */
-(void)setupOneChildViewController:(UIViewController *)vc image:(UIImage *)image selImage:(UIImage *)selImage{
    [self addChildViewController:vc];
    vc.tabBarItem.image = image;
    vc.tabBarItem.selectedImage = selImage;
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
