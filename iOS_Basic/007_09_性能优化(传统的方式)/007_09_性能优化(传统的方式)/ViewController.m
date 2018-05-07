//
//  ViewController.m
//  007_09_性能优化(传统的方式)
//
//  Created by 吴佳臻 on 2018/5/7.
//  Copyright © 2018年 wjz. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.rowHeight = 100;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

# pragma mark - 数据源方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 200;
}

/**
 每当一个cell进入视野范围内就会调用1次
 */
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //1.去缓存池中取是否有可循环利用的cell
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"A"];
    //2.如火缓存池没有可循环利用的cell，自己创建
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"A"];
    }
    //3.设置数据
    cell.textLabel.text = [NSString stringWithFormat:@"第%ld行数据",indexPath.row];
    
    return cell;
}

@end
