//
//  WJZEditViewController.m
//  01_通讯录_纯代码_框架搭建
//
//  Created by 吴佳臻 on 2018/5/14.
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
    // Do any additional setup after loading the view from its nib.
    self.nameTextF.text = self.contactItem.name;
    self.phoneTextF.text = self.contactItem.phone;
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"编辑" style:UIBarButtonItemStyleDone target:self action:@selector(editClick)];
}

-(void)editClick{
    if ([self.navigationItem.rightBarButtonItem.title isEqualToString:@"编辑"]) {
        self.phoneTextF.enabled = YES;
        self.nameTextF.enabled = YES;
        //电话文本框成为第一响应者
        [self.phoneTextF becomeFirstResponder];
        //保存按钮显示
        self.saveBtn.hidden = NO;
        //把编辑按钮的文字改为取消
        self.navigationItem.rightBarButtonItem.title = @"取消";
    }else{
        self.phoneTextF.enabled = NO;
        self.nameTextF.enabled = NO;
        //隐藏键盘
        [self.view endEditing:YES];
        self.saveBtn.hidden = YES;
        self.navigationItem.rightBarButtonItem.title = @"编辑";
        //恢复之前的数据
        self.nameTextF.text = self.contactItem.name;
        self.phoneTextF.text = self.contactItem.phone;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)saveBtnClick:(id)sender {
    
    //修改模型
    self.contactItem.name = self.nameTextF.text;
    self.contactItem.phone = self.phoneTextF.text;
    
    //通知上一个控制器刷新列表
    [[NSNotificationCenter defaultCenter] postNotificationName:@"reloadData" object:nil userInfo:nil];
    
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
