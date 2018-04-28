//
//  Author.h
//  _06_多个对象的内存管理练习
//
//  Created by 吴佳臻 on 2017/11/25.
//  Copyright © 2017年 吴佳臻. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Account.h"
@interface Author : NSObject

// 用户昵称
@property(nonatomic,retain)NSString *name;

// 用户头像
@property(nonatomic,retain)NSString *icon;

//用户是否是会员
@property(nonatomic,assign,getter=isVip)BOOL vip;

//用户对应的账号
@property(nonatomic,retain)Account *account;

//用户的生日
@property(nonatomic,assign)MyDate birthday;

@end
