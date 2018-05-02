//
//  WJZAddContactViewController.h
//  06-通讯录(添加界面)
//
//  Created by 吴佳臻 on 2018/5/2.
//  Copyright © 2018年 wjz. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WJZAddContactViewController,WJZContactItem;
@protocol WJZAddContactViewControllerDelegate <NSObject>

- (void)addContactViewController:(WJZAddContactViewController *)addContactViewController contactItem:(WJZContactItem *)contactItem;

@end

@interface WJZAddContactViewController : UIViewController

@property(nonatomic,weak) id<WJZAddContactViewControllerDelegate> delegate;

@end
