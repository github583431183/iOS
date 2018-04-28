//
//  WJZLoginViewController.m
//  02-通讯录(登录界面业务逻辑)
//
//  Created by 吴佳臻 on 2018/4/28.
//  Copyright © 2018年 wjz. All rights reserved.
//

#import "WJZLoginViewController.h"
#import "MBProgressHUD+XMG.h"
#import "WJZContactTableViewController.h"

@interface WJZLoginViewController ()

//<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *accountTextF;
@property (weak, nonatomic) IBOutlet UITextField *pwdTextF;
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;

@property (weak, nonatomic) IBOutlet UISwitch *autoLoginSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *remPwdSwitch;
@end

@implementation WJZLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSLog(@"%s",__func__);
    
    // 监听账号跟密码同时有值的时候，让登录按钮能够点击
    // UITextField代理无法实现业务需求
//    self.accountTextF.delegate = self;
//    self.pwdTextF.delegate = self;
    // 使用UIControll的事件监听
    [self.accountTextF addTarget:self action:@selector(textChange) forControlEvents:UIControlEventEditingChanged];
    [self.pwdTextF addTarget:self action:@selector(textChange) forControlEvents:UIControlEventEditingChanged];

}

/**
 当文本框内容发生改变时调用
 */
- (void)textChange{
    if(self.accountTextF.text.length && self.pwdTextF.text.length){
        // 让登录按钮能够点击
        self.loginBtn.enabled = YES;
    }else{
        self.loginBtn.enabled = NO;
    }
    
   // self.loginBtn.enabled = self.accountTextF.text.length && self.pwdTextF.text.length;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITextFieldDelegate
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    
    if (self.accountTextF.text.length && self.pwdTextF.text.length) {
        // 让登录按钮能够使用
        self.loginBtn.enabled = YES;
    }else{
        self.loginBtn.enabled = NO;
    }
    
    NSLog(@"%@",string);
    // 该属性要到第二次输入时才会返回上一次输入的值
    NSLog(@"---%@",self.pwdTextF.text);
    
    return YES;
}

/**
 自动登录开关发生改变
 */
- (IBAction)autoLoginChange:(UISwitch *)sender {
    if (self.autoLoginSwitch.isOn) {
        [self.remPwdSwitch setOn:YES animated:YES];
    }
}

/**
 记住密码开关发生改变
 */
- (IBAction)remPwdChange:(UISwitch *)sender {
    if (!self.remPwdSwitch.isOn) {
        [self.autoLoginSwitch setOn:NO animated:YES];
    }
}

- (IBAction)loginBtnClick:(UIButton *)sender {
    
    // 如果用户名跟密码正确，跳转到下一个界面
    // 提示用户正在登录
    [MBProgressHUD showMessage:@"正在登录..." toView:self.view];
    
    // 执行延时任务
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        if ([self.accountTextF.text isEqualToString:@"1"]
            &&
            [self.pwdTextF.text isEqualToString:@"1"]) {
            //隐藏HUD
            [MBProgressHUD hideHUDForView:self.view];
            //跳转到下一个界面
            // 手动去执行线(segue)
            [self performSegueWithIdentifier:@"contactVC" sender:nil];
        }else{
            //提醒用户
            NSLog(@"用户名或密码");
            [MBProgressHUD hideHUDForView:self.view];
            [MBProgressHUD showError:@"用户名或密码"];
        }
    });
}

// 准备跳转前调用
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    NSLog(@"%s",__func__);
    // 要跳转的目标控制器
    NSLog(@"%@",segue.destinationViewController);
    // 源控制器
    NSLog(@"%@",segue.sourceViewController);
    // 向目标控制器传值
    WJZContactTableViewController *contactVC = segue.destinationViewController;
    contactVC.accountName = self.accountTextF.text;
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
