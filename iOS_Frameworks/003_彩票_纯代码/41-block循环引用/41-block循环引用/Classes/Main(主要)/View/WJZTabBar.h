//
//  WJZTabBar.h
//  05_彩票_自定义tabBar_3
//
//  Created by 吴佳臻 on 2018/5/15.
//  Copyright © 2018年 wjz. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WJZTabBar;
@protocol WJZTabBarDelegate <NSObject>
-(void)tabBar:(WJZTabBar *)tabBar index:(NSInteger)index;
@end

@interface WJZTabBar : UIView
/** 子控制器的个数 */
//@property (nonatomic, assign) NSInteger count;


/** 模型数组 */
@property (nonatomic, strong) NSArray *items;

@property(nonatomic,weak)id<WJZTabBarDelegate> delegate;
@end
