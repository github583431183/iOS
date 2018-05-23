//
//  WJZSettingGroup.h
//  37-设置组模型
//
//  Created by 吴佳臻 on 2018/5/22.
//  Copyright © 2018年 wjz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WJZSettingGroup : NSObject

/** 头部标题 */
@property (nonatomic, copy) NSString *headerTitle;

/** 尾部标题 */
@property (nonatomic, copy) NSString *footTitle;

/** 行模型数组 */
@property (nonatomic, strong) NSArray *items;

+ (instancetype)gruopWithItems:(NSArray *)items;

@end
