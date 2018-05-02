//
//  WJZAddContactViewController.m
//  06-通讯录(添加界面)
//
//  Created by 吴佳臻 on 2018/5/2.
//  Copyright © 2018年 wjz. All rights reserved.
//

#import "WJZAddContactViewController.h"
#import "WJZContactItem.h"
#import "WJZContactTableViewController.h"
@interface WJZAddContactViewController ()
@property (weak, nonatomic) IBOutlet UITextField *nameTextF;
@property (weak, nonatomic) IBOutlet UITextField *phoneTextF;
@property (weak, nonatomic) IBOutlet UIButton *addBtn;

@end

@implementation WJZAddContactViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.nameTextF addTarget:self action:@selector(textChange) forControlEvents:UIControlEventEditingChanged];
    [self.phoneTextF addTarget:self action:@selector(textChange) forControlEvents:UIControlEventEditingChanged];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/**
 当文本框内容发生改变的时候调用
 */
- (void)textChange{
    self.addBtn.enabled = self.nameTextF.text.length && self.phoneTextF.text.length;
}

/**
 传递数据(顺传数据)
 1.数据接收的控制器定一个属性，来接收数据
 2.数据的来源控制器要拿到数据接收的控制器
 3.给接收控制器的接收数据的属性赋值
 */
- (IBAction)addBtnClick:(id)sender {
    
    // 把输入的姓名和电话，传递到上一个控制器（WJZContactTableViewController）
    // 把输入姓名和姓名封装一个模型
    WJZContactItem *item = [WJZContactItem itemWithName:self.nameTextF.text phone:self.phoneTextF.text];
    
    self.contactTableViewController.contactItem = item;
    
    [self.navigationController popViewControllerAnimated:YES];
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
