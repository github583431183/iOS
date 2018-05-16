//
//  UIView+Frame.h
//  15-抽取UIView分类
//
//  Created by 吴佳臻 on 2018/5/16.
//  Copyright © 2018年 wjz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Frame)

//- (CGFloat)width;
//- (void)setWidth:(CGFloat)width;
//- (CGFloat)height;
//- (void)setHeight:(CGFloat)height;

//在分类中 @property 只会生成 get,set 方法，并不会生成下划线的成员属性
@property(nonatomic,assign)CGFloat width;
@property(nonatomic,assign)CGFloat height;
@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@end
