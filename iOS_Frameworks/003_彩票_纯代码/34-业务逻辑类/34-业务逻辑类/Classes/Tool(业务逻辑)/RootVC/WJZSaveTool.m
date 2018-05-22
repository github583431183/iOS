//
//  WJZSaveTool.m
//  34-业务逻辑类
//
//  Created by 吴佳臻 on 2018/5/22.
//  Copyright © 2018年 wjz. All rights reserved.
//

#import "WJZSaveTool.h"

@implementation WJZSaveTool
+(id)objectForKey:(NSString *)defaultName{
    return [[NSUserDefaults standardUserDefaults] objectForKey:defaultName];
}
+(void)setObject:(id)value forKey:(NSString *)defaultName{
    if (defaultName) {
        [[NSUserDefaults standardUserDefaults]setObject:value forKey:defaultName];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
}
@end
