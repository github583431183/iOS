//
//  ShopView.h
//  _02_通过xib自定义商品的View
//
//  Created by 吴佳臻 on 2018/1/13.
//  Copyright © 2018年 wjz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShopView : UIView

// 提供set方法
- (void)setIcon: (NSString *)icon;
- (void)setName: (NSString *)name;

// 提供快速创建方法
+ (instancetype)shopView;
@end
