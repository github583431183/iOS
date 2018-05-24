//
//  Tool.m
//  104-掌握-ARC环境下实现单例模式
//
//  Created by 吴佳臻 on 2018/5/24.
//  Copyright © 2018年 wjz. All rights reserved.
//

#import "Tool.h"

@implementation Tool

//0.提供全局变量
static Tool *_instance;

//1.alloc->allocWithZone
+(instancetype)allocWithZone:(struct _NSZone *)zone{
    //加互斥锁解决多线程访问的安全问题
//    @synchronized(self){
//        if (_instance == nil) {
//            _instance = [super allocWithZone:zone];
//        }
//    }
    //本身就是线程安全的
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [super allocWithZone:zone];
    });
    return _instance;
}
//2.提供类方法
+(instancetype)shareTool{
    return [[self alloc] init];
}
//- (id)copy{
//    return _instance;
//}
//-(id)mutableCopy{
//    return _instance;
//}
//3.严谨
-(id)copyWithZone:(NSZone *)zone{
    return _instance;
}
-(id)mutableCopyWithZone:(NSZone *)zone{
    return _instance;
}
@end
