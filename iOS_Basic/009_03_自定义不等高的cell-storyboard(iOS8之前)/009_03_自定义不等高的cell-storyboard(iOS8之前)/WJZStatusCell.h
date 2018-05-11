//
//  WJZStatusCell.h
//  008_12_自定义不等高的cell-weibo-搭建基本框架
//
//  Created by 吴佳臻 on 2018/5/10.
//  Copyright © 2018年 wjz. All rights reserved.
//

#import <UIKit/UIKit.h>
@class WJZStatus;
@interface WJZStatusCell : UITableViewCell
@property(nonatomic,strong)WJZStatus *status;
-(CGFloat)cellHeight;
@end
