//
//  ViewController.m
//  009_04_数据刷新01-全局刷新
//
//  Created by 吴佳臻 on 2018/5/11.
//  Copyright © 2018年 wjz. All rights reserved.
//

#import "ViewController.h"
#import "WJZWine.h"
#import "WJZWineCell.h"
#import "MJExtension.h"
@interface ViewController ()
@property(nonatomic,strong)NSMutableArray *wineArray;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@end

@implementation ViewController

-(NSMutableArray *)wineArray{
    if (!_wineArray) {
        _wineArray = [WJZWine mj_objectArrayWithFilename:@"wine.plist"];
    }
    return _wineArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 按钮的点击

- (IBAction)add:(UIButton *)sender {
    //修改模型
    WJZWine *wine = [[WJZWine alloc]init];
    wine.image = @"newWine";
    wine.money = @"55.5";
    wine.name = @"女儿红";
    //添加到最后
    [self.wineArray addObject:wine];
    //添加在第一
    [self.wineArray insertObject:wine atIndex:0];
    //告诉tableView数据变了，赶紧刷新(全局刷新)
    [self.tableView reloadData];
}

- (IBAction)remove:(id)sender {
    [self.wineArray removeObjectAtIndex:0];
    [self.tableView reloadData];
}

- (IBAction)update:(id)sender {
    WJZWine *wine = self.wineArray[0];
    wine.money = @"100";
    [self.tableView reloadData];
}
#pragma mark - UITableViewDataSource
//@required

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.wineArray.count;
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *ID = @"wine";
    WJZWineCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[WJZWineCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    cell.wine = self.wineArray[indexPath.row];
    return cell;
}



@end
