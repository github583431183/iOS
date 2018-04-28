//
//  main.m
//  _11_自定义类工厂方法
//
//  Created by 吴佳臻 on 2017/6/7.
//  Copyright © 2017年 吴佳臻. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Student.h"

int main(int argc, const char * argv[]) {
    
    Person *p = [[Person alloc] init];
    
    // 类工厂方法
    Person *p1  = [Person person];
    p1.age = 30;
    // 类工厂方法
    Person *p2 = [Person personWithAge:30];
    NSLog(@"age = %i", p2.age);
    
    /*
     自定义类工厂方法 是苹果的一个规范, 
     一般情况下, 我们会给一个 类 提供
     自定义构造方法 和 自定义类工厂方法 用于创建一个对象
     */
    [[NSString alloc] init];
    [NSString string];
    
    Student *stu = [Student person];
    // [[Person alloc] init];
    Person *p3 = [Person person];
    
    NSLog(@"------------------");
    
    stu.age=55;
    NSLog(@"age=%i",stu.age);
    
    stu.no = 888;
    NSLog(@"no=%i",stu.no);
    
    Student *stu2 = [Student personWithAge:30];
    Person *p4= [Person personWithAge:30];
    stu2.no = 888;
    
    NSLog(@"age=%i",stu2.age);
    NSLog(@"no=%i",stu2.no);
    NSLog(@"age=%i",p4.age);
    
    
    return 0;
}

