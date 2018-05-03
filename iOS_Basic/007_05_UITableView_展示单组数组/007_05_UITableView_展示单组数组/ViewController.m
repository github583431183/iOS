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

@end
