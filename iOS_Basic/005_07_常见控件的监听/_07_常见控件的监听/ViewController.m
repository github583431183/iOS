//
//  ViewController.m
//  _07_常见控件的监听
//
//  Created by 吴佳臻 on 2018/1/16.
//  Copyright © 2018年 wjz. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIScrollViewDelegate,UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *textFlied;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //1.UIButton
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    //2.UIScrollView
    UIScrollView *scrollView = nil;
    scrollView.delegate = self;
    
    //3.UISegmentedControl
    UISegmentedControl *s = [[UISegmentedControl alloc] initWithItems:@[@"123",@"234",@"456",@"567"]];
    s.selectedSegmentIndex = 0;
    [s addTarget:self action:@selector(sClick:) forControlEvents:UIControlEventValueChanged];
    s.center = CGPointMake(self.view.center.x, 200);
    [self.view addSubview:s];
    
    //4.UITextField
    self.textFlied.delegate = self;
//    [self.textFlied addTarget:self action:@selector(tfEditingDidBegin) forControlEvents:UIControlEventEditingDidBegin];
//    [self.textFlied addTarget:self action:@selector(tfEditingDidEnd) forControlEvents:UIControlEventEditingDidEnd];
//    [self.textFlied addTarget:self action:@selector(tfEditingChanged:) forControlEvents:UIControlEventValueChanged];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    // 退出键盘
    //    [self.textFlied endEditing:YES];
    // 辞去第一响应者(退出键盘)
    //    [self.textFlied resignFirstResponder];
    [self.view endEditing:YES];
}

#pragma mark - UITextFieldDelegate
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    NSLog(@"开始编辑");
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    NSLog(@"结束编辑");
}

/**
 *  当textField文字改变就会调用这个方法
 *  @param string    用户输入的文字
 *
 *  @return YES:允许用户输入;NO:禁止用户输入
 */
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    NSLog(@"shouldChangeCharactersInRange--%@",string);
    if ([string isEqualToString:@"1"]) {
        return NO;
    }
    return YES;
}

#pragma mark - textField监听方法
- (void)tfEditingDidBegin
{
    NSLog(@"开始编辑");
}

- (void)tfEditingDidEnd
{
    NSLog(@"结束编辑");
}

- (void)tfEditingChanged:(UITextField *)tf
{
    NSLog(@"%@",tf.text);
}

- (void)sClick:(UISegmentedControl *)s{
    NSLog(@"%ld",s.selectedSegmentIndex);
}

- (void)btnClick:(UIButton *)btn{
    
}

@end
