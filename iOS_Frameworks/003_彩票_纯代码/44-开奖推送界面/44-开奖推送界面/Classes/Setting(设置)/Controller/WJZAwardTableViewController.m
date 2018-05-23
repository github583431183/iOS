//
//  WJZAwardTableViewController.m
//  44-开奖推送界面
//
//  Created by 吴佳臻 on 2018/5/23.
//  Copyright © 2018年 wjz. All rights reserved.
//

#import "WJZAwardTableViewController.h"

@interface WJZAwardTableViewController ()

@end

@implementation WJZAwardTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    [self setupGroup0];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setupGroup0{
    WJZSettingSwitchItem *item = [WJZSettingSwitchItem itemWithTitle:@"双色球"];
    item.subTitle = @"每天开奖";
    
    WJZSettingSwitchItem *item1 = [WJZSettingSwitchItem itemWithTitle:@"双色球"];
    item1.subTitle = @"每天开奖";
    
    WJZSettingSwitchItem *item2 = [WJZSettingSwitchItem itemWithTitle:@"双色球"];
    item2.subTitle = @"每天开奖";
    
    WJZSettingSwitchItem *item3 = [WJZSettingSwitchItem itemWithTitle:@"双色球"];
    item3.subTitle = @"每天开奖";
    
    WJZSettingSwitchItem *item4 = [WJZSettingSwitchItem itemWithTitle:@"双色球"];
    item4.subTitle = @"每天开奖";
    
    WJZSettingGroup *group = [WJZSettingGroup gruopWithItems:@[item, item1, item2, item3, item4]];
    
    [self.groups addObject:group];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    // 1.创建cell
    //    static NSString *ID = @"cell";
    
    //    WJZSettingTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    //
    //    if (cell == nil) {
    //        cell = [[WJZSettingTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    //    }
    
    WJZSettingTableViewCell *cell = [WJZSettingTableViewCell cellWithTableView:tableView cellStyle:UITableViewCellStyleSubtitle];
    cell.detailTextLabel.font = [UIFont systemFontOfSize:10];
    
    // 设置数据
    // 0.取出行模型数组
    WJZSettingGroup *group = self.groups[indexPath.section];
    
    // 1.取出行模型
    WJZSettingItem *item =  group.items[indexPath.row];
    
    // 2.设置数据
    cell.item = item;
    
    return cell;
}

@end
