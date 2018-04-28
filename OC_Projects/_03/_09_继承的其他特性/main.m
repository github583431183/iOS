//
//  main.m
//  _09_继承的其他特性
//
//  Created by 吴佳臻 on 2017/6/6.
//  Copyright © 2017年 吴佳臻. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Iphone.h"
int main(int argc, const char * argv[]) {

    Iphone *p = [Iphone new];
    [p signalWithNumber:@"13456789"];
    
    [Iphone brand];

    /*
     继承:
     当 B类 继承 A类, 那么 B类 就拥有 A类 所有的 属性 和 方法(类方法/对象方法)
     
     优点:
     提高代码的复用性
     可以让 类 与 类 之间产生 关系, 正是因为 继承 让 类 与 类 之间产生了关系所以才有了'多态'
     
     注意:
        不要以为 继承 可以提高代码的复用性,
        只有满足'一定'的条件我们才能使用继承
     
     条件: XXXX 是 XXX   /    某某某 is a 某某某
     
     学生:
     姓名
     年龄
     数学成绩
     语文成绩
     英语成绩
     
     排行榜:
     数学成绩
     语文成绩
     英语成绩
     
     分数类:
     数学成绩
     语文成绩
     英语成绩
     
     缺点:
     耦合性太强(依赖性太强)
     
     */

    
    return 0;
}
