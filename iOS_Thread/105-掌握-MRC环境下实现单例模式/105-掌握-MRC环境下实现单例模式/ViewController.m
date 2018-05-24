//
//  ViewController.m
//  104-掌握-ARC环境下实现单例模式
//
//  Created by 吴佳臻 on 2018/5/24.
//  Copyright © 2018年 wjz. All rights reserved.
//

#import "ViewController.h"
#import "Tool.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    Tool *t1 = [[Tool alloc]init];
    //[t1 release];
    
    Tool *t2 = [[Tool alloc]init];
    //[t2 release];
    //release -1
    //retain +1
    //message sent to deallocated instance 0x7fa102d16190
    
    Tool *t3 = [Tool new];
    Tool *t4 = [Tool shareTool];
    Tool *t5 = [t1 copy];
    Tool *t6 = [t1 mutableCopy];
    
    NSLog(@"t1:%p t2:%p t3:%p t4:%p t5:%p t6:%p",t1,t2,t3,t4,t5,t6);
    //t1:0x60000000d5c0 t2:0x60000000d5c0 t3:0x60000000d5c0 t4:0x60000000d5c0 t5:0x60000000d5c0 t6:0x60000000d5c0
}

@end
