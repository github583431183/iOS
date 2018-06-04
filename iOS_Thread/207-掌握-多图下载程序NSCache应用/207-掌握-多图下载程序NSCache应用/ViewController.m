//
//  ViewController.m
//  112-掌握-多图下载综合案例-数据展示
//
//  Created by 吴佳臻 on 2018/5/30.
//  Copyright © 2018年 wjz. All rights reserved.
//

#import "ViewController.h"
#import "WJZAPP.h"
#import "UIImageView+WebCache.h"

@interface ViewController ()
/** tableView的数据源 */
@property (nonatomic, strong) NSArray *apps;
/** 内存缓存 */
@property (nonatomic, strong) NSCache *images;
/** 队列 */
@property (nonatomic, strong) NSOperationQueue *queue;
/** 操作缓存 */
@property (nonatomic, strong) NSMutableDictionary *operations;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
    //移除图片内存缓存
    [self.images removeAllObjects];
    
    //取消队列中所有的操作
    [self.queue cancelAllOperations];
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
-(NSOperationQueue *)queue{
    
    if (_queue == nil) {
        _queue = [[NSOperationQueue alloc] init];
        //设置最大并发数
        _queue.maxConcurrentOperationCount = 5;
    }
    
    return _queue;
}
-(NSCache *)images{
    if (_images == nil) {
        _images = [[NSCache alloc] init];
        //设置最多可以缓存多少个数据
        _images.countLimit = 4;
    }
    return _images;
}
-(NSMutableDictionary *)operations{
    if (_operations == nil) {
        _operations = [NSMutableDictionary dictionary];
    }
    return _operations;
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
    
    /*
     第一个参数:下载图片的url地址
     第二个参数:占位图片
     */
    //[cell.imageView sd_setImageWithURL:[NSURL URLWithString:appM.icon] placeholderImage:[UIImage imageNamed:@"ic_launcher_round"]];
    
    
    /*
     第一个参数:下载图片的url地址
     第二个参数:占位图片
     第三个参数:缓存模式
     第四个参数:progress 进度回调
     receivedSize:已经下载的数据大小
     expectedSize:要下载图片的总大小
     第五个参数
     image:要下载的图片
     error:错误信息
     cacheType:缓存类型
     imageURL:图片url
    [cell.imageView sd_setImageWithURL:<#(NSURL *)#> placeholderImage:<#(UIImage *)#> options:<#(SDWebImageOptions)#> progress:<#^(NSInteger receivedSize, NSInteger expectedSize)progressBlock#> completed:<#^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL)completedBlock#>]
    */
    
    [cell.imageView sd_setImageWithURL:[NSURL URLWithString:appM.icon] placeholderImage:[UIImage imageNamed:@"ic_launcher_round"] options:SDWebImageRetryFailed progress:^(NSInteger receivedSize, NSInteger expectedSize) {
        NSLog(@"%f",1.0*receivedSize/expectedSize);
    } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        NSLog(@"%zd",cacheType);
    }];
    
    //3.返回cell
    return cell;
    //1.UI很不流畅 --- > 开子线程下载图片
    //2.图片重复下载 ---> 先把之前已经下载的图片保存起来(字典) \
        内存缓存--->磁盘缓存(沙盒)
    /*
     磁盘缓存(沙盒)
     Documents:会备份,不允许
     Libray
     Preferences:偏好设置 保存账号
     caches:缓存文件
     tmp:临时路径(随时会被删除)
     */
    //3.图片不会刷新--->刷新某行
    //4.图片重复下载(图片下载需要时间,当图片还未完全下载之前,又要重新显示该图片)
    //5.数据错乱 ---设置占位图片
}

@end
