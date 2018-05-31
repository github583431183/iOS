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
/** 内存缓存 */
@property (nonatomic, strong) NSMutableDictionary *images;
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
-(NSMutableDictionary *)images{
    if (_images == nil) {
        _images = [NSMutableDictionary dictionary];
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
    
    //1.先去查看内存缓存中该图片是否已经存在，如果存在那么就直接拿来使用，否则去检查磁盘缓存
    //2.如果有磁盘缓存，那么就保存一份到内存，设置图片
    //3.否则直接下载
    
    UIImage *image = [self.images objectForKey:appM.icon];
    image=nil;
    if (image) {
        cell.imageView.image = image;
        NSLog(@"%zd处的图片使用了内存缓存中的图片",indexPath.row);
    }else{
        //保存图片到沙盒缓存
        NSString *caches = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
        //获取图片的名称，不能包含 /(文件目录分隔符)
        NSString *fileName = [appM.icon lastPathComponent];
        //t01077fd80ffb5c8740.png 带有后缀名
        NSLog(@"图片名称%@",fileName);
        //拼接图片的全路径
        NSString *fullPath = [caches stringByAppendingPathComponent:fileName];
        
        //检查磁盘缓存
        NSData *imageData = [NSData dataWithContentsOfFile:fullPath];
        
        if (imageData) {
            UIImage *image = [UIImage imageWithData:imageData];
            cell.imageView.image = image;
            
            NSLog(@"%zd处的图片使用了磁盘缓存中的图片",indexPath.row) ;
            //把图片保存到内存缓存
            [self.images setObject:image forKey:appM.icon];
        }else{
            //检查该图片是否正在下载，如果是那么就什么都不做，否则再添加下载任务
            NSBlockOperation *download = [self.operations objectForKey:appM.icon];
            
            if (!download) {
                //占位图
                cell.imageView.image = [UIImage imageNamed:@"ic_launcher_round"];
                download = [NSBlockOperation blockOperationWithBlock:^{
                    NSURL *url = [NSURL URLWithString:appM.icon];
                    NSData *imageData = [NSData dataWithContentsOfURL:url];
                    UIImage *image = [UIImage imageWithData:imageData];
                    
                    NSLog(@"%zd--下载---",indexPath.row);

                    //容错处理，下载失败可重新下载
                    if (image == nil) {
                        [self.operations removeObjectForKey:appM.icon];
                        return ;
                    }
                    
                    //演示网速慢的情况
                    [NSThread sleepForTimeInterval:3.0];
                    
                    //把图片保存到内存缓存
                    [self.images setObject:image forKey:appM.icon];
                    
                    //线程间通信
                    [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                        //刷新当前行
                        [self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
                    }];
                    
                    //写数据到沙盒 atomically原子的
                    [imageData writeToFile:fullPath atomically:YES];
                    
                    //移除图片下载操作的索引
                    [self.operations removeObjectForKey:appM.icon];
                }];
                
                //添加操作到缓存中
                [self.operations setObject:download forKey:appM.icon];
                
                //添加操作到队列中
                [self.queue addOperation:download];
            }
            
        }
        
    }
    
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
