//
//  ViewController.m
//  008_02_自定义等高的cell-纯代码-frame01-添加子控件
//
//  Created by 吴佳臻 on 2018/5/7.
//  Copyright © 2018年 wjz. All rights reserved.
//

#import "ViewController.h"
#import "WJZTableViewCell.h"

@interface ViewController ()

@end

@implementation ViewController

NSString *ID = @"tg";

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.rowHeight = 70;
    
    // Do any additional setup after loading the view, typically from a nib.
    [self.tableView registerClass:[WJZTableViewCell class] forCellReuseIdentifier:ID];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 数据源方法
//@required

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    WJZTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    return cell;
}

//@optional


@end
