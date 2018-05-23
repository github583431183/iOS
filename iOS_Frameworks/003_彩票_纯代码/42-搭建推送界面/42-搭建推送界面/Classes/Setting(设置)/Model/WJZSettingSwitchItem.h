//
//  WJZSettingSwitchItem.h
//  38-完善cell模型,辅助视图
//
//  Created by 吴佳臻 on 2018/5/22.
//  Copyright © 2018年 wjz. All rights reserved.
//

#import "WJZSettingItem.h"

@interface WJZSettingSwitchItem : WJZSettingItem
/** 开关状态 */
@property (nonatomic, assign, getter=isOn) BOOL on;
@end
