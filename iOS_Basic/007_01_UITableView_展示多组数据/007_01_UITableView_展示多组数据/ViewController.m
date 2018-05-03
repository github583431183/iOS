//
//  ViewController.m
//  007_01_UITableView_展示多组数据
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
    //设置数据源
    self.tableView.dataSource = self;
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSource
/**
 告诉tableView一共有多少组数据
 */
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 4;
}

/**
 告诉tableView第section组有多少行
 */
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 2;
    }else if(section == 1){
        return 6;
    }else if(section ==2){
        return 6;
    }else{
        return 1;
    }
}

/**
 告诉tableView每一行显示的内容
 tableView每一行都是UITableViewCell或者它的子类
 */
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [[UITableViewCell alloc]init];
    if (indexPath.section == 0) {
        //第0组
        if (indexPath.row == 0) {
            //第0组 第0行
            cell.textLabel.text = @"通用";
        }else if(indexPath.row == 1){
            // 第0组 第1行
            cell.textLabel.text = @"隐私";
        }else{}
    }else{
        cell.textLabel.text =
        [NSString stringWithFormat:@"%ld组%zd行-其他数据",indexPath.section,indexPath.row];
    }
    return cell;
}

@end
