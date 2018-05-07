//
//  ViewController.m
//  007_05_UITableView_展示单组数组
//
//  Created by 吴佳臻 on 2018/5/3.
//  Copyright © 2018年 wjz. All rights reserved.
//

#import "ViewController.h"
#import "WJZWine.h"

@interface ViewController () <UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,strong)NSArray *wineArray;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.tableView.delegate = self;
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

#pragma mark - UITableViewDelegate
/**
 选中某一行cell就调用这个方法
 */
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"选中了:%ld",indexPath.row);
}

/**
 取消选中了某一行cell就会调用这个方法
 */
- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"取消选中了:%ld",indexPath.row);
}

/**
 返回每一组显示的头部控件
 */
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return [UIButton buttonWithType:UIButtonTypeContactAdd];
}

/**
 返回每一组显示的尾部空间
 */
//-(NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section{
//
//}

/**
 返回每一组的头部高度
 */
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 100;
}

/**
 返回每一组的尾部高度
 */
//-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
//
//}

/**
 返回每一行cell的高度
 */
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row % 2 == 0) {
        return 100;
    }else{
        return 50;
    }
}
@end
