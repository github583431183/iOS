//
//  WJZStatus.h
//  008_12_自定义不等高的cell-weibo-搭建基本框架
//
//  Created by 吴佳臻 on 2018/5/10.
//  Copyright © 2018年 wjz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WJZStatus : NSObject
@property(nonatomic,copy)NSString *icon;
@property(nonatomic,copy)NSString *name;
@property(nonatomic,copy)NSString *text;
@property(nonatomic,assign,getter=isVip)BOOL vip;
@property(nonatomic,copy)NSString *picture;
@end
