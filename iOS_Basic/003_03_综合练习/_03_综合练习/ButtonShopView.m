//
//  ButtonShopView.m
//  _03_综合练习
//
//  Created by 吴佳臻 on 2018/1/15.
//  Copyright © 2018年 wjz. All rights reserved.
//

#import "ButtonShopView.h"
#import "Shop.h"
@implementation ButtonShopView

// 使用 UIButton 做View,会显示点击的交互效果

#pragma mark - 初始化
- (instancetype)initWithFrame:(CGRect)frame{
    if(self = [super initWithFrame:frame]){
        // 文字居中
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        // 文本颜色
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }
    return self;
}

#pragma mark - 布局子控件
- (void)layoutSubviews{
    [super layoutSubviews];
    // 1.获取自身的尺寸
    CGFloat width = self.frame.size.width;
    CGFloat height = self.frame.size.height;
    
    // 设置子控件的frame
    self.imageView.frame = CGRectMake(0, 0, width, height);
    self.titleLabel.frame = CGRectMake(0, width, width, height - width);
}

#pragma make - 设置子控件的数据
- (void)setShop:(Shop *)shop{
    _shop = shop;
    // 设置子控件的数据
    
    // 未设置状态，不显示
//    self.imageView.image = [UIImage imageNamed:shop.icon];
//    self.titleLabel.text = shop.name;
    
    [self setImage:[UIImage imageNamed:shop.icon] forState:UIControlStateNormal];
    [self setTitle:shop.name forState:UIControlStateNormal];
}
@end
