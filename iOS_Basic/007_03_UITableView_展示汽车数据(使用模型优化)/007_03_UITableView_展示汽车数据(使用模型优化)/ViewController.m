//
//  ViewController.m
//  007_02_UITableView_展示汽车数据(简单展示)
//
//  Created by 吴佳臻 on 2018/5/3.
//  Copyright © 2018年 wjz. All rights reserved.
//

#import "ViewController.h"
#import "WJZCarGroup.h"
#import "WJZCar.h"

@interface ViewController () <UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

//所有的车数据
@property(nonatomic,strong)NSArray *carGroups;

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

- (NSArray *)carGroups{
    if (!_carGroups) {
        WJZCarGroup *group0 = [[WJZCarGroup alloc]init];
        group0.header = @"德系品牌";
        group0.footer = @"dxdxdxdxdxdxdxdxdxdxdx";
        group0.cars = @[
                        [WJZCar carWithName:@"奔驰" icon:@"m_2_100"],
                        [WJZCar carWithName:@"宝马" icon:@"m_3_100"]
                        ];
        WJZCarGroup *group1 = [[WJZCarGroup alloc]init];
        group1.header = @"日系品牌";
        group1.footer = @"rxrxrxrxrxrxrxrxrxrxrx";
        group1.cars = @[
                        [WJZCar carWithName:@"丰田" icon:@"m_7_100"],
                        [WJZCar carWithName:@"马自达" icon:@"m_18_100"],
                        [WJZCar carWithName:@"本田" icon:@"m_26_100"]
                        ];
        
        WJZCarGroup *group2 = [[WJZCarGroup alloc]init];
        group2.header = @"天系品牌";
        group2.footer = @"txtxtxtxtxtxtxtxtx";
        group2.cars = @[
                      [WJZCar carWithName:@"比亚迪" icon:@"m_15_100"]
                      ];
        _carGroups = @[group0,group1,group2];
    }
    return _carGroups;
}

#pragma make - UITableViewDataSource

// @required
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
//    if (section == 0) {
//        return 2;
//    }else{
//        return 3;
//    }
    NSLog(@"%s",__func__);
    WJZCarGroup *group = self.carGroups[section];
    return group.cars.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [[UITableViewCell alloc]init];
    
    // 设置cell右边显示的控件
    // accessory附件
    // accessoryView 的优先级 > accessoryType
//    cell.accessoryView = [[UISwitch alloc] init];
    // 设置cell右边为指示样式
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    WJZCarGroup *group = self.carGroups[indexPath.section];
    WJZCar *car = group.cars[indexPath.row];
    
    cell.textLabel.text = car.name;
    cell.imageView.image = [UIImage imageNamed:car.icon];
    
    return cell;
}

// @optional
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    //return 2;
    return self.carGroups.count;
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section{
    WJZCarGroup *group = self.carGroups[section];
    return group.footer;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    WJZCarGroup *group = self.carGroups[section];
    return group.header;
}


@end
