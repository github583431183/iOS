//
//  main.m
//  _04_结构体作为对象属性
//
//  Created by 吴佳臻 on 2017/6/1.
//  Copyright © 2017年 吴佳臻. All rights reserved.
//

#import <Foundation/Foundation.h>

/*
 合理的设计一个”学生“类
 学生有 * 姓名 ，* 生日 两个属性和说出自己姓名生日方法
 要求利用设计的学生类创建学生对象，并说出自己的姓名和年龄
 
 描述学生类
 
 事物名称: 学生(Student)
 属性:姓名(name), 生日(birthday)
 行为:说出字节姓名和生日(say)
 */

// 自定义结构体 -> 时间结构体
typedef struct {
    int year;
    int month;
    int day;
} Date;

@interface Student : NSObject
{
@public
    NSString *_name;
    //    struct Date birthday;
    Date _birthday;
}

- (void)say;

@end

@implementation Student

- (void)say
{
    NSLog(@"name = %@; year = %i, month = %i, day = %i", _name, _birthday.year, _birthday.month, _birthday.day);
}

@end


int main(int argc, const char * argv[]) {

    // 0.创建学生对象
    // 1.开辟存储空间
    // 2.初始化属性
    // 3.返回地址，赋值指针
    Student *stu = [Student new];
    
    // 4.设置学生对象的属性
    stu->_name = @"hh";
    // 5.结构体 '只能' 在定义的时候初始化
    // 6.系统并不清楚它是 '数组' 还是 '结构体'
    
    // 7.初始化结构体属性
        // 方法一:强制类型转换
        stu->_birthday = (Date){1986, 1, 15};
    
        // 方法二:定义一个新的结构体,给d赋值,将d赋值给_birthday
        Date d = {1986, 1, 15};
        // 本质是将d 所有的属性的值都拷贝了一份赋值给 _birthday
        stu->_birthday = d;
    
        // 方法三:分别赋值
        stu->_birthday.year = 1986;
        stu->_birthday.month = 1;
        stu->_birthday.day = 15;

    // 8.让学生说出自己的姓名和生日
    [stu say];
    

    return 0;
}
