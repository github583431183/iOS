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
#import "Video.h"
#import "MJExtension.h"
#define baseUrlStr @"http://120.25.226.186:32812"
@interface ViewController ()

@property(nonatomic,strong)NSMutableArray *videos;
@end

@implementation ViewController

-(NSMutableArray *)videos{
    if (_videos==nil) {
        _videos = [NSMutableArray array];
    }
    return _videos;
}

-(void)viewDidLoad{
    [super viewDidLoad];
    
    //替换ID->id
    [Video mj_setupReplacedKeyFromPropertyName:^NSDictionary *{
        return @{@"ID":@"id"};
    }];
    
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
        //self.videos = dictM[@"videos"];
        
        //字典数组-->模型数组
//        for (NSDictionary *dict in dictM[@"videos"]) {
//            [self.videos addObject:[Video videoWithDict:dict]];
//        }

        //字典转模型
        self.videos = [Video mj_objectArrayWithKeyValuesArray:dictM[@"videos"]];
        
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
    //NSDictionary *dictM = self.videos[indexPath.row];
    Video *videoM = self.videos[indexPath.row];
    //2.2设置标题
    //cell.textLabel.text = dictM[@"name"];
    cell.textLabel.text = videoM.name;
    //2.3设置子标题
    cell.detailTextLabel.text = [NSString stringWithFormat:@"播放时间%@",videoM.length];
    NSString *urlStr = [baseUrlStr stringByAppendingString:videoM.image];
    //2.4设置图片
    [cell.imageView sd_setImageWithURL:[NSURL URLWithString:urlStr] placeholderImage:[UIImage imageNamed:@"123"]];
    //3.返回cell
    return cell;
}

#pragma mark UITableViewDelegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //1.拿到数据
    Video *videoM = self.videos[indexPath.row];
    //2.拼接数据
    NSString *urlStr = [baseUrlStr stringByAppendingPathComponent:videoM.url];
    //3.创建播放控制器
    MPMoviePlayerController *vc = [[MPMoviePlayerController alloc]initWithContentURL:[NSURL URLWithString:urlStr]];
    //4.弹出控制器
    [self presentViewController:vc animated:YES completion:nil];
}

@end
