//
//  WJZHallTableViewController.m
//  03_彩票_自定义tabBar_1
//
//  Created by 吴佳臻 on 2018/5/14.
//  Copyright © 2018年 wjz. All rights reserved.
//

#import "WJZHallTableViewController.h"

#import "WJZCover.h"
#import "WJZPopMenu.h"

@interface WJZHallTableViewController () <WJZPopMenuDelegate>

@end

@implementation WJZHallTableViewController

-(void)viewDidAppear:(BOOL)animated{
    
    NSLog(@"viewDidAppear--->%@",NSStringFromCGRect(self.view.frame));
}

- (void)viewDidLoad {
    [super viewDidLoad];
     NSLog(@"%s, line = %d", __FUNCTION__, __LINE__);
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    //在iOS 7之后导航条上的图片，默认被渲染,渲染成蓝色
    //1.设置导航条左侧按钮
    //禁止图片渲染
//    UIImage *image = [UIImage imageNamed:@"CS50_activity_image"];
//    image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];

    //使用分类设置不渲染的图片
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageWithRenderOriginalName:@"CS50_activity_image"] style:UIBarButtonItemStylePlain target:self action:@selector(leftButtonOnClick)];
}

-(void)leftButtonOnClick{
    NSLog(@"%s, line = %d", __FUNCTION__, __LINE__);
    
    
    //    UIAlertView *alert = nil;
    //    [alert show];
    //
    // 1.弹出蒙版.占据整个屏幕,不允许与用户交互
    [WJZCover show];
    
    // 2.popMenu
    // 1.蒙版上
    // 2.窗口上
    WJZPopMenu *popMenu = [WJZPopMenu showInCenter:self.view.center];
    
//    CGRect frame = popMenu.frame;
//    frame.size.width = 10;
//    popMenu.frame = frame;
    
    popMenu.width = 300;
    popMenu.height = 300;
    popMenu.x = 10;
    popMenu.y = 10;
    
    NSLog(@"%@",NSStringFromCGRect(popMenu.frame));
    
    popMenu.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - WJZPopMenuDelegate
-(void)popMenuDidCloseBtn:(WJZPopMenu *)popMenu{
    NSLog(@"%s, line = %d", __FUNCTION__, __LINE__);
    //封装block
    // block 可以保存一段代码,在需要的时候调用
    void(^completion)()=^(){
        // 2.移除蒙版
        // 当动画执行完毕的时候移除蒙版
        [WJZCover hide];
    };
    
    // 隐藏popMenu
    [popMenu hideInCenter:CGPointMake(44, 44) completion:completion];
}

-(void)popMenuAnimCompletion:(WJZPopMenu *)popMenu{
    NSLog(@"%s, line = %d", __FUNCTION__, __LINE__);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return 0;
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

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
