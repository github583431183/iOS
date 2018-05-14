//
//  WJZLoginViewController.m
//  01_通讯录_纯代码_框架搭建
//
//  Created by 吴佳臻 on 2018/5/14.
//  Copyright © 2018年 wjz. All rights reserved.
//

#import "WJZLoginViewController.h"
#import "MBProgressHUD+XMG.h"
#import "WJZContactTableViewController.h"
@interface WJZLoginViewController ()
@property (weak, nonatomic) IBOutlet UITextField *accountTextF;
@property (weak, nonatomic) IBOutlet UITextField *pwdTextF;
@property (strong, nonatomic) IBOutlet UIButton *loginBtn;

@end

@implementation WJZLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.navigationItem.title = @"欢迎进入通讯录";
    
    [self.accountTextF addTarget:self action:@selector(textChange) forControlEvents:UIControlEventEditingChanged];
    [self.pwdTextF addTarget:self action:@selector(textChange) forControlEvents:UIControlEventEditingChanged];

    //手动判断账号跟密码是否有值
}

/**
 当文本框内容发生改变时调用
 */
-(void)textChange{
    NSLog(@"%s",__func__);
    self.loginBtn.enabled = self.accountTextF.text.length && self.pwdTextF.text.length;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)login:(UIButton *)sender {
    
    //如果用户名跟密码正确，跳转到下一个界面
    //提醒用户正在登录
    [MBProgressHUD showMessage:@"正在登录..." toView:self.view];
    
    //延时执行任务
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        if ([self.accountTextF.text isEqualToString:@"123"] && [self.pwdTextF.text isEqualToString:@"123"]) {
            //隐藏HUD
            [MBProgressHUD hideHUDForView:self.view];
            
            WJZContactTableViewController *contactTableViewController = [[WJZContactTableViewController alloc] init];
            contactTableViewController.name = self.accountTextF.text;
            [self.navigationController pushViewController:contactTableViewController animated:YES];
        }else{
            
            //提醒用户
            [MBProgressHUD hideHUDForView:self.view];
            [MBProgressHUD showError:@"用户名或密码"];
            
        }
        
    });
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
