//
//  WJZContactTableViewController.h
//  03-通讯录(注销业务逻辑)
//
//  Created by 吴佳臻 on 2018/4/28.
//  Copyright © 2018年 wjz. All rights reserved.
//

#import <UIKit/UIKit.h>
@class WJZContactItem;

@interface WJZContactTableViewController : UITableViewController

//当前用户名
// copy / strong 可变字符串的深浅拷贝
@property(nonatomic,strong)NSString *accountName;

@property(nonatomic,strong)WJZContactItem *contactItem;

@end
