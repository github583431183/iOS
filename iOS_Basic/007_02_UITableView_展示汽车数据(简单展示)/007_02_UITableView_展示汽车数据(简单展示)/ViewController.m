//
//  ViewController.m
//  007_02_UITableView_展示汽车数据(简单展示)
//
//  Created by 吴佳臻 on 2018/5/3.
//  Copyright © 2018年 wjz. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma make - UITableViewDataSource

// @required
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 2;
    }else{
        return 3;
    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [[UITableViewCell alloc]init];
    
    // 设置cell右边显示的控件
    // accessory附件
    // accessoryView 的优先级 > accessoryType
//    cell.accessoryView = [[UISwitch alloc] init];
    // 设置cell右边为指示样式
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            cell.textLabel.text = @"奔驰";
            cell.imageView.image = [UIImage imageNamed:@"m_2_100"];
        }else if(indexPath.row == 1){
            cell.textLabel.text = @"宝马";
            cell.imageView.image = [UIImage imageNamed:@"m_3_100"];
        }
    }else if(indexPath.section == 1){
        if(indexPath.row == 0){
            cell.textLabel.text = @"丰田";
            cell.imageView.image = [UIImage imageNamed:@"m_7_100"];
        } else if (indexPath.row == 1) {
            cell.textLabel.text = @"马自达";
            cell.imageView.image = [UIImage imageNamed:@"m_18_100"];
        } else if (indexPath.row == 2) {
            cell.textLabel.text = @"本田";
            cell.imageView.image = [UIImage imageNamed:@"m_26_100"];
        }
    }
    return cell;
}

// @optional
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}


@end
