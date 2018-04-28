//
//  main.m
//  _04_第一个OC类-类方法
//
//  Created by 吴佳臻 on 2017/6/1.
//  Copyright © 2017年 吴佳臻. All rights reserved.
//

#import <Foundation/Foundation.h>

// 1.编写类的声明
@interface Iphone : NSObject
{
    
@public
    float _model; // 型号  0
    int _cpu; // cup   0
    double _size; // 尺寸  0
    int _color; // 颜色  0
}

// 对象方法
- (void)about;
- (char *)loadMessage;
- (int)signal:(int)number;
- (int)sendMessageWithNumber:(int)number andContent:(char *)content;

// 类方法
// 如果不想每次使用 方法 都需要 创建对象 开辟存储空间
// 并且如果该方法中没有使用到'属性(成员变量)', 那么你可以把这个方法定义为 类方法
// 对象方法 用 对象调用  类方法 用 类调用
//- (int)sumWithValue1:(int)value1 andValue2:(int)value2;

// 如果定义类方法, 类方法的写法和对象方法一模一样, \
    除了前面的 - 号不同以外 \
    只需要将对象方法的 - 号换成 + , 那么就定义了一个类方法
+ (int)sumWithValue1:(int)value1 andValue2:(int)value2;

+ (void)demo;

@end


// 2.编写类的实现
@implementation Iphone

// 行为的实现
- (void)about
{
    //    NSLog(@"sum = %i", [Iphone sumWithValue1:50 andValue2:50]);
    NSLog(@"型号 = %f, cpu = %i, 尺寸= %f, 颜色 = %i", _model, _cpu, _size, _color);
    //    Iphone *p = [Iphone new];
    //    NSLog(@"%s", [p loadMessage]);
    
    //    NSLog(@"%s", [self loadMessage]);
}
- (char *)loadMessage
{
    return "wife is god";
}

- (int)signal:(int)number
{
    NSLog(@"打电话给%i", number);
    return 1;
}

- (int)sendMessageWithNumber:(int)number andContent:(char *)content
{
    NSLog(@"发短信给%i, 内容是%s", number, content);
    return 1;
}

//// 注意: 如果声明的是 对象方法 那么就'必须'实现 对象方法
//      如果声明的是 类方法 那么就'必须'实现 类方法

/*
 类方法和对象方法的区别
 0. 对象方法以 - 开头
    类方法以 + 开头
 
 1. 对象方法 必须用 对象 调用
    类方法 必须用 类 调用
 
 2. 对象方法 中 可直接 访问 属性(成员变量)
    类方法 中 不可直接 访问 属性(成员变量)
 
 3. 类方法 和 对象方法 可以进行相互调用
 
 4.1 对象方法 中 可直接 调用 类方法
 4.2 类方法 中间接(new 对象，对象调用)调用对象方法  (注意: 不建议这样使用)
 4.3 类方法 中可直接 调用其它 类方法
 4.4 对象方法 中可直接 调用其他 对象方法
 */

/*
 类方法 的应用场景
 
 1. 如果方法中没有使用到 '属性(成员变量)', 那么能用 类方法 就用类方法
 2. 类方法 的执行效率比 对象方法 高
 3. 类方法 一般用于 定义 工具方法
 4. 字符串查找
 5. 文件操作
 6. 数据库操作
 */

// 类方法实现
+ (int)sumWithValue1:(int)value1 andValue2:(int)value2
{
    //     NSLog(@"型号 = %f, cpu = %i, 尺寸= %f, 颜色 = %i", _model, _cpu, _size, _color);
    //    Iphone *p = [Iphone new];
    //    [p signal:123456789]; // 注意: 在企业开发中, 不建议这样使用
    return value1 + value2;
}

+ (void)demo
{
    //    NSLog(@"%i", [Iphone sumWithValue1:90 andValue2:90]);
    NSLog(@"demo");
}
@end


int main(int argc, const char * argv[]) {
    
    
    Iphone *p2 = [Iphone new];
    
    int num = [Iphone sumWithValue1:10 andValue2:20];
    NSLog(@"当前数值%i",num);
    [Iphone demo];
    
    [p2 about];
    
    return 0;
}
