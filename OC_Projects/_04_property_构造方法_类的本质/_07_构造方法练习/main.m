//
//  main.m
//  _07_构造方法练习
//
//  Created by 吴佳臻 on 2017/6/6.
//  Copyright © 2017年 吴佳臻. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "Student.h"

int main(int argc, const char * argv[]) {
    
    Person *p = [[Person alloc] init];
    NSLog(@"%@", p);
    
    Person *p1 = [[Person alloc] init];
    NSLog(@"%@", p1);
    
    Student *stu = [[Student alloc] init];
    NSLog(@"%@", stu);
    
    Student *stu1 = [[Student alloc] init];
    NSLog(@"%@", stu1);
    
    return 0;
}
