//
//  Gun.m
//  _02
//
//  Created by 吴佳臻 on 2017/6/2.
//  Copyright © 2017年 吴佳臻. All rights reserved.
//

#import "Gun.h"

@implementation Gun

-(void)shoot:(Clip *)c{

    // 判断有没有弹夹
    if (c != nil) { // nil == null == 没有值
        // 判断有没有子弹
        if (c->_bullet > 0) {
            c->_bullet -= 1;
            NSLog(@"打了一枪 %i", c->_bullet);
        }else
        {
            NSLog(@"没有子弹了");
        }
    }else
    {
        NSLog(@"没有弹夹, 请换弹夹");
    }

}
@end
