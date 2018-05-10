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

NSString *ID = @"status";
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.tableView.rowHeight = 250;
    [self.tableView registerClass:[WJZStatusCell class] forCellReuseIdentifier:ID];
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
    WJZStatusCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    cell.status = self.statuses[indexPath.row];
    return cell;
}

#pragma mard - 代理方法
//得出方案:在这个方法返回之前就要计算cell的高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    WJZStatus *status = self.statuses[indexPath.row];
    CGFloat space = 10;
    /** 图像 */
    CGFloat iconX = space;
    CGFloat iconY = space;
    CGFloat iconWH = 30;
    CGRect iconImageViewFrame = CGRectMake(iconX, iconY, iconWH, iconWH);
    
    /** 正文 */
    CGFloat textX = iconX;
    CGFloat textY = CGRectGetMaxY(iconImageViewFrame) + space;
    CGFloat textW = [UIScreen mainScreen].bounds.size.width - 2 * space;
    NSDictionary *textAtt = @{NSFontAttributeName : [UIFont systemFontOfSize:14]};
    // 最大宽度是textW,高度不限制
    CGSize textSize = CGSizeMake(textW, MAXFLOAT);
    CGFloat textH = [status.text boundingRectWithSize:textSize options:NSStringDrawingUsesLineFragmentOrigin attributes:textAtt context:nil].size.height;
    CGRect text_LabelFrame = CGRectMake(textX, textY, textW, textH);
    
    CGFloat cellHeight = 0;
    /** 配图 */
    if (status.picture) { // 有配图
        CGFloat pictureWH = 100;
        CGFloat pictureX = iconX;
        CGFloat pictureY = CGRectGetMaxY(text_LabelFrame) + space;
        CGRect pictureImageViewFrame = CGRectMake(pictureX, pictureY, pictureWH, pictureWH);
        cellHeight = CGRectGetMaxY(pictureImageViewFrame) + space;
    } else {
        cellHeight = CGRectGetMaxY(text_LabelFrame) + space;
    }
    
    return cellHeight;
}

@end
