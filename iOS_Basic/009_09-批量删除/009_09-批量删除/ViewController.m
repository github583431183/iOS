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
@property (weak, nonatomic) IBOutlet UIButton *deleteButton;
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
    
    //告诉tableView在编辑模式下可以多选
    self.tableView.allowsMultipleSelectionDuringEditing = YES;
    self.deleteButton.hidden = YES;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 按钮的点击

- (IBAction)choose:(UIButton *)sender {
    //进入编辑模式
    [self.tableView setEditing:!self.tableView.isEditing animated:YES];
    self.deleteButton.hidden = !self.tableView.isEditing;
}

- (IBAction)remove:(id)sender {
    // 千万不要 遍历删除 ,因为每删除一个元素,其他元素的 索引 可能会发生变化
    NSMutableArray *deleteWine = [NSMutableArray array];
    for (NSIndexPath *indexPath in self.tableView.indexPathsForSelectedRows) {
        [deleteWine addObject:self.wineArray[indexPath.row]];
    }
    //修改模型
    [self.wineArray removeObjectsInArray:deleteWine];
    
    //刷新表格
    //全部刷新
    //[self.tableView reloadData];
    //局部刷新
    // self.tableView.indexPathsForSelectedRows 用户所选的条目
    [self.tableView deleteRowsAtIndexPaths:self.tableView.indexPathsForSelectedRows withRowAnimation:UITableViewRowAnimationAutomatic];
}

#pragma mark - UITableViewDataSource
//@required

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.wineArray.count;
}

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
