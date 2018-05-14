//
//  WJZAddContactViewController.m
//  01_通讯录_纯代码_框架搭建
//
//  Created by 吴佳臻 on 2018/5/14.
//  Copyright © 2018年 wjz. All rights reserved.
//

#import "WJZAddContactViewController.h"
#import "WJZContactItem.h"

@interface WJZAddContactViewController ()
@property (weak, nonatomic) IBOutlet UITextField *nameTextF;
@property (weak, nonatomic) IBOutlet UITextField *phoneTextF;
@property (weak, nonatomic) IBOutlet UIButton *addBtn;

@end

@implementation WJZAddContactViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self.nameTextF addTarget:self action:@selector(textChange) forControlEvents:UIControlEventEditingChanged];
    [self.phoneTextF addTarget:self action:@selector(textChange) forControlEvents:UIControlEventEditingChanged];
    
}

-(void)textChange{
    self.addBtn.enabled = self.nameTextF.text.length && self.phoneTextF.text.length;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)addBtnClick:(id)sender {
    //把输入的姓名和电话传递到上一个控制器
    //把输入的姓名和电话封装到一个模型
    WJZContactItem *contactItem = [WJZContactItem itemWithName:self.nameTextF.text phone:self.phoneTextF.text];
    
    //判断代理方法有没有实现
    if ([self.delegate respondsToSelector:@selector(addContactViewController:contactItem:)]) {
        [self.delegate addContactViewController:self contactItem:contactItem];
    }
    
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
