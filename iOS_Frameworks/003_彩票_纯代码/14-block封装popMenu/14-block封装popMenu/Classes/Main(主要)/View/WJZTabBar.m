//
//  WJZTabBar.m
//  05_彩票_自定义tabBar_3
//
//  Created by 吴佳臻 on 2018/5/15.
//  Copyright © 2018年 wjz. All rights reserved.
//

#import "WJZTabBar.h"
#import "WJZTabBarButton.h"
@interface WJZTabBar ()

/** 记录选中的按钮 */
@property (nonatomic, weak) UIButton *selButton;

@end

@implementation WJZTabBar

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)setItems:(NSArray *)items{
    _items = items;
    for (int i = 0; i < self.items.count; i++) {
        // 添加子控件
        UIButton *button = [[WJZTabBarButton alloc] init];
        [self addSubview:button];
        UITabBarItem *tabBarItem = self.items[i];
        //        button setBackgroundImage:<#(nullable UIImage *)#> forState:<#(UIControlState)#>
        
        [button setBackgroundImage:tabBarItem.image forState:UIControlStateNormal];
        [button setBackgroundImage:tabBarItem.selectedImage  forState:UIControlStateSelected];
        
        [button addTarget:self action:@selector(buttonOnClick:) forControlEvents:UIControlEventTouchDown];
        
    }
}
// 当按钮点击的时候调用
- (void)buttonOnClick:(UIButton *)button{
    
    // 1.取消上次选中
    self.selButton.selected = NO;
    
    // 2.选中当前点击的按钮
    button.selected = YES;
    
    // 3.记录当前选中的按钮
    self.selButton = button;
    
    //4.设置代理方法，通知外界切换子控制器
    if ([self.delegate respondsToSelector:@selector(tabBar:index:)]) {
        [self.delegate tabBar:self index:button.tag];
    }
}
- (void)layoutSubviews{
    [super layoutSubviews];
    // 调整子控件的frame
    
    CGFloat buttonX = 0;
    CGFloat buttonY = 0;
    CGFloat buttonW = self.frame.size.width / self.subviews.count;
    CGFloat buttonH = self.frame.size.height;
    
    int i = 0;
    for (UIButton *button in self.subviews) {
        
        // 为button绑定标记
        button.tag = i;
        
        buttonX = buttonW * i;
        if (i == 0) {
            [self buttonOnClick:button];
        }
        button.frame = CGRectMake(buttonX, buttonY, buttonW, buttonH);
        i++;
        
    }
}

@end
