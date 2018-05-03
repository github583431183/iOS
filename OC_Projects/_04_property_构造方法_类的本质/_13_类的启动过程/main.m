//
//  main.m
//  _13_类的启动过程
//
//  Created by 吴佳臻 on 2017/6/8.
//  Copyright © 2017年 吴佳臻. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "GoodStudent.h"

int main(int argc, const char * argv[])
{
    
/*
 
 log:
 
 load 方法 被调用了
 Car类被加载到内存了
 GoodStudent类被加载到内存了
 Person类被加载到内存了
 Student类被加载到内存了
 
 initialize 方法被调用，而且对应的类只会调用一次
 Person initialize
 GoodStudent initialize
 */
    Person *p1 = [[Person alloc] init];
    Person *p2 = [[Person alloc] init];
    Person *p3 = [[Person alloc] init];
    Person *p4 = [[Person alloc] init];

    GoodStudent *gstu = [[GoodStudent alloc] init];

    return 0;
}
