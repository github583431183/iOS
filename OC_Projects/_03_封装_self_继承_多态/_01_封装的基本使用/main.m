//
//  main.m
//  _01_封装的基本使用
//
//  Created by 吴佳臻 on 2017/6/2.
//  Copyright © 2017年 吴佳臻. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Gun.h"
int main(int argc, const char * argv[]) {

    // 1.创建一把枪
    Gun *gun = [Gun new];
    // 2.设置枪的子弹数量
    // 由于 Gun 的成员变量时 public 修改是的 所以外界可以随意修改
    //    gun->_bullet = 100;
    // 引发这个问题的原因: 因为成员变量是public, 给成员变量赋值的时, 赋值的值不受我们的约束
    //    gun->_bullet = -100;
    
    // Gun 的成员变量 去掉 public 修饰 外界不能直接修改
    [gun addBullet:100];
    
    // 3.射击
    [gun shoot];
    
    // 4.查看子弹的剩余数据(获取成员变量的值)
    //    NSLog(@"bullet = %i", gun->_bullet);
    NSLog(@"BULLET = %i", [gun getBullet]);
    
    return 0;
}
