//
//  Gun.h
//  _02
//
//  Created by 吴佳臻 on 2017/6/2.
//  Copyright © 2017年 吴佳臻. All rights reserved.
//

#import <Foundation/Foundation.h>

// 多文件开发中，要使用谁就导入谁的.h文件
//// 注意： 导入的一定是.h文件，不能是.m文件
// 如果导入.m文件会报重复定义错误

// 此处需要使用 Clip 类
#import "Clip.h" 
// "" 有本地 <> 无本地

@interface Gun : NSObject
{
    Clip *p;
}


/**
 射击

 @param c 弹夹
 */
-(void)shoot:(Clip *)c;
@end
