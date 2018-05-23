//
//  WJZSettingGroup.m
//  37-设置组模型
//
//  Created by 吴佳臻 on 2018/5/22.
//  Copyright © 2018年 wjz. All rights reserved.
//

#import "WJZSettingGroup.h"

@implementation WJZSettingGroup
+ (instancetype)gruopWithItems:(NSArray *)items{
    WJZSettingGroup *gruop = [[self alloc] init];
    
    gruop.items = items;
    
    return gruop;
}
@end
