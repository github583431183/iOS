//
//  main.m
//  _03_练习2_对象引用
//
//  Created by 吴佳臻 on 2017/6/1.
//  Copyright © 2017年 吴佳臻. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject
{
@public
    int age;
    double height;
}
- (void)print;
@end

void test1(int newAge, double newHeight);
void test2(Person *newP);
void test3(Person *newP);
void test4(Person *newP);


@implementation Person
- (void)print
{
    NSLog(@"年龄=%d，身高=%f", age, height); // 10, 1.5
}
@end

void test1(int newAge, double newHeight)
{
    newAge = 30;
    newHeight = 1.6;
}

//   Person *newP = p;
void test2(Person *newP)
{
    newP->age = 20;
    newP->height = 1.7;
}

//   Person *newP = p;
void test3(Person *newP)
{
    Person *p2 = [Person new];
    p2->age = 40;
    p2->height = 1.8;
    
    newP = p2; // 对指针复制新的地址 对之前的无影响
    newP->age = 30;
}

void test4(Person *newP)
{
    Person *p2 = newP;
    
    p2->age = 50;// 修改地址指向的值
    p2->height = 1.9;// 修改地址指向的值
    
    newP->age = 60;// 修改地址指向的值
}


int main(int argc, const char * argv[]) {

    
    Person *p = [Person new];
    p->age = 10;
    p->height = 1.5f;
    
    test1(p->age, p->height); // 值 传递
    [p print]; // 10, 1.5
    
    test2(p); // 指针, 地址  引用 传递
    [p print]; // 20, 1.7
    
    test3(p); // 指针, 地址  应用传递 但里面对地址赋值新的地址
    [p print]; // 20, 1.7
    
    test4(p); // 指针, 地址
    [p print]; // 60, 1.9
    
    return 0;
}
