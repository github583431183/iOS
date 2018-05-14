//
//  WJZAddContactViewController.h
//  01_通讯录_纯代码_框架搭建
//
//  Created by 吴佳臻 on 2018/5/14.
//  Copyright © 2018年 wjz. All rights reserved.
//

#import <UIKit/UIKit.h>
@class WJZContactItem,WJZAddContactViewController;
//1.定义协议
@protocol WJZAddContactDelegate <NSObject>

//2.定义协议方法
-(void)addContactViewController:(WJZAddContactViewController *)addContactViewController contactItem:(WJZContactItem *)contactItem;

@end

@interface WJZAddContactViewController : UIViewController

//3.定义协议属性
@property(nonatomic,weak)id<WJZAddContactDelegate> delegate;

@end
