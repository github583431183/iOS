//
//  ViewController.m
//  007_05_UITableView_展示单组数组
//
//  Created by 吴佳臻 on 2018/5/3.
//  Copyright © 2018年 wjz. All rights reserved.
//

#import "ViewController.h"
#import "WJZWine.h"

@interface ViewController () <UITableViewDataSource>

@property(nonatomic,strong)NSArray *wineArray;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // 设置tableView每一行cell的高度
    self.tableView.rowHeight = 100;
    //设置tableView每一组的头部高度
    self.tableView.sectionHeaderHeight = 180;
    //设置tableView每一组的尾部高度
    self.tableView.sectionFooterHeight = 180;
    
    //设置分割线的颜色
    self.tableView.separatorColor = [UIColor redColor];
    
    //设置表头控件
    self.tableView.tableHeaderView = [[UISwitch alloc]init];
    
    //设置表尾控件
    self.tableView.tableFooterView = [[UISwitch alloc]init];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSArray *)wineArray{
    if (!_wineArray) {
        NSArray *dictArray = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"wine.plist" ofType:nil]];
        NSMutableArray *temp = [NSMutableArray array];
        for (NSDictionary *wineDict in dictArray) {
            [temp addObject:[WJZWine wineWithDict:wineDict]];
        }
        _wineArray = temp;
    }
    return _wineArray;
}

#pragma mark - UITableViewDataSource

//@required

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.wineArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:nil];
    
    //设置右边显示的指示样式
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    //设置右边显示的指示控件
    cell.accessoryView = [[UISwitch alloc]init];
    //设置选中样式
    //cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
//    //设置cell的背景View
//    //backgroundView的优先级>backgroundColor
//    UIView *bg = [[UIView alloc]init];
//    bg.backgroundColor = [UIColor blueColor];
//    cell.backgroundView = bg;
//    //设置cell的背景颜色
//    cell.backgroundColor = [UIColor redColor];
    
    //设置cell选中时候的背景view
    UIView *selectedBg = [[UIView alloc]init];
    selectedBg.backgroundColor = [UIColor greenColor];
    cell.selectedBackgroundView = selectedBg;
    
    WJZWine *wine = self.wineArray[indexPath.row];
    cell.textLabel.text = wine.name;
    cell.imageView.image = [UIImage imageNamed:wine.image];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"¥%@",wine.money];
    cell.detailTextLabel.textColor = [UIColor orangeColor];
    return cell;
}

//@optional
//如果不实现，默认是1组
//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
//
//}

-(NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section{
    return @"尾部";
}

@end
