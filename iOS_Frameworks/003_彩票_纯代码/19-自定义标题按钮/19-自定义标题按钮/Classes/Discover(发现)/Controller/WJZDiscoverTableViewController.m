//
//  WJZDiscoverTableViewController.m
//  03_彩票_自定义tabBar_1
//
//  Created by 吴佳臻 on 2018/5/14.
//  Copyright © 2018年 wjz. All rights reserved.
//

#import "WJZDiscoverTableViewController.h"

@interface WJZDiscoverTableViewController ()

@end

@implementation WJZDiscoverTableViewController

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

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    //刷新tableView
    [self.tableView reloadData];
}

/**
 当cell将要显示的时候调用
 */
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    //当cell将要显示的时候做动画从右向左的动画
    
    //1.将cell平移到屏幕外
    cell.transform = CGAffineTransformMakeTranslation(self.view.width, 0);
    
    //2.让cell复位
    [UIView animateWithDuration:0.5 animations:^{
        cell.transform = CGAffineTransformIdentity;
    }];
}

@end
