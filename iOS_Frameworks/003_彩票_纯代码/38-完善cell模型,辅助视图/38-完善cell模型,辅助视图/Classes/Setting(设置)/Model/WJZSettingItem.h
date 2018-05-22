//
//  WJZSettingItem.h
//  36-搭建设置界面(MVC)
//
//  Created by 吴佳臻 on 2018/5/22.
//  Copyright © 2018年 wjz. All rights reserved.
//
typedef enum : NSUInteger {
    WJZSettingItemRightViewStateNone,
    WJZSettingItemRightViewStateArrow,
    WJZSettingItemRightViewStateSwitch,

} WJZSettingItemRightViewState;
#import <Foundation/Foundation.h>

@interface WJZSettingItem : NSObject
/** 图片 */
@property (nonatomic, strong) UIImage *icon;

/** 标题 */
@property (nonatomic, copy) NSString *title;

/** 右侧视图 */
@property (nonatomic, assign) WJZSettingItemRightViewState type;

+ (instancetype)itemWithIcon:(UIImage *)icon title:(NSString *)title;
@end
