//
//  Shop.h
//  _02
//
//  Created by 吴佳臻 on 2017/6/2.
//  Copyright © 2017年 吴佳臻. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Gun.h"
#import "Clip.h"

@interface Shop : NSObject


/**
 卖枪方法

 @param money 购买枪的价格
 @return 返回一把枪
 */
+(Gun *)buyGun:(int)money;


/**
 卖弹夹

 @param money 钱
 @return 弹夹
 */
+(Clip *)buyClip:(int)money;


@end
