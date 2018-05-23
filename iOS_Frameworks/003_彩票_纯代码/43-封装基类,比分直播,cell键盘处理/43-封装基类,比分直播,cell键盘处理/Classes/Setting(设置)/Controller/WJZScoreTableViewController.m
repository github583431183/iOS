//
//  WJZScoreTableViewController.m
//  43-封装基类,比分直播,cell键盘处理
//
//  Created by 吴佳臻 on 2018/5/23.
//  Copyright © 2018年 wjz. All rights reserved.
//

#import "WJZScoreTableViewController.h"

@interface WJZScoreTableViewController ()

@end

@implementation WJZScoreTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;

    [self setupGruop0];
    
    [self setupGruop1];
    
    [self setupGruop2];
    
    [self setupGruop2];
    
    [self setupGruop2];
    
    [self setupGruop2];
    
    [self setupGruop2];
}

// 第0组
- (void)setupGruop0{
    WJZSettingSwitchItem *item = [WJZSettingSwitchItem itemWithTitle:@"关注比赛"];
    WJZSettingGroup *group = [WJZSettingGroup gruopWithItems:@[item]];
    [self.groups addObject:group];
    
    
}
// 第1组
- (void)setupGruop1{
    WJZSettingItem *item = [WJZSettingItem itemWithTitle:@"起始时间"];
    item.subTitle = @"00:00";
    
    WJZSettingGroup *group = [WJZSettingGroup gruopWithItems:@[item]];
    [self.groups addObject:group];
    
}
// 第2组
- (void)setupGruop2{
    WJZSettingItem *item = [WJZSettingItem itemWithTitle:@"结束时间"];
    item.subTitle = @"24:61";
    
    //    __weak typeof(self) weakSelf = self;
    __unsafe_unretained typeof(self) weakSelf = self;
    
    // 在iOS7以后只要把textField 添加到cell上,键盘处理操作系统帮我们做好
    item.operationBlock =^(NSIndexPath *indexPath){
        
        UITableViewCell *cell =  [weakSelf.tableView cellForRowAtIndexPath:indexPath];
        
        UITextField *textField = [[UITextField alloc] init];
        [cell addSubview:textField];
        
        [textField becomeFirstResponder];
        
    };
    
    
    WJZSettingGroup *group = [WJZSettingGroup gruopWithItems:@[item]];
    [self.groups addObject:group];
    
}
// 当scrollView 开始滑动的时候调用
- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView{
    [self.view endEditing:YES];
    
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

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
