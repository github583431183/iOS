//
//  main.m
//  _05_NSArray文件读写
//
//  Created by 吴佳臻 on 2017/12/7.
//  Copyright © 2017年 吴佳臻. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

int main(int argc, const char * argv[]) {
    
    // 1.将数组写入到文件
    NSArray *arr = @[@"lnj", @"lmj", @"jjj"];
    // 其实如果将一个数组写入到文件中之后, 本质是写入了一个XML文件     \
        在iOS开发中一般情况下我们会将 XML文件 的扩展名保存为plist
    BOOL flag = [arr writeToFile:@"/Users/wujiazhen/Desktop/note/list.plist" atomically:YES];
    NSLog(@"flag = %i", flag);
    
    Person *p1 = [Person new];
    p1.age = 10;
    
    Person *p2 = [Person new];
    p2.age = 20;
    
    Person *p3 = [Person new];
    p3.age = 5;
    
    Person *p4 = [Person new];
    p4.age = 7;
    
    NSArray *arr2 = @[p1, p2, p3, p4];
    //注意:   \
        writeToFile只能写入数组中保存的元素都是 Foundation框架 中的类创建的对象,    \
        如果保存的是自定义对象那么不能写入
    BOOL flag2 = [arr2 writeToFile:@"/Users/wujiazhen/Desktop/note/person.plist" atomically:YES];
    NSLog(@"flag2 = %i", flag2);
    
    // 2.从文件中读取一个数组
    
     NSArray *newArray = [NSArray arrayWithContentsOfFile:@"/Users/wujiazhen/Desktop/note/list.plist"];
     NSLog(@"%@", newArray);
    
    
    return 0;
}
