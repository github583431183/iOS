//
//  WJZAddContactViewController.h
//  06-通讯录(添加界面)
//
//  Created by 吴佳臻 on 2018/5/2.
//  Copyright © 2018年 wjz. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WJZContactItem,WJZContactTableViewController;

@interface WJZAddContactViewController : UIViewController

// 联系人控制器   \
注意:这里要用weak，防止造成循环引用，因为两者相互引用了
@property(nonatomic,weak)WJZContactTableViewController *contactTableViewController;


@end
