//
//  ViewController.m
//  008_01_索引条
//
//  Created by 吴佳臻 on 2018/5/7.
//  Copyright © 2018年 wjz. All rights reserved.
//

#import "ViewController.h"
#import "WJZCar.h"
#import "WJZCarGroup.h"
#import "MJExtension.h"

@interface ViewController ()
@property(nonatomic,strong)NSArray *carsGroups;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //设置索引条的文字颜色
    self.tableView.sectionIndexColor = [UIColor redColor];
    //设置索引条的背景颜色
    self.tableView.sectionIndexBackgroundColor = [UIColor yellowColor];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/**
 隐藏状态栏
 */
-(BOOL)prefersStatusBarHidden{
    return YES;
}

-(NSArray *)carsGroups{
    if (!_carsGroups) {
//        //1.加载字典数组
//        NSArray *dictArray = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"cars.plist" ofType:nil]];
//        //2.字典数组->模型数组
//        NSMutableArray *temp = [NSMutableArray array];
//        for (NSDictionary *carGroupDict in dictArray) {
//            [temp addObject:[WJZCarGroup carGroupsWithDict:carGroupDict]];
//        }
        //告诉
        [WJZCarGroup mj_setupObjectClassInArray:^NSDictionary *{
            return @{@"cars":[WJZCar class]};
        }];
        _carsGroups = [WJZCarGroup mj_objectArrayWithFilename:@"cars.plist"];
    }
    return _carsGroups;
}

#pragma mark - 数据源方法
//@required

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    WJZCarGroup *group = self.carsGroups[section];
    return group.cars.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //1.访问缓存池
    static NSString *ID = @"car";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    //2.缓存池没有，自己创建
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    //3.设置数据
    WJZCarGroup *group = self.carsGroups[indexPath.section];
    WJZCar *car = group.cars[indexPath.row];
    cell.imageView.image = [UIImage imageNamed:car.icon];
    cell.textLabel.text = car.name;
    return cell;
}

//@optional
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.carsGroups.count;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    WJZCarGroup *group = self.carsGroups[section];
    return group.title;
}

/**
 返回索引条的文字
 */
-(NSArray<NSString *> *)sectionIndexTitlesForTableView:(UITableView *)tableView{
//    NSMutableArray *titles = [NSMutableArray array];
//    for (WJZCarGroup *group in self.carsGroups) {
//        [titles addObject:group.title];
//    }
//    return titles;
    //抽取self.carGroups这个数组中每一个元素(WJZCarGroup对象)的title属性的值，放在一个新的数组中返回
    return [self.carsGroups valueForKeyPath:@"title"];
}
@end
