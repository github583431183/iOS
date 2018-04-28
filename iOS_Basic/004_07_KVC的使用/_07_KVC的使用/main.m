//
//  main.m
//  _07_KVC的使用
//
//  Created by 吴佳臻 on 2018/1/15.
//  Copyright © 2018年 wjz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "Dog.h"

/**
 KVC: key Value Coding (键值编码)
 */
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //1. 利用 KVC 进行简单复制
        Person *person11 = [[Person alloc] init];
        // 常规复制
//        person11.name = @"张三";
//        person11.age = 18;

        // KVC赋值
        [person11 setValue:@"王五" forKey:@"name"];
        [person11 setValue:@"19" forKeyPath:@"money"];// 自动类型转换
        
        NSLog(@"%@-----%.2f",person11.name,person11.money);
        
        //2. 利用 KVC 进行综合赋值
        Person *person21 = [[Person alloc] init];
        person21.dog = [[Dog alloc] init];
        person21.dog.name = @"旺财";
        //KVC 赋值
        /*
         forKey 和 forKeyPath 的区别
         1.forKeyPath 包含了所有 forKey 的功能
         2.forKeyPath 进行内部的点语法，层层访问内部的属性
         3.注意：key值一定要在属性中找到
         */
        [person21.dog setValue:@"啊黄" forKey:@"name"];
        [person21 setValue:@"旺财" forKeyPath:@"dog.name"];
        NSLog(@"%@", person21.dog.name);
        
        //3. 利用KVC修改类的私有成员变量(UIPageControl)
        Person *person31 = [[Person alloc] init];
        // 利用KVC修改类的 私有 成员变量
        [person31 printAge];
        [person31 setValue:@"88" forKey:@"_age"];// age | _age
        [person31 printAge];
        
        //4. 字典转模型
        /*
         作用：字典转模型
         开发中是不建议使用 setValuesForKeysWithDictionary:
            1.字典中key必须在模型的属性中找到
            2.如果模型中带有模型，setValuesForKeysWithDictionary:不好使
         应用场景：简单的字典转模型 ---> 框架 (MJExtention)
         */
        
        NSDictionary *dict41 = @{
                                 @"name":@"haha",
                                 @"dog" : @{
                                         @"name" : @"wangcai",
                                         @"price" : @8
                                         }
                                 /*
                                  模型中没有 books 数组，此处会报错
                                 ,
                                 @"books": @[
                                         @{@"name" :@"iOS快速开发", @"price" : @1999},
                                         @{@"name" :@"iOS快速发", @"price" : @199},
                                         @{@"name" :@"iOS快开发", @"price" : @99}
                                         ]
                                  */
                                 };
        Person *person41 = [[Person alloc] initWithDict:dict41];
        NSLog(@"%@",person41.dog.class);
        
        [person41 setValue:@{
                             @"name":@"旺财",
                             @"price":@8
                             }
                forKeyPath:@"dog"];
        NSLog(@"%@",person41.dog);
        
        
        //5.取值
        Person *person51 = [[Person alloc] init];
        person51.name = @"张三";
        person51.money = 12332;
        // 利用 KVC 取值
        NSLog(@"%@----%.2f",
              [person51 valueForKeyPath:@"name"],
              [[person51 valueForKeyPath:@"money"] floatValue]
              );
        
        //6.包模型转成字典
        Person *person61 = [[Person alloc] init];
        person61.name = @"haha";
        person61.money = 21.21;
        NSDictionary *dict61 = [person61 dictionaryWithValuesForKeys:@[@"name",@"money"]];
        NSLog(@"%@",dict61);
        
        
        
        //7. 取出 数组 中所有 模型 的某个属性值
         
        Person *person71 = [[Person alloc] init];
        person71.name = @"zhangsan";
        person71.money = 12.99;
        
        Person *person72 = [[Person alloc] init];
        person72.name = @"lisi";
        person72.money = 22.99;
        
        Person *person73 = [[Person alloc] init];
        person73.name = @"wangwu";
        person73.money = 33.99;
        
        NSArray *allPerson = @[person71,person72,person73];
        NSArray *allPersonName = [allPerson valueForKey:@"name"];
        
        NSLog(@"%@",allPersonName);
         
    }
    return 0;
}
