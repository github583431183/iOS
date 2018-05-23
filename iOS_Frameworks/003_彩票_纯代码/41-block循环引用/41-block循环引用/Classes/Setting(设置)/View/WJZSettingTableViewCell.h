//
//  WJZSettingTableViewCell.h
//  39-自定义cell
//
//  Created by 吴佳臻 on 2018/5/23.
//  Copyright © 2018年 wjz. All rights reserved.
//

#import <UIKit/UIKit.h>
@class WJZSettingItem;
@interface WJZSettingTableViewCell : UITableViewCell
@property(nonatomic,strong)WJZSettingItem *item;
+(instancetype)cellWithTableView:(UITableView *)tablewView;
@end
