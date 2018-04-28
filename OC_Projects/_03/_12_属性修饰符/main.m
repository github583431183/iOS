//
//  main.m
//  _12_属性修饰符
//
//  Created by 吴佳臻 on 2017/6/6.
//  Copyright © 2017年 吴佳臻. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "Student.h"

int main(int argc, const char * argv[]) {
    Person *p = [Person new];
        p->_age = 30; // @public 可访问
       // p->_height = 1.75; // @private 不可访问
       // p->_weight = 60.0; // @protected 不可访问
        p->_name = @"haha"; // @package 可访问
    
    Student *stu = [Student new];
    stu -> _name = @"gaga"; // @package 可访问
    [stu showName];
    NSLog(@"-----");
    return 0;
}
