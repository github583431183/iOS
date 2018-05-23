//
//  WJZBaseTableViewController.m
//  43-封装基类,比分直播,cell键盘处理
//
//  Created by 吴佳臻 on 2018/5/23.
//  Copyright © 2018年 wjz. All rights reserved.
//

#import "WJZBaseTableViewController.h"

@interface WJZBaseTableViewController ()

@end

@implementation WJZBaseTableViewController
- (NSMutableArray *)groups{
    if (!_groups) {
        _groups = [NSMutableArray array];
    }
    return _groups;
}
- (instancetype)init{
    return [super initWithStyle:UITableViewStyleGrouped];
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
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
    // 1.取出行模型数组
    //    NSArray *items = self.groups[section];
    WJZSettingGroup *group =  self.groups[section];
    return group.items.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
   
    
    // 1.创建cell
    WJZSettingTableViewCell *cell  = [WJZSettingTableViewCell cellWithTableView:tableView];
    
    // 设置数据
    // 0.取出行模型数组
    WJZSettingGroup *group = self.groups[indexPath.section];
    
    // 1.取出行模型
    WJZSettingItem *item =  group.items[indexPath.row];
    
    // 2.设置数据
    cell.item = item;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    // 取消选中状态
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    
    // 1.取出组模型
    WJZSettingGroup *group =  self.groups[indexPath.section];
    // 2.取出行模型
    WJZSettingItem *item =  group.items[indexPath.row];
    
    // 做事情和跳转只能做一件
    if (item.operationBlock) {
        item.operationBlock(indexPath);
        
    }else if ([item isKindOfClass:[WJZSettingArrowItem class]]) {
        // 只有箭头模型才具备跳转
        // 跳转
        WJZSettingArrowItem *arrowItem = (WJZSettingArrowItem *)item;
        if (arrowItem.desVC) {
            // 如果有目标控制器才跳转
            UIViewController *vc =  [[arrowItem.desVC alloc] init];
            vc.navigationItem.title = item.title;
            //            vc.title = @"";
            
            [self.navigationController pushViewController:vc animated:YES];
        }
    }
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
