//
//  Soldier.h
//  _02
//
//  Created by 吴佳臻 on 2017/6/2.
//  Copyright © 2017年 吴佳臻. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Gun.h"
#import "Clip.h"

@interface Soldier : NSObject
{
@public
    NSString *_name;
    double _height;
    double _weight;
}

/**
 士兵开枪方法

 @param gun 枪
 @param clip 弹夹
 */
-(void)fire:(Gun *)gun clip:(Clip *)clip;
@end
