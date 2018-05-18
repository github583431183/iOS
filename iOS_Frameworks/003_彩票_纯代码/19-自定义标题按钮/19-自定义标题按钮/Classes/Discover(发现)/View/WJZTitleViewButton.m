//
//  WJZTitleViewButton.m
//  19-自定义标题按钮
//
//  Created by 吴佳臻 on 2018/5/18.
//  Copyright © 2018年 wjz. All rights reserved.
//

#import "WJZTitleViewButton.h"

@implementation WJZTitleViewButton

// 调整子控件的位置
// 调整imageview的位置
//- (CGRect)imageRectForContentRect:(CGRect)contentRect

//调整lable的位置
//- (CGRect)titleRectForContentRect:(CGRect)contentRect

-(void)layoutSubviews{
    [super layoutSubviews];
    if (self.imageView.x < self.titleLabel.x) {
        //第一次
        //调整子控件的位置
        //调整label
        self.titleLabel.x = self.imageView.x;
        //调整imageview
        self.imageView.x = CGRectGetMaxX(self.titleLabel.frame);
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
