//
//  WJZArenaNavViewController.m
//  17-竞技场
//
//  Created by 吴佳臻 on 2018/5/18.
//  Copyright © 2018年 wjz. All rights reserved.
//

#import "WJZArenaNavViewController.h"

@interface WJZArenaNavViewController ()

@end

@implementation WJZArenaNavViewController

+(void)initialize{
    //1.获取导航条标识
    UINavigationBar *bar = [UINavigationBar appearanceWhenContainedIn:self, nil];
    //2.设置导航条背景图片
    //2.1拉伸图片
    UIImage *image = [UIImage imageNamed:@"NLArenaNavBar64"];
    image = [image stretchableImageWithLeftCapWidth:image.size.width/5 topCapHeight:image.size.height/5];
    [bar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
