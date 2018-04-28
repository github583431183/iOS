//
//  ViewController.m
//  _01_加法计算器
//
//  Created by 吴佳臻 on 2018/1/11.
//  Copyright © 2018年 wjz. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *num1TextField;
@property (weak, nonatomic) IBOutlet UITextField *num2TextField;
@property (weak, nonatomic) IBOutlet UILabel *resultLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
/**
 加法
 */
- (IBAction)sum:(id)sender {
    
    //1.拿到两个字符串
    NSString *sum1String = self.num1TextField.text;
    NSString *sum2String = self.num2TextField.text;
    
    //1.1判断
    if (sum1String.length == 0) {
        [self showAlertInfo:@"请输入第一个数"];
        return;
    }
    
    if(sum2String.length == 0){
        [self showAlertInfo:@"请输入第二个数"];
        return;
    }
    
    //2. 把字符串转成数值
    NSInteger sum1 = [sum1String integerValue];
    NSInteger sum2 = [sum2String integerValue];
    
    //3. 相加
    NSInteger result = sum1 + sum2;
    
    //4. 显示结果
    self.resultLabel.text = [NSString stringWithFormat:@"%zd",result];
    
}

-(void)showAlertInfo:(NSString *)info{
    // 创建对话框
    UIAlertView *alertView = [[UIAlertView alloc]
                              initWithTitle:@"输入有误" message:info
                              delegate:nil cancelButtonTitle:@"我知道了" otherButtonTitles:nil, nil];
    // 显示对话框
    [alertView show];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
