//
//  WJZTg.m
//  008_04_自定义等高的cell-纯代码-frame03-设置数据
//
//  Created by 吴佳臻 on 2018/5/7.
//  Copyright © 2018年 wjz. All rights reserved.
//

#import "WJZTg.h"

@implementation WJZTg

+ (instancetype)tgWithDict:(NSDictionary *)dict{
    WJZTg *tg = [[self alloc]init];
    [tg setValuesForKeysWithDictionary:dict];
    return tg;
}
@end
