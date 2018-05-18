//
//  WJZArenaViewController.m
//  03_彩票_自定义tabBar_1
//
//  Created by 吴佳臻 on 2018/5/14.
//  Copyright © 2018年 wjz. All rights reserved.
//

#import "WJZArenaViewController.h"
#import "UIView+Frame.h"
@interface WJZArenaViewController ()

@end

@implementation WJZArenaViewController

/**
 当第一次加载view的时候调用
 如果自定义view，重写这个方法
 */
-(void)loadView{
    NSLog(@"%s, line = %d", __FUNCTION__, __LINE__);
    //在这个方法里面不能调用self.view.bounds，如果掉用会造成死循环
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    //死循环
    //[self.view addSubview:imageView];
    
    self.view = imageView;
    
    //设置背景图片
    imageView.image = [UIImage imageNamed:@"NLArenaBackground"];
    
    //设置允许与用户交互
    imageView.userInteractionEnabled = YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //1.设置titleView
    UISegmentedControl *segmentControl = [[UISegmentedControl alloc] initWithItems:@[@"足球",@"篮球"]];
    //2.设置背景图片
    //普通状态
    [segmentControl setBackgroundImage:[UIImage imageNamed:@"CPArenaSegmentBG"] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    //选中状态
    [segmentControl setBackgroundImage:[UIImage imageNamed:@"CPArenaSegmentSelectedBG"] forState:UIControlStateSelected barMetrics:UIBarMetricsDefault];
    //3.设置字体颜色
    [segmentControl setTitleTextAttributes:@{
                                             NSForegroundColorAttributeName:[UIColor whiteColor]
                                             } forState:UIControlStateNormal];
    //4.设置选中的索引
    segmentControl.selectedSegmentIndex = 0;
    //5.设置前景色
    segmentControl.tintColor = [UIColor colorWithRed:0 green:142/255.0 blue:143/255.0 alpha:1];
    self.navigationItem.titleView = segmentControl;
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
