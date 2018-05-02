//
//  ViewController.m
//  006_07_约束的优先级
//
//  Created by 吴佳臻 on 2018/3/5.
//  Copyright © 2018年 wjz. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *redView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *redViewW;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    self.redViewW.constant = 50;
    [UIView animateWithDuration:2.0 animations:^{
        //强制刷新
        [self.view layoutIfNeeded];
    }];
    
}


@end
