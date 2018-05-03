//
//  ViewController.m
//  007_04_UITableView_展示汽车数据(复杂的plist解析)
//
//  Created by 吴佳臻 on 2018/5/3.
//  Copyright © 2018年 wjz. All rights reserved.
//

#import "ViewController.h"
#import "WJZCar.h"
#import "WJZCarGroup.h"

@interface ViewController () <UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

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
    /*
     1. plist解析:
     以后遇到复杂的plist，一层一层的往下解析
     最终的目的就是将所有的字典转成模型
     如果plist中字典在一个数组中，将来转出来的模型也放在一个数组中
     也就是将字典数组转成模型数组
     
     2. plist的好处:
     方便管理数据
     */
    if (!_carGroups) {
        //1.加载字典数组
        NSArray *dictArray = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"cars" ofType:@"plist"]];
        //2.创建模型数组
        NSMutableArray *temp = [NSMutableArray array];
        //3.字典数组->模型数组
        for (NSDictionary *carGroupDict in dictArray) {
            WJZCarGroup *group = [WJZCarGroup carGroupWithDict:carGroupDict];
            [temp addObject:group];
        }
        
        _carGroups = temp;
    }
    return _carGroups;
}


#pragma make - UITableViewDataSource
// @required
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    WJZCarGroup *group = self.carGroups[section];
    return group.cars.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [[UITableViewCell alloc]init];
    
    //设置cell右边的指示样式
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    //取出indexPath.section这组的组模型
    WJZCarGroup *group = self.carGroups[indexPath.section];
    
    //取出indexPath.row对应的车模型
    WJZCar *car = group.cars[indexPath.row];
    
    //设置数据
    cell.textLabel.text = car.name;
    cell.imageView.image = [UIImage imageNamed:car.icon];
    
    return cell;
}
// @optional
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.carGroups.count;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    WJZCarGroup *group = self.carGroups[section];
    return group.header;
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section{
    WJZCarGroup *group = self.carGroups[section];
    return group.footer;
}

@end
