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
/** 记录用户选中行的索引 */
@property (nonatomic, strong) NSMutableArray *seletedIndexPath;
@end

@implementation ViewController

- (NSMutableArray *)seletedIndexPath
{
    if (!_seletedIndexPath) {
        _seletedIndexPath = [NSMutableArray array];
    }
    return _seletedIndexPath;
}

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


- (IBAction)remove:(id)sender {
//    //获取要删除的酒模型
//    NSMutableArray *deletedWine = [NSMutableArray array];
//    for (WJZWine *wine in self.wineArray) {
//        if (wine.isCheched) {
//            [deletedWine addObject:wine];
//        }
//    }
//    // 修改模型
//    [self.wineArray removeObjectsInArray:deletedWine];
//    // 刷新表格
//    [self.tableView reloadData];
    
    //优化,使用集合记录用户选择记录，然后局部刷新
    // 获取要删除的酒模型
    NSMutableArray *deletedWine = [NSMutableArray array];
    for (NSIndexPath *indexPath in self.seletedIndexPath) {
        [deletedWine addObject:self.wineArray[indexPath.row]];
    }
    
    // 删除模型
    [self.wineArray removeObjectsInArray:deletedWine];
    
    // 刷新表格
    [self.tableView deleteRowsAtIndexPaths:self.seletedIndexPath withRowAnimation:UITableViewRowAnimationAutomatic];
    // 清空数组
    [self.seletedIndexPath removeAllObjects];
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

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 修改模型
    WJZWine *wine = self.wineArray[indexPath.row];
    if (wine.isCheched) { // 之前是打钩的,取消打钩
        wine.checked = NO;
        [self.seletedIndexPath removeObject:indexPath];
    } else { // 之前不是打钩的,现在打钩
        wine.checked = YES;
        [self.seletedIndexPath addObject:indexPath];
    }
    
    // 刷新表格
    [self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}
@end
