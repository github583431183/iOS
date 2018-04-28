//
//  Status.h
//  _06_多个对象的内存管理练习
//
//  Created by 吴佳臻 on 2017/11/25.
//  Copyright © 2017年 吴佳臻. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Author.h"

@interface Status : NSObject

//微博正文
@property(nonatomic,retain)NSString *text;

//微博配图
@property(nonatomic,retain)NSString *picture;

//微博发布时间
@property(nonatomic,assign)MyDate createTime;

//微博对应的作者（用户）
@property(nonatomic,retain)Author *author;

//评论数
@property(nonatomic,assign)int commentCount;

//转发数
@property(nonatomic,assign)int retweetCount;

//赞数
@property(nonatomic,assign)int likeCount;

//转发微博
@property(nonatomic,retain)Status *repostStatus;
@end
