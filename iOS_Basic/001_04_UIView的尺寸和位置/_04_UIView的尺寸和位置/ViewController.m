//
//  ViewController.m
//  _04_UIView的尺寸和位置
//
//  Created by 吴佳臻 on 2018/1/11.
//  Copyright © 2018年 wjz. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

// label
@property (weak, nonatomic) UILabel *label;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // 创建 UILabel 对象
    UILabel *label = [[UILabel alloc] init];
    
    // 创建 fram (位置和尺寸)
    label.frame = CGRectMake(100, 100, 100, 60);
    // 设置背景颜色
    label.backgroundColor = [UIColor yellowColor];
    
    // 添加到控制器 view 中
    [self.view addSubview:label];
    self.label = label;
}

- (IBAction)bounds:(id)sender {

    // 改变尺寸 iOS9 以后，中心点不变，向四周延伸
    // CGRectMake(w,x,y,z)
    self.label.bounds = CGRectMake(0, 0, 200, 120);
    
}
- (IBAction)center:(id)sender {
    // CGPointMake(x,y)
    self.label.center = CGPointMake(self.view.frame.size.width*.5, self.view.frame.size.height*.5);
}

- (IBAction)changeFrame:(id)sender {
    // 方式1
    //    self.label.frame = CGRectMake(200, 100, 100, 60);
    // 方式2
    self.label.frame = (CGRect){{100, 100}, {100, 100}};
    
    // 方式3
    // 结构体是值传递,不是地址传递
    //self.label.frame.size.width += 100;
    CGRect frame = self.label.frame;
    frame.origin.x -= 100; // 改变x值
    frame.origin.y += 100; // 改变y值
    frame.size.width += 50; // 改变宽度
    frame.size.height += 100; // 改变高度
    self.label.frame = frame;
}


@end
