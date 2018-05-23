//
//  WJZBaseTableViewController.h
//  43-封装基类,比分直播,cell键盘处理
//
//  Created by 吴佳臻 on 2018/5/23.
//  Copyright © 2018年 wjz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WJZSettingTableViewCell.h"
@interface WJZBaseTableViewController : UITableViewController
/** 数组总数 */
@property (nonatomic, strong) NSMutableArray *groups;
@end
