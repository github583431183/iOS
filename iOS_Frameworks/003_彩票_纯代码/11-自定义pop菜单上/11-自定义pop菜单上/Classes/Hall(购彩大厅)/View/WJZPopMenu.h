//
//  WJZPopMenu.h
//  11-自定义pop菜单上
//
//  Created by 吴佳臻 on 2018/5/16.
//  Copyright © 2018年 wjz. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WJZPopMenu;

@protocol WJZPopMenuDelegate <NSObject>

- (void)popMenuDidCloseBtn:(WJZPopMenu *)popMenu;

@end

@interface WJZPopMenu : UIView

+ (instancetype)showInCenter:(CGPoint)center;

- (void)hideInCenter:(CGPoint)center;

@property (nonatomic, weak) id<WJZPopMenuDelegate> delegate;
@end
