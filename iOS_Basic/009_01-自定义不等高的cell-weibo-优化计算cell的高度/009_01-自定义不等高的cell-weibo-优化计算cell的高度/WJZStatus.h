//
//  WJZStatus.h
//  008_12_自定义不等高的cell-weibo-搭建基本框架
//
//  Created by 吴佳臻 on 2018/5/10.
//  Copyright © 2018年 wjz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WJZStatus : NSObject

/** 文字/图片数据***/
/** 图像 */
@property (nonatomic, copy) NSString *icon;

/** 昵称 */
@property (nonatomic, copy) NSString *name;

/** 正文(内容) */
@property (nonatomic, copy) NSString *text;

/** VIP */
@property (nonatomic, assign, getter=isVip) BOOL vip;

/** 配图 */
@property (nonatomic, copy) NSString *picture;


/** frame数据***/
/** 图像的frame */
@property (nonatomic, assign) CGRect iconFrame;
/** 昵称的frame */
@property (nonatomic, assign) CGRect nameFrame;
/** vip的frame */
@property (nonatomic, assign) CGRect vipFrame;
/** 正文frame */
@property (nonatomic, assign) CGRect textFrame;
/** 配图的frame */
@property (nonatomic, assign) CGRect pictureFrame;

/** cell的高度 */
@property (nonatomic, assign) CGFloat cellHeight;

@end
