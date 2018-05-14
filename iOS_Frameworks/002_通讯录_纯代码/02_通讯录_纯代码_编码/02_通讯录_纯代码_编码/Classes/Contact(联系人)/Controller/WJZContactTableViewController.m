//
//  WJZContactTableViewController.m
//  02_通讯录_纯代码_编码
//
//  Created by 吴佳臻 on 2018/5/14.
//  Copyright © 2018年 wjz. All rights reserved.
//

#import "WJZContactTableViewController.h"
#import "WJZAddContactViewController.h"
#import "WJZContactItem.h"
#import "WJZEditViewController.h"
@interface WJZContactTableViewController () <WJZAddContactDelegate>
@property(nonatomic,strong)NSMutableArray *dataArray;
@end

@implementation WJZContactTableViewController

-(NSMutableArray *)dataArray{
    if (_dataArray == nil) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = [NSString stringWithFormat:@"%@-的通讯录",self.name];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"注销" style:UIBarButtonItemStyleDone target:self action:@selector(loginOut)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"添加" style:UIBarButtonItemStyleDone target:self action:@selector(addContact)];
    
    //注册通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reloadTable) name:@"reloadData" object:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)dealloc{
    //移除通知
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

-(void)reloadTable{
    //刷新表格
    [self.tableView reloadData];
}

-(void)addContact{
    WJZAddContactViewController *addViewController = [[WJZAddContactViewController alloc] init];
    addViewController.delegate = self;
    [self.navigationController pushViewController:addViewController animated:YES];
}

-(void)addContactViewController:(WJZAddContactViewController *)addContactViewController contactItem:(WJZContactItem *)contactItem{
    //保存数据
    [self.dataArray addObject:contactItem];
    [self.tableView reloadData];
}

-(void)loginOut{
    //弹框提示
    //1.创建控制器
    UIAlertController *alertViewController = [UIAlertController alertControllerWithTitle:@"确定要退出吗" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    //2.创建按钮Action
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"点击了取消");
    }];
    UIAlertAction *destructive = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        [self.navigationController popViewControllerAnimated:YES];
    }];
    //3.添加按钮Action
    [alertViewController addAction:cancel];
    [alertViewController addAction:destructive];
    //4.显示弹框
    [self presentViewController:alertViewController animated:YES completion:nil];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return self.dataArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *ID = @"CELLID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID];
    }
    
    //绑定模型数据
    WJZContactItem *item = self.dataArray[indexPath.row];
    cell.textLabel.text = item.name;
    cell.detailTextLabel.text = item.phone;
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    WJZContactItem *item = self.dataArray[indexPath.row];
    WJZEditViewController *editViewController = [[WJZEditViewController alloc] init];
    editViewController.contactItem = item;
    
    [self.navigationController pushViewController:editViewController animated:YES];
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
