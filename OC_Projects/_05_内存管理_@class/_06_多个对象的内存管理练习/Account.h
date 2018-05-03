//
//  Account.h
//  _06_多个对象的内存管理练习
//
//  Created by 吴佳臻 on 2017/11/25.
//  Copyright © 2017年 吴佳臻. All rights reserved.
//

#import <Foundation/Foundation.h>

// 自定义日期结构体
typedef struct{
    int year;
    int month;
    int day;
    int hour;
    int minute;
    int second;
} MyDate;
@interface Account : NSObject

// 注册时间
@property(nonatomic,assign)MyDate registerTime;

// 账号(email)
@property(nonatomic,retain)NSString *email;

// 密码(pwd)
@property(nonatomic,retain)NSString *pwd;

@end
