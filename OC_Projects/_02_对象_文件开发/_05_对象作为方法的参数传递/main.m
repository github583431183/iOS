//
//  main.m
//  _05_对象作为方法的参数传递
//
//  Created by 吴佳臻 on 2017/6/1.
//  Copyright © 2017年 吴佳臻. All rights reserved.
//

#import <Foundation/Foundation.h>

/*
 士兵
 事物名称: 士兵(Soldier)
 属性:姓名(name), 身高(height), 体重(weight)
 行为:打枪(fire), 打电话(callPhone)
 
 枪
 事物名称:枪(Gun)
 属性:弹夹(clip) , 型号(model)
 行为:上弹夹(addClip)
 
 弹夹
 事物名称: 弹夹(Clip)
 属性:子弹(Bullet)
 行为:上子弹(addBullet)
 */

@interface Gun : NSObject
{
@public
    int _bullet; // 子弹
}

// 射击
- (void)shoot;
@end

@implementation Gun
- (void)shoot
{
    // 判断是否有子弹
    if (_bullet > 0) {
        
        _bullet--;
        NSLog(@"打了一枪 %i", _bullet);
    }else
    {
        NSLog(@"没有子弹了, 请换弹夹");
    }
}
@end

@interface Soldier : NSObject
{
@public
    NSString *_name;
    double _height;
    double _weight;
}
//- (void)fire;
// 需要枪的对象
- (void)fire:(Gun *)gun;

@end

@implementation Soldier

/*
 - (void)fire
 {
    NSLog(@"打了一枪");
 }
 */

//  Gun * g = gp
- (void)fire:(Gun *)g
{
    // NSLog(@"打了一枪");
    // 调用Gun 类中的对象方法
    [g shoot];
}

@end

int main(int argc, const char * argv[]) {
    
    // 1.创建士兵
    Soldier *sp =[Soldier new];
    sp->_name = @"哈哈";
    sp->_height = 1.88;
    sp->_weight = 100.0;
    
    // 2.创建一把枪
    Gun *gp = [Gun new];
    gp->_bullet = 10;
    
    // 2.让士兵开枪
    // [sp fire];
    // 让对象作为方法的参数传递
    [sp fire:gp]; // 地址
    [sp fire:gp];
    [sp fire:gp];
    [sp fire:gp];
    [sp fire:gp];
    [sp fire:gp];

    
    return 0;
}
