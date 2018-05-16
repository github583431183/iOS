//
//  WJZCover.m
//  10-自定义蒙版
//
//  Created by 吴佳臻 on 2018/5/16.
//  Copyright © 2018年 wjz. All rights reserved.
//

#import "WJZCover.h"

@implementation WJZCover

+(void)show{
    //1.创建蒙版
    WJZCover *cover = [[self alloc] init];
    //2.添加蒙版
    //2.1蒙版添加到哪里-->添加到窗口上
    [[UIApplication sharedApplication].keyWindow addSubview:cover];
    //3.设置尺寸
    cover.frame = [UIScreen mainScreen].bounds;
    cover.backgroundColor = [UIColor blackColor];
    // 父控件透明子控件也透明
    //    cover.alpha = 0.7f;
    //使用透明的颜色不适用透明的组件
    cover.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.7f];
    //4.添加popMenu
    UIView *popMenu = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    [cover addSubview:popMenu];
    popMenu.backgroundColor = [UIColor yellowColor];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
