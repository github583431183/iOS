//
//  ViewController.m
//  008_12_自定义不等高的cell-weibo-搭建基本框架
//
//  Created by 吴佳臻 on 2018/5/10.
//  Copyright © 2018年 wjz. All rights reserved.
//

#import "ViewController.h"
#import "WJZStatus.h"
#import "MJExtension.h"
#import "WJZStatusCell.h"
@interface ViewController ()
@property(nonatomic,strong)NSArray *statuses;
@end

@implementation ViewController

//重写statuses的get方法
-(NSArray *)statuses{
    if (!_statuses) {
        _statuses = [WJZStatus mj_objectArrayWithFilename:@"statuses.plist"];
    }
    return _statuses;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //[self.tableView registerClass:[WJZStatusCell class] forCellReuseIdentifier:ID];
    
    //解决Label文字过多不换行问题
    //self-sizing(iOS8 以后才有)
    //告诉tableView所有cell的真实高度是自动计算的(根据设置的约束)
//    self.tableView.rowHeight = UITableViewAutomaticDimension;
//    //设置估算高度
//    self.tableView.estimatedRowHeight = 44;

    
    //iOS8 之前
    //设置估算高度(减少tableView:heightForRowAtIndexPath:的调用次数)
    self.tableView.estimatedRowHeight = 200;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 数据源方法
//@required

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.statuses.count;
}
NSString *ID = @"status";
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
   
    WJZStatusCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    cell.status = self.statuses[indexPath.row];
    return cell;
}
WJZStatusCell *cell;
#pragma mark - 代理方法
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    //创建一个临时的cell
    //目的:传递indexPath对应这行的模型，布局内部所有的子控件，得到cell的高度
    if (cell == nil) {
        cell = [tableView dequeueReusableCellWithIdentifier:ID];
    }
    //传递模型数据
    cell.status = self.statuses[indexPath.row];
    return cell.cellHeight;
}

@end
