//
//  ViewController.m
//  112-掌握-多图下载综合案例-数据展示
//
//  Created by 吴佳臻 on 2018/5/30.
//  Copyright © 2018年 wjz. All rights reserved.
//

#import "ViewController.h"
#import "WJZAPP.h"
@interface ViewController ()
/** tableView的数据源 */
@property (nonatomic, strong) NSArray *apps;
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

#pragma mark ------
#pragma mark lazy loading
-(NSArray *)apps{
    if (_apps == nil) {
        //字典数组
        NSArray *arrayM = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"apps.plist" ofType:nil]];
        //字典数组-->模型数组
        NSMutableArray *arrM = [NSMutableArray array];
        for (NSDictionary *dict in arrayM) {
            [arrM addObject:[WJZAPP appWithDict:dict]];
        }
        _apps = arrM;
    }
    return _apps;
}
#pragma mark -----
#pragma mark UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.apps.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *ID = @"app";
    //1.创建cell
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    //2.设置cell的数据
    //2.1拿到该行cell对应的数据
    WJZAPP *appM = self.apps[indexPath.row];
    //2.2设置标题
    cell.textLabel.text = appM.name;
    //2.3设置子标题
    cell.detailTextLabel.text = appM.download;
    //2.4设置图标
    NSURL *url = [NSURL URLWithString:appM.icon];
    NSData *imageData = [NSData dataWithContentsOfURL:url];
    UIImage *image = [UIImage imageWithData:imageData];
    cell.imageView.image = image;
    NSLog(@"%zd-----",indexPath.row);
    //3.返回cell
    return cell;
    //1.UI很不流畅 --- > 开子线程下载图片
    //2.图片重复下载 ---> 先把之前已经下载的图片保存起来(字典)
}

@end
