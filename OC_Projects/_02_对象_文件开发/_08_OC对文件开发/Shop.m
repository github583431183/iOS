//
//  Shop.m
//  _02
//
//  Created by 吴佳臻 on 2017/6/2.
//  Copyright © 2017年 吴佳臻. All rights reserved.
//

#import "Shop.h"

@implementation Shop

+(Gun *)buyGun:(int)money{
    // 1.创建一把枪
    // 通过 'new' 创建出来的对象存储在堆中 \
        堆中的数据不会自动释放
    Gun *gun = [Gun new];

    // 2.返回一把枪
    return gun;
    
}

+(Clip *)buyClip:(int)money{

    Clip *clip = [Clip new];
    
    [clip addBullet];
    
    return clip;

}
@end
