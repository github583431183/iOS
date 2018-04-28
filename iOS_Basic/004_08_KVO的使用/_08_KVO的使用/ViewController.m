//
//  ViewController.m
//  _08_KVO的使用
//
//  Created by 吴佳臻 on 2018/1/15.
//  Copyright © 2018年 wjz. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"

@interface ViewController ()

@end

@implementation ViewController

/*
 KVO: Key Value Observing (键值监听)
    --->
    当某个对象的 属性值 发生改变的时候（用 KVO 监听）
 */

- (void)viewDidLoad {
    [super viewDidLoad];
    Person *person = [[Person alloc]init];
    person.name = @"zs";
    /*
     作用：给对象绑定一个监听器（观察者）
     - Observer 观察者
     - KeyPath 要监听的属性
     - options 选项（方法中拿到的属性值）
     */
    [person addObserver:self
             forKeyPath:@"name"
                options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld
                context:nil];
    person.name = @"ls";
    person.name = @"ww";
    //移除监听
    [person removeObserver:self forKeyPath:@"name"];
}

/**
 * 当监听的属性值发生改变
 *  @param keyPath 要改变的属性
 *  @param object  要改变的属性所属的对象
 *  @param change  改变的内容
 *  @param context 上下文
 */
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    NSLog(@"%@------%@------%@", keyPath, object, change);
}


@end
