//
//  WJZLoginViewController.m
//  02-通讯录(登录界面业务逻辑)
//
//  Created by 吴佳臻 on 2018/4/28.
//  Copyright © 2018年 wjz. All rights reserved.
//

#import "WJZLoginViewController.h"

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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
