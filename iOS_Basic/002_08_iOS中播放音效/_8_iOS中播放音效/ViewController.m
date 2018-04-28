//
//  ViewController.m
//  _8_iOS中播放音效
//
//  Created by 吴佳臻 on 2018/1/12.
//  Copyright © 2018年 wjz. All rights reserved.
//

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>
@interface ViewController ()
// 背景图片
@property (weak, nonatomic) IBOutlet UIImageView *bgImageView;
// 播放器
@property (strong,nonatomic) AVPlayer *player;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //1.毛玻璃
    UIToolbar *toolbar = [[UIToolbar alloc] init];
    //2.设置Frame
    toolbar.frame = self.bgImageView.bounds;
    //3.设置样式和透明度
    toolbar.barStyle = UIBarStyleBlack;
    toolbar.alpha = 0.8;
    //4.加到背景图片上
    [self.bgImageView addSubview:toolbar];
    //5.创建播放器
    //资源的URL地址
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"mySong1.mp3" withExtension:nil];
    //创建播放器曲目
    AVPlayerItem *playerItem = [[AVPlayerItem alloc] initWithURL:url];
    //创建播放器
    self.player = [[AVPlayer alloc] initWithPlayerItem:playerItem];
}

/**
 播放/暂停
 */
- (IBAction)playOrPause:(UIButton *)sender {
    switch (sender.tag) {
        case 3:
            [self.player pause];
            break;
        case 4:
            [self.player play];
            break;
        default:
            break;
    }
   
}
- (IBAction)changeMusic:(UIButton *)sender {
    // 歌曲名称
    NSString *musicName = nil;
    switch (sender.tag) {
        case 1:
            musicName = @"mySong2.mp3";
            break;
        case 2:
            musicName = @"mySong3.mp3";
            break;
            
        default:
            break;
    }
    
    NSURL *url = [[NSBundle mainBundle] URLForResource:musicName withExtension:nil];
    AVPlayerItem *playItem = [[AVPlayerItem alloc] initWithURL:url];
    [self.player replaceCurrentItemWithPlayerItem:playItem];
    [self.player play];
}


@end
