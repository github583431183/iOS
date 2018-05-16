//
//  ViewController.m
//  13-block简单讲解
//
//  Created by 吴佳臻 on 2018/5/16.
//  Copyright © 2018年 wjz. All rights reserved.
//

//变量类型
//参数类型 void(^) ()
typedef void(^MyBlock) ();

#import "ViewController.h"

@interface ViewController ()

@property(nonatomic,copy)MyBlock block2;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //block可以保存一段代码，在需要的时候调用
    //1.定义一个没有参数没有返回值的block
    //参数类型 void(^)()
    //block 变量名
    void(^block)()=^(){
        NSLog(@"%s, line = %d", __FUNCTION__, __LINE__);
    };
    block();
    
    //int a;
    //给block起别名的方式
    //MyBlock类型名
    MyBlock block1 = ^{
        NSLog(@"%s, line = %d", __FUNCTION__, __LINE__);
    };
    
    block1();
    
    /*
    block快捷键inlineBlock
    <#returnType#>(^<#blockName#>)(<#parameterTypes#>) = ^(<#parameters#>) {
        <#statements#>
    };
    */
    
    //2.在开发中一般都是跨方法调用
    //保存代码
    self.block2 = ^{
        NSLog(@"%s, line = %d", __FUNCTION__, __LINE__);
    };
    //3.block当参数传递
    [UIView animateWithDuration:0 animations:^{
        
    } completion:^(BOOL finished) {
        
    }];
}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    //调用block
    self.block2();
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
