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
    //self-sizing(iOS8 以后)
    //告诉tableView所有cell的真实高度是自动计算的(根据设置的约束)
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    //设置估算高度
    self.tableView.estimatedRowHeight = 44;
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

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *ID = @"status";
    WJZStatusCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    cell.status = self.statuses[indexPath.row];
    return cell;
}

@end
