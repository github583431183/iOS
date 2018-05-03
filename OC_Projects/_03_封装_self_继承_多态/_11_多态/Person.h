//
//  Person.h
//  _03
//
//  Created by 吴佳臻 on 2017/6/6.
//  Copyright © 2017年 吴佳臻. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Dog.h"
#import "Cat.h"

@interface Person : NSObject

/*
 + (void)food:(Dog *)dog;
 
 + (void)foodCat:(Cat *)cat;
 
 // 骆驼
 // 狗熊
 // 豹子
 // 大象
 // 猴子
 // 鸡
 // 猪
 // 草泥马
 // ...
 */

+ (void)food:(Animal *)a;
@end
