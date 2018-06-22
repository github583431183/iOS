//
//  ViewController.m
//  402-掌握-复杂JSON解析-数据展示
//
//  Created by 吴佳臻 on 2018/6/21.
//  Copyright © 2018年 wjz. All rights reserved.
//

#import "ViewController.h"
#import "UIImageView+WebCache.h"
#import <MediaPlayer/MediaPlayer.h>

#define baseUrlStr @"http://120.25.226.186:32812"
@interface ViewController ()

@property(nonatomic,strong)NSArray *videos;
@end

@implementation ViewController

-(void)viewDidLoad{
    [super viewDidLoad];
    //1.url
    NSURL *url = [NSURL URLWithString:[baseUrlStr stringByAppendingPathComponent:@"video?type=JSON"]];
    NSLog(@"-- %@",url);
    //2.创建请求对象
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    //3.发送异步请求
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
        if(connectionError){
            return ;
        }
        //4.解析数据
        NSDictionary *dictM = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:0];
        //复杂JSON 1)在线格式化 2)write
        //http://tool.oschina.net/codeformat/json
        //[dictM writeToFile:@"video.plist" atomically:YES];
        NSLog(@"%@",dictM);
        self.videos = dictM[@"videos"];
        //5.更新UI
        [self.tableView reloadData];
    }];
}

#pragma mark UITableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.videos.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //1.创建cell
    static NSString *ID = @"video";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    //2.设置cell
    //2.1拿到该cell对应的数据
    NSDictionary *dictM = self.videos[indexPath.row];
    //2.2设置标题
    cell.textLabel.text = dictM[@"name"];
    //2.3设置子标题
    cell.detailTextLabel.text = [NSString stringWithFormat:@"播放时间%@",dictM[@"length"]];
    NSString *urlStr = [baseUrlStr stringByAppendingString:dictM[@"image"]];
    //2.4设置图片
    [cell.imageView sd_setImageWithURL:[NSURL URLWithString:urlStr] placeholderImage:[UIImage imageNamed:@"123"]];
    //3.返回cell
    return cell;
}

@end
