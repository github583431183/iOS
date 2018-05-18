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
@property (nonatomic, weak) UIButton *button;
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
    
    self.button = button;
    
    self.navigationItem.titleView = button;

    // 2.设置左侧返回按钮
    
//    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageWithRenderOriginalName:@"NavBack"] style:0 target:self action:@selector(back)];
//    self.navigationController pushViewController:<#(nonnull UIViewController *)#> animated:<#(BOOL)#>
}
//- (void)back{
//    [self.navigationController popViewControllerAnimated:YES];
//}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//        [self.button setTitle:@"全部采种全部采种全部采种" forState:UIControlStateNormal];
//        [self.button sizeToFit];
//
    [self.button setImage:nil forState:UIControlStateNormal];
    
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
