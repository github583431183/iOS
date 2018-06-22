//
//  Video.m
//  4403-掌握-复杂JSON解析-数据展示
//
//  Created by 吴佳臻 on 2018/6/22.
//  Copyright © 2018年 wjz. All rights reserved.
//

#import "Video.h"

@implementation Video

+(instancetype)videoWithDict:(NSDictionary *)dict{
    Video *video = [[Video alloc]init];
//    video.name = dict[@"name"];
    //KVC
    [Video setValuesForKeysWithDictionary:dict];
    return video;
}
@end
