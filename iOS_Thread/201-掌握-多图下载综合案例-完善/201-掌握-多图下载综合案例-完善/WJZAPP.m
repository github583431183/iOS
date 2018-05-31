//
//  WJZAPP.m
//  112-掌握-多图下载综合案例-数据展示
//
//  Created by 吴佳臻 on 2018/5/30.
//  Copyright © 2018年 wjz. All rights reserved.
//

#import "WJZAPP.h"

@implementation WJZAPP
+(instancetype)appWithDict:(NSDictionary *)dict
{
    WJZAPP *appM = [[WJZAPP alloc]init];
    //KVC
    [appM setValuesForKeysWithDictionary:dict];
    
    return appM;
}
@end
