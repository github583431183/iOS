//
//  ViewController.m
//  _01_示例程序_切换颜色
//
//  Created by 吴佳臻 on 2018/1/10.
//  Copyright © 2018年 wjz. All rights reserved.
//

/*
 
 注意事项：
    判断一个对象是否能连线：
        看该对象的类是否继承与 UIControl
 经典错误
    1. 错误一
        描述：
         reason: '[<MainViewController 0x7ffebbc1a880> setValue:forUndefinedKey:]: this class is not key value coding-compliant for the key testLabel.'
         原因: 有多余的连线
         解决: 删除多余的连线
 
    2. 错误二
        描述：
         reason: '-[MainViewController clickBtn:]: unrecognized selector sent to instance 0x7feb69418640'
         原因:找不到对应的方法
         解决:1.添加对应的方法  2.删除多余的连线
 
*/

#import "ViewController.h"

@interface ViewController ()

// 属性使用 weak ：  \
    由于该控件在 Main.storyboard 中已经被强指针引用，此处不需要再使用强指针
@property (weak, nonatomic) IBOutlet UILabel *label;

// 红色按钮
@property (weak, nonatomic) IBOutlet UIButton *redButton;

@end

@implementation ViewController

#pragma mark - 点击红色按钮
- (IBAction)clickRedButton {
    // 1. 改变文字颜色
    self.label.textColor = [UIColor redColor];
    // 2. 改变文本内容
    self.label.text = @"我是一段红色的文字";
    // 3. 改变背景颜色
    self.label.backgroundColor = [UIColor greenColor];
    // 4. 文字居中
    self.label.textAlignment = NSTextAlignmentCenter;
    // 5. 改变文字大小
    self.label.font = [UIFont systemFontOfSize:20.f];
    // 6. 改变按钮的背景颜色(改变全局红色按钮属性)
    self.redButton.backgroundColor = [UIColor greenColor];
}

#pragma mark - 点击绿色按钮
- (IBAction)clickGreenButton:(UIButton *)sender {
    // 1. 改变文字颜色
    self.label.textColor = [UIColor greenColor];
    // 2. 改变文本内容
    self.label.text = @"绿色的文字是我";
    // 3. 改变背景颜色
    self.label.backgroundColor = [UIColor redColor];
    // 4. 文字居中
    self.label.textAlignment = NSTextAlignmentCenter;
    // 5. 改变文字大小
    self.label.font = [UIFont systemFontOfSize:18.f];
    // 6. 改变点击按钮的背景颜色
    sender.backgroundColor = [UIColor redColor];
}

#pragma mark - 点击蓝色按钮
- (IBAction)clickBuleButton:(UIButton *)sender {
    // 1. 改变文字颜色
    self.label.textColor = [UIColor blueColor];
    // 2. 改变文本内容
    self.label.text = @"绿色的文字是我";
    // 3. 改变背景颜色
    self.label.backgroundColor = [UIColor greenColor];
    // 4. 文字居中
    self.label.textAlignment = NSTextAlignmentCenter;
    // 5. 改变文字大小
    self.label.font = [UIFont systemFontOfSize:18.f];
    // 6. 改变点击按钮的背景颜色
    sender.backgroundColor = [UIColor blueColor];
}



@end
