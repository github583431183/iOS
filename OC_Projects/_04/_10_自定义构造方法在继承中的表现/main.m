//
//  main.m
//  _10_自定义构造方法在继承中的表现
//
//  Created by 吴佳臻 on 2017/6/7.
//  Copyright © 2017年 吴佳臻. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Student.h"
#import "Person.h"

int main(int argc, const char * argv[]) {
    
    // 此处调用 继承自父类的构造方法
    Student *stu1 = [[Student alloc] initWithAge:30 andName:@"haha"];
    NSLog(@"%@", stu1);

    // 调用自己的构造方法
    Student *stu2 = [[Student alloc]
                    initWithAge:30 andName:@"haha"
                     andNo:888];
    NSLog(@"%@", stu2);
    return 0;
}
