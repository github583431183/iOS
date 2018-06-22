//
//  ViewController.m
//  307-掌握-登录案例
//
//  Created by 吴佳臻 on 2018/6/20.
//  Copyright © 2018年 wjz. All rights reserved.
//

#import "ViewController.h"
#import "SVProgressHUD.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *usernameTF;
@property (weak, nonatomic) IBOutlet UITextField *pwdTF;

@end

@implementation ViewController
- (IBAction)loginBtnClick:(id)sender {
    //添加灰色的背景遮罩
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeBlack];
    //0.拿到用户输入
    NSString *usernameStr = self.usernameTF.text;
    NSString *pwdStr = self.pwdTF.text;
    //输入校验(用户名和密码不能为空)
    if (usernameStr.length == 0) {
        [SVProgressHUD showErrorWithStatus:self.usernameTF.placeholder];
        return;
    }
    if (pwdStr.length == 0) {
        [SVProgressHUD showErrorWithStatus:self.pwdTF.placeholder];
        return;
    }
    //1.确定url
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://120.25.226.186:32812/login?username=%@&pwd=%@&type=JSON",usernameStr,pwdStr]];
    
    //2.创建请求对象(GET)
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    //3.发送请求
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
        
        if (connectionError) {
            NSLog(@"请求失败");
            return ;
        }
        
        //4.解析数据
        NSString *result = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
        
        NSLog(@"%@",result);
        
        //5.截取字符串
        NSUInteger loc = [result rangeOfString:@":\""].location + 2;
        NSUInteger len =  [result rangeOfString:@"\"}"].location - loc;
        
        NSString *msg = [result substringWithRange:NSMakeRange(loc, len)];
        
        //延迟执行，弹框提示用户登录请求结果
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            
            //containsString 方法用于检查字符串包含
            if ([result containsString:@"error"]) {
                [SVProgressHUD showErrorWithStatus:msg];
            }else
            {
                [SVProgressHUD showSuccessWithStatus:msg];
            }
        });
        
    }];
}


@end
