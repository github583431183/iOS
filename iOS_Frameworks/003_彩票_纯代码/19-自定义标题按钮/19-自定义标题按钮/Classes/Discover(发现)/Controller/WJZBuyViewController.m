//
//  WJZBuyViewController.m
//  19-自定义标题按钮
//
//  Created by 吴佳臻 on 2018/5/18.
//  Copyright © 2018年 wjz. All rights reserved.
//

#import "WJZBuyViewController.h"
#import "WJZTitleViewButton.h"
@interface WJZBuyViewController ()

@end

@implementation WJZBuyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //1.设置titleView
    UIButton *button = [[WJZTitleViewButton alloc] init];
    [button setImage:[UIImage imageNamed:@"YellowDownArrow"] forState:UIControlStateNormal];
    [button setTitle:@"全部采种" forState:UIControlStateNormal];
    
    [button sizeToFit];
    
    self.navigationItem.titleView = button;
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
