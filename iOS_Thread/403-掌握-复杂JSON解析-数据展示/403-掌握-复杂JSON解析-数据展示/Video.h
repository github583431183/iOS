//
//  Video.h
//  4403-掌握-复杂JSON解析-数据展示
//
//  Created by 吴佳臻 on 2018/6/22.
//  Copyright © 2018年 wjz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Video : NSOperation
/*
 "id": 1,
 "image": "resources/images/minion_01.png",
 "length": 10,
 "name": "小黄人 第01部",
 "url": "resources/videos/minion_01.mp4"
 */

//ID
@property(nonatomic,strong)NSString *ID;
//图片地址
@property(nonatomic,strong)NSString *image;
//播放时间
@property(nonatomic,strong)NSString *length;
//标题
@property(nonatomic,strong)NSString *name;
//视频url
@property(nonatomic,strong)NSString *url;

//字典转模型处理
+(instancetype)videoWithDict:(NSDictionary *)dict;
@end
