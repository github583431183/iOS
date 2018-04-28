//
//  MyButton.m
//  _04_UIButton内部子控件的调整
//
//  Created by 吴佳臻 on 2018/1/15.
//  Copyright © 2018年 wjz. All rights reserved.
//

#import "MyButton.h"

@implementation MyButton

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        // 文字居中
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        //改变图片的内容模式
        self.imageView.contentMode = UIViewContentModeCenter;
    }
    return self;
}

#pragma mark - 方式一，改变内容位置
/*
 重写两个方法：不要调用 super ，就是要重写掉
 contentRect: 内容的尺寸，内容包括(imageView 和 label)
 */
/*
- (CGRect)titleRectForContentRect:(CGRect)contentRect{
    return CGRectMake(0, 0, 100, 70);
}

- (CGRect)imageRectForContentRect:(CGRect)contentRect{
    return CGRectMake(100, 0, 70, 70);
}
 */

#pragma mark - 方式二，改变内容位置
- (void)layoutSubviews{
    [super layoutSubviews];
    // 设置子控件的位置
    self.titleLabel.frame = CGRectMake(0, 0, 100, 70);
    self.imageView.frame = CGRectMake(100, 0, 70, 70);
}
@end
