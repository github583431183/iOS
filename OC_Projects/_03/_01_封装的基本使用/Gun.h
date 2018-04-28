//
//  Gun.h
//  _03
//
//  Created by 吴佳臻 on 2017/6/2.
//  Copyright © 2017年 吴佳臻. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Gun : NSObject

{
    //    @public
    int _bullet; // 子弹
    // 虽然成员变量不是'public修饰' 外界不能直接访问, \
        但是可以在'本类'的'对象方法'中直接访问
}

/**
 *  射击方法
 */
- (void)shoot;

// 封装

// 提供一个方法用于设置成员变量的值
- (void)addBullet:(int)count;

// 提供一个方法用于返回成员变量的值
- (int)getBullet;


@end
