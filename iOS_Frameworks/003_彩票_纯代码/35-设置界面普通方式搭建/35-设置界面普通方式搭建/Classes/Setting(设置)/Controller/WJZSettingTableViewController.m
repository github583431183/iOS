//
//  WJZSettingTableViewController.m
//  35-设置界面普通方式搭建
//
//  Created by 吴佳臻 on 2018/5/22.
//  Copyright © 2018年 wjz. All rights reserved.
//

#import "WJZSettingTableViewController.h"

@interface WJZSettingTableViewController ()

@end

@implementation WJZSettingTableViewController

-(instancetype)init{
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
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    
    if (section == 0) {
        //第一组
        return 1;
    }else{
        return 4;
    }
    
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    static NSString *ID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        NSLog(@"%s, line = %d", __FUNCTION__, __LINE__);
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    
    //model数据和view绑定在一起
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            // 第一行
            cell.imageView.image = [UIImage imageNamed:@"RedeemCode"];
            cell.textLabel.text = @"使用兑换码";
        }
    }else if (indexPath.section == 1){
        // 第1组
        if (indexPath.row == 0) {
            // 第一行
            cell.imageView.image = [UIImage imageNamed:@"RedeemCode"];
            cell.textLabel.text = @"推送和提醒";
        }else if (indexPath.row == 1) {
            // 第一行
            cell.imageView.image = [UIImage imageNamed:@"RedeemCode"];
            cell.textLabel.text = @"使用兑换码";
        }else if (indexPath.row == 2) {
            // 第一行
            cell.imageView.image = [UIImage imageNamed:@"RedeemCode"];
            cell.textLabel.text = @"使用兑换码";
        }else if (indexPath.row == 3) {
            // 第一行
            cell.imageView.image = [UIImage imageNamed:@"RedeemCode"];
            cell.textLabel.text = @"使用兑换码";
        }
    }else if (indexPath.section == 2){
        // 第二组
        if (indexPath.row == 0) {
            // 第一行
            cell.imageView.image = [UIImage imageNamed:@"RedeemCode"];
            cell.textLabel.text = @"检查新版本";
        }else if (indexPath.row == 1) {
            // 第一行
            cell.imageView.image = [UIImage imageNamed:@"RedeemCode"];
            cell.textLabel.text = @"使用兑换码";
        }else if (indexPath.row == 2) {
            // 第一行
            cell.imageView.image = [UIImage imageNamed:@"RedeemCode"];
            cell.textLabel.text = @"使用兑换码";
        }else if (indexPath.row == 3) {
            // 第一行
            cell.imageView.image = [UIImage imageNamed:@"RedeemCode"];
            cell.textLabel.text = @"使用兑换码";
        }
    }
    
    
    return cell;
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
