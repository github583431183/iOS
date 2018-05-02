//
//  WJZEditViewController.m
//  10-通讯录(编辑界面搭建)
//
//  Created by 吴佳臻 on 2018/5/2.
//  Copyright © 2018年 wjz. All rights reserved.
//

#import "WJZEditViewController.h"

#import "WJZContactItem.h"

@interface WJZEditViewController ()
@property (weak, nonatomic) IBOutlet UITextField *nameTextF;
@property (weak, nonatomic) IBOutlet UITextField *phoneTextF;
@property (weak, nonatomic) IBOutlet UIButton *saveBtn;

@end

@implementation WJZEditViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.nameTextF.text = self.contactItem.name;
    self.phoneTextF.text = self.contactItem.phone;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)editBtn:(UIBarButtonItem *)sender {
    if ([sender.title isEqualToString:@"编辑"]) {
        self.phoneTextF.enabled = YES;
        self.nameTextF.enabled = YES;
        
        //电话文本框成为第一响应者
        //弹出键盘
        [self.nameTextF becomeFirstResponder];
        self.saveBtn.hidden = NO;
        sender.title = @"取消";
    }else{
        self.phoneTextF.enabled = NO;
        self.nameTextF.enabled = NO;
        //隐藏键盘
        [self.view endEditing:YES];
        sender.title = @"编辑";
        self.nameTextF.text = self.contactItem.name;
        self.phoneTextF.text = self.contactItem.phone;
    }
}
- (IBAction)saveBtn:(id)sender {
    self.contactItem.name = self.nameTextF.text;
    self.contactItem.phone = self.phoneTextF.text;
    //通知上一个控制器刷新列表
    [[NSNotificationCenter defaultCenter]postNotificationName:@"reloadData" object:nil userInfo:nil];
    //返回上一级
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
