//
//  WJZSettingTableViewController.m
//  35-设置界面普通方式搭建
//
//  Created by 吴佳臻 on 2018/5/22.
//  Copyright © 2018年 wjz. All rights reserved.
//

#import "WJZSettingTableViewController.h"
#import "WJZSettingItem.h"
#import "WJZSettingGroup.h"
#import "WJZSettingArrowItem.h"
#import "WJZSettingSwitchItem.h"
@interface WJZSettingTableViewController ()
/** 行模型数组 */
//@property (nonatomic, strong) NSMutableArray *items;

/** 数组总数 */
@property (nonatomic, strong) NSMutableArray *groups;


@end

@implementation WJZSettingTableViewController

- (NSMutableArray *)groups{
    if (!_groups) {
        _groups = [NSMutableArray array];
    }
    return _groups;
}
//- (NSMutableArray *)items{
//    if (!_items) {
//        _items = [NSMutableArray array];
//    }
//    return _items;
//}

-(instancetype)init{
    return [super initWithStyle:UITableViewStyleGrouped];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    // 第0组
    [self setupGrup0];
    
    // 第2组
    [self setupGrup2];
    
    // 第1组
    [self setupGrup1];
    

}

// 第0组
- (void)setupGrup0{
    // 创建行模型
    NSMutableArray *items1 = [NSMutableArray array];
    
    WJZSettingItem *item = [WJZSettingArrowItem itemWithIcon:[UIImage imageNamed:@"RedeemCode"] title:@"使用税换码"];
    //    [self.items addObject:item];
    //item.type = WJZSettingItemRightViewStateArrow;
    [items1 addObject:item];
    
    // 创建组模型
    WJZSettingGroup *group = [WJZSettingGroup gruopWithItems:items1];
    group.headerTitle = @"123";
    //    group.footTitle = @"123";
    
    // 将行模型数组添加到数组总数
    [self.groups addObject:group];
}

// 第1组
- (void)setupGrup1{
    // 创建行模型
    //    NSMutableArray *items1 = [NSMutableArray array];
    WJZSettingItem *item11 = [WJZSettingArrowItem itemWithIcon:[UIImage imageNamed:@"RedeemCode"] title:@"推送和提醒"];
    //    [self.items addObject:item11];
    //item11.type = WJZSettingItemRightViewStateArrow;
    
    WJZSettingItem *item12 = [WJZSettingSwitchItem itemWithIcon:[UIImage imageNamed:@"RedeemCode"] title:@"使用税换码"];
    //    [self.items addObject:item12];
    //item12.type = WJZSettingItemRightViewStateSwitch;
    
    WJZSettingItem *item13 = [WJZSettingSwitchItem itemWithIcon:[UIImage imageNamed:@"RedeemCode"] title:@"使用税换码"];
    //    [self.items addObject:item13];
    //item13.type = WJZSettingItemRightViewStateSwitch;
    
    WJZSettingItem *item14 = [WJZSettingArrowItem itemWithIcon:[UIImage imageNamed:@"RedeemCode"] title:@"使用税换码"];
    //    [self.items addObject:item14];
    //item14.type = WJZSettingItemRightViewStateArrow;
    
    NSArray *items2 = @[item11, item12, item13, item14];
    
    // 创建组模型
    WJZSettingGroup *group = [WJZSettingGroup gruopWithItems:items2];
    group.headerTitle = @"abc";
    group.footTitle = @"abc";
    
    // 将行模型数组添加到数组总数
    [self.groups addObject:group];
}
// 第2组
- (void)setupGrup2{
    // 创建行模型
    WJZSettingItem *item21 = [WJZSettingItem itemWithIcon:[UIImage imageNamed:@"RedeemCode"] title:@"检查版本更新"];
    //    [self.items addObject:item21];
    
    WJZSettingItem *item22 = [WJZSettingItem itemWithIcon:[UIImage imageNamed:@"RedeemCode"] title:@"使用税换码"];
    //    [self.items addObject:item22];
    
    WJZSettingItem *item23 = [WJZSettingItem itemWithIcon:[UIImage imageNamed:@"RedeemCode"] title:@"使用税换码"];
    //    [self.items addObject:item23];
    
    WJZSettingItem *item24 = [WJZSettingItem itemWithIcon:[UIImage imageNamed:@"RedeemCode"] title:@"使用税换码"];
    //    [self.items addObject:item24];
    NSArray *items3 = @[item21, item22, item23, item24];
    
    // 创建组模型
    WJZSettingGroup *group = [WJZSettingGroup gruopWithItems:items3];
    group.headerTitle = @"abc123";
    group.footTitle = @"abc123";
    
    // 将行模型数组添加到数组总数
    [self.groups addObject:group];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return self.groups.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    
//    if (section == 0) {
//        //第一组
//        return 1;
//    }else{
//        return 4;
//    }
    
    // 1.取出行模型数组
    //NSArray *items = self.groups[section];
    
    WJZSettingGroup *group =  self.groups[section];
    
    return group.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    static NSString *ID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        NSLog(@"%s, line = %d", __FUNCTION__, __LINE__);
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    
    //model数据和view绑定在一起
//    if (indexPath.section == 0) {
//        if (indexPath.row == 0) {
//            // 第一行
//            cell.imageView.image = [UIImage imageNamed:@"RedeemCode"];
//            cell.textLabel.text = @"使用兑换码";
//        }
//    }else if (indexPath.section == 1){
//        // 第1组
//        if (indexPath.row == 0) {
//            // 第一行
//            cell.imageView.image = [UIImage imageNamed:@"RedeemCode"];
//            cell.textLabel.text = @"推送和提醒";
//        }else if (indexPath.row == 1) {
//            // 第一行
//            cell.imageView.image = [UIImage imageNamed:@"RedeemCode"];
//            cell.textLabel.text = @"使用兑换码";
//        }else if (indexPath.row == 2) {
//            // 第一行
//            cell.imageView.image = [UIImage imageNamed:@"RedeemCode"];
//            cell.textLabel.text = @"使用兑换码";
//        }else if (indexPath.row == 3) {
//            // 第一行
//            cell.imageView.image = [UIImage imageNamed:@"RedeemCode"];
//            cell.textLabel.text = @"使用兑换码";
//        }
//    }else if (indexPath.section == 2){
//        // 第二组
//        if (indexPath.row == 0) {
//            // 第一行
//            cell.imageView.image = [UIImage imageNamed:@"RedeemCode"];
//            cell.textLabel.text = @"检查新版本";
//        }else if (indexPath.row == 1) {
//            // 第一行
//            cell.imageView.image = [UIImage imageNamed:@"RedeemCode"];
//            cell.textLabel.text = @"使用兑换码";
//        }else if (indexPath.row == 2) {
//            // 第一行
//            cell.imageView.image = [UIImage imageNamed:@"RedeemCode"];
//            cell.textLabel.text = @"使用兑换码";
//        }else if (indexPath.row == 3) {
//            // 第一行
//            cell.imageView.image = [UIImage imageNamed:@"RedeemCode"];
//            cell.textLabel.text = @"使用兑换码";
//        }
//    }
    
    // 设置数据
    // 0.取出行模型数组
    WJZSettingGroup *group = self.groups[indexPath.section];
    
    // 1.取出行模型
    WJZSettingItem *item = group.items[indexPath.row];
    // 2.设置数据
    cell.imageView.image = item.icon;
    cell.textLabel.text = item.title;
    
    //3.设置右侧视图
//    if (item.type == WJZSettingItemRightViewStateArrow) {
//        //右侧视图箭头
//        cell.accessoryView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"arrow_right"]];
//    }else if(item.type == WJZSettingItemRightViewStateSwitch){
//         //右侧视图是开关
//        UISwitch *sw = [[UISwitch alloc] init];
//        //sw.on = item.isOn;
//
//        cell.accessoryView = sw;
//
//        //        if (indexPath.section == 1 && indexPath.row == 1) {
//        //            sw.on = YES;
//        //        }
//
//    }else{
//         cell.accessoryView = nil;
//    }
    if ([item isKindOfClass:[WJZSettingArrowItem class]]) {
        // 右侧视图是箭头
        cell.accessoryView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"arrow_right"]];
    }else if ([item isKindOfClass:[WJZSettingSwitchItem class]]){
        WJZSettingSwitchItem *swItem = (WJZSettingSwitchItem *)item;
        // 右侧视图是开关
        UISwitch *sw = [[UISwitch alloc] init];
        sw.on = swItem.isOn;
        cell.accessoryView = sw;
    }else{
        cell.accessoryView = nil;
    }
    
    return cell;
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    // 1.取出组模型
    WJZSettingGroup *group = self.groups[section];
    return group.headerTitle;
}
- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section{
    // 1.取出组模型
    WJZSettingGroup *group = self.groups[section];
    return group.footTitle;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
