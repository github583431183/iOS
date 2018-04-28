//
//  ShopView.h
//  _03_综合练习
//
//  Created by 吴佳臻 on 2018/1/12.
//  Copyright © 2018年 wjz. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Shop;
@interface ShopView : UIView
// readonly 只会调用get方法
// 图片控件
//@property (nonatomic, weak, readonly) UIImageView *iconView;

// 标题控件
//@property (nonatomic, weak, readonly) UILabel *titleLabel;

// 提供接口方法
//- (void)setIcon: (NSString *)icon;
//- (void)setName: (NSString *)name;

// 商品模型
@property (nonatomic, strong) Shop *shop;

// 暴露构造方法
- (instancetype)initWithShop: (Shop *)shop;
+ (instancetype)shopViewWithShop: (Shop *)shop;
+ (instancetype)shopView;
@end
