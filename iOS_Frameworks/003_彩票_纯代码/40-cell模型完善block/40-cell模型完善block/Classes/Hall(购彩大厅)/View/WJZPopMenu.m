//
//  WJZPopMenu.m
//  11-自定义pop菜单上
//
//  Created by 吴佳臻 on 2018/5/16.
//  Copyright © 2018年 wjz. All rights reserved.
//

#define WJZKeyWindow [UIApplication sharedApplication].keyWindow

#import "WJZPopMenu.h"
#import "WJZCover.h"
@implementation WJZPopMenu

// 当点击x号按钮的时候调用
- (IBAction)close:(id)sender {
    // 点击x号按钮,popMenu 慢慢缩小,边平移,
    // 缩小到一定尺寸,移除蒙版
    
    // 通知外界,点击了x号按钮
    if ([self.delegate respondsToSelector:@selector(popMenuDidCloseBtn:)]) {
        [self.delegate popMenuDidCloseBtn:self];
    }
}
+ (instancetype)showInCenter:(CGPoint)center{
    UIView *popMenu = [[NSBundle mainBundle] loadNibNamed:@"WJZPopMenu" owner:nil options:nil][0];
    popMenu.center = center;
    
    // 超出父控件剪切
    //    popMenu.layer.masksToBounds = YES;
    //    popMenu.clipsToBounds = YES;
    
    [WJZKeyWindow addSubview:popMenu];
    return popMenu;
}

- (void)hideInCenter:(CGPoint)center completion:(MyBlock)completion{
    // 子控件可以超出父控件
    [UIView animateWithDuration:0.5 animations:^{
        //        [self setNeedsDisplay];
        //        self.frame = CGRectMake(0, 0, 0, 0);
        self.center = CGPointMake(44, 44);
        
        self.transform = CGAffineTransformMakeScale(0.01, 0.01);
        //        self.frame = CGRectMake(0, 0, 50, 50);
        //
        //        [self layoutIfNeeded];
    } completion:^(BOOL finished) {
        //1.移除自己
        [self removeFromSuperview];
        //2.移除蒙版
        //[WJZCover hide];
        // 3.用代理通知外界 动画播放完毕
//        if ([self.delegate respondsToSelector:@selector(popMenuDidCloseBtn:)]) {
//            [self.delegate popMenuDidCloseBtn:self];
//        }
        //4.使用block当作参数传递，如果只为空，调用会崩溃
        if (completion) {
            completion();
        }
    }];
}
@end
