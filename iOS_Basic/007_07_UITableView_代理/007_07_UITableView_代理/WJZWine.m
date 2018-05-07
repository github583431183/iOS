//
//  WJZWine.m
//  007_05_UITableView_展示单组数组
//
//  Created by 吴佳臻 on 2018/5/3.
//  Copyright © 2018年 wjz. All rights reserved.
//

#import "WJZWine.h"

@implementation WJZWine

+ (instancetype)wineWithDict:(NSDictionary *)dict{
    WJZWine *wine = [[self alloc] init];
    [wine setValuesForKeysWithDictionary:dict];
    return wine;
}
@end
