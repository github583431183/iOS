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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
