//
//  WJZAddContactViewController.m
//  06-通讯录(添加界面)
//
//  Created by 吴佳臻 on 2018/5/2.
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
 点击添加按钮
 */
- (IBAction)addBtnClick:(id)sender {
    
    // 把输入的姓名和电话，传递到上一个控制器（WJZContactTableViewController）
    WJZContactItem *contactItem = [WJZContactItem itemWithName:self.nameTextF.text phone:self.phoneTextF.text];
    
    // 判断代理有没有实现协议方法
    if([self.delegate respondsToSelector:@selector(addContactViewController:contactItem:)]){
        [self.delegate addContactViewController:self contactItem:contactItem];
    }
    
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
