//
//  ViewController.m
//  208-了解-位移枚举简单介绍
//
//  Created by 吴佳臻 on 2018/6/4.
//  Copyright © 2018年 wjz. All rights reserved.
//

#import "ViewController.h"

//第一种枚举
typedef enum {
    WJZDemoTypeTop,
    WJZDemoTypeBottom
}WJZDemoType;

//第二种枚举，定义类型
typedef NS_ENUM(NSInteger,WJZType) {
    WJZTypeTop,
    WJZTypeBottom
};

//第三种枚举，位移枚举
//一个参数可以传递多个值
//如果是位移枚举，观察第一个枚举值，如果该枚举值!=0，
//那么可以默认传0作为参数，如果传0做参数，那么效率最高
typedef NS_OPTIONS(NSInteger, WJZActionType) {
    WJZActionTypeTop = 1<<0,//1*2(0)=1
    WJZActionTypeBottom = 1<<1,//1*2(1)=2
    WJZActionTypeLeft = 1<<2,//1*2(2)=4
    WJZActionTypeRight = 1<<3//8
};

@interface ViewController ()

@end

@implementation ViewController

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    //    [self demo:WJZActionTypeTop | WJZActionTypeRight | WJZActionTypeLeft |WJZActionTypeBottom];
    [self demo:0];
}

//按位与 & 1&1==1 1&0==0 0&0==0 只要有0则为0
//按位或 | 1|1==1 1|0==1 0|0==0 只要有1则为1
-(void)demo:(WJZActionType)type{
    NSLog(@"%zd",type);
    if (type & WJZActionTypeTop) {
        NSLog(@"向上---%zd",type & WJZActionTypeTop);
    }
    if (type & WJZActionTypeRight) {
        NSLog(@"向右---%zd",type & WJZActionTypeRight);
    }
    if (type & WJZActionTypeBottom) {
        NSLog(@"向下---%zd",type & WJZActionTypeBottom);
    }
    if (type & WJZActionTypeLeft) {
        NSLog(@"向左---%zd",type & WJZActionTypeLeft);
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
