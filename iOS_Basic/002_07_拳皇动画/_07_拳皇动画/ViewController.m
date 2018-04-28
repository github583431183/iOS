//
//  ViewController.m
//  _07_拳皇动画
//
//  Created by 吴佳臻 on 2018/1/11.
//  Copyright © 2018年 wjz. All rights reserved.
//

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
// 站立
@property (strong, nonatomic) NSArray *standImages;
// 小招
@property (strong, nonatomic) NSArray *smallImages;
// 大招
@property (strong, nonatomic) NSArray *bigImages;

// 播放器
@property (strong, nonatomic) AVPlayer *player;
@end

@implementation ViewController

/**
 图片的两种加载方式:
 1. imageNamed:
     a. 就算指向它的指针被销毁,该资源也不会被从内存中干掉
     b. 放到Assets.xcassets的图片,默认就有 缓存
     c. 图片经常被使用
 
 2. imageWithContentsOfFile:
     a. 指向它的指针被销毁,该资源会被从内存中干掉
     b. 放到项目中的图片就不由缓存
     c. 不经常用,大批量的图片
 
 */

- (void)viewDidLoad {
    [super viewDidLoad];
    // 初始化一些数据
    
    //1. 加载所有的站立图片
    self.standImages = [self loadAllImagesWithImagePrefix:@"stand" count:10];
    
    //2. 记载所有小招图片
    self.smallImages = [self loadAllImagesWithImagePrefix:@"xiaozhao3" count:39];
    
    // 3.加载所有的大招图片
    self.bigImages = [self loadAllImagesWithImagePrefix:@"dazhao" count:87];
    
    // 4. 站立
    [self stand];
    
    //5.创建播放器
    self.player = [[AVPlayer alloc] init];
}

/**
 加载所有的图片
 */
-(NSArray *)loadAllImagesWithImagePrefix:(NSString *)imagePrefix count:(int)count{
    NSMutableArray<UIImage *> *images = [NSMutableArray array];
    for (int i = 0; i<count; i++) {
        // 获取所有图片的名称
        NSString *imageName = [NSString stringWithFormat:@"%@_%d",imagePrefix,i+1];
        // 创建 UIImage
        // 加载有缓存的图片
        //UIImage *image = [UIImage imageNamed:imageName];
        
        // 下载无缓存的图片
        NSString *imagePath = [[NSBundle mainBundle] pathForResource:imageName ofType:@"png"];
        UIImage *image = [UIImage imageWithContentsOfFile:imagePath];
        
        // 装入数组
        [images addObject:image];
    }
    return images;
}
/**
 站立
 */
- (IBAction)stand {
    /*
    //1.清空之前的动画
    [self.imageView stopAnimating];
    self.imageView.animationImages = nil;
    //2.设置动画片
    self.imageView.animationImages = self.standImages;
    //3.设置播放次数（无限次）
    self.imageView.animationRepeatCount = 0;
    //4.设置播放的市场
    self.imageView.animationDuration = 0.6;
    //5.播放
    [self.imageView startAnimating];
     */
    [self playZhaoWithImages:self.standImages count:0 duration:0.6 isStand:YES musicName:nil];
}

/**
 小招
 */
- (IBAction)smallZhao:(UIButton *)sender {
    /*
    //1.清空之前的动画
    [self.imageView stopAnimating];
    // iOS 11 此处有bug，线程问题
    
    //2.设置动画片
    self.imageView.animationImages = self.smallImages;
    //3.设置播放次数（无限次）
    self.imageView.animationRepeatCount = 1;
    //4.设置播放的市场
    self.imageView.animationDuration = 1.5;
    //5.播放
    [self.imageView startAnimating];
     */
    //6.技能释放结束，站立
    /*
     Selector 方法
     Object 参数
     afterDelay 时间
    NSSelectorFromString(<#NSString * _Nonnull aSelectorName#>) 效果一样
     */
    //[self performSelector:@selector(stand) withObject:nil afterDelay:self.imageView.animationDuration];
    
    [self playZhaoWithImages:self.smallImages count:1 duration:1.5 isStand:NO musicName:@"xiaozhao3.mp3"];
}

/**
 大招
 */
- (IBAction)bigZhao:(UIButton *)sender {
    /*
    //1.清空之前的动画
    [self.imageView stopAnimating];
    // iOS 11 此处有bug，线程问题
    
    // 2.设置动画图片
    self.imageView.animationImages = self.bigImages;
    
    // 3.设置动画次数
    self.imageView.animationRepeatCount = 1;
    
    // 4.设置播放时长
    self.imageView.animationDuration = 2.5;
    
    // 5.播放
    [self.imageView startAnimating];
    //6.技能释放结束，站立
    [self performSelector:NSSelectorFromString(@"stand") withObject:nil afterDelay:self.imageView.animationDuration];
    */
    [self playZhaoWithImages:self.bigImages count:1 duration:2.5 isStand:NO musicName:@"dazhao.mp3"];
}

- (IBAction)gameOver {
    self.standImages = nil;
    self.smallImages = nil;
    self.bigImages = nil;
    
    self.imageView.animationImages = nil;
}

/**
 放招
 */
-(void)playZhaoWithImages:(NSArray *)images count:(NSInteger)count
                 duration:(NSTimeInterval)duration
                  isStand:(BOOL)isStand musicName:(NSString *)musicName{
    // 1.设置动画图片
    self.imageView.animationImages = images;
    
    // 2.设置动画次数
    self.imageView.animationRepeatCount = count;
    
    // 3.设置播放时长
    self.imageView.animationDuration = duration;
    
    // 4.播放
    [self.imageView startAnimating];
    
    // 5.站立
    if (!isStand) {
        //6.播放音乐
        NSURL *url = [[NSBundle mainBundle] URLForResource:musicName withExtension:nil];
        AVPlayerItem *playItem = [[AVPlayerItem alloc] initWithURL:url];
        [self.player replaceCurrentItemWithPlayerItem:playItem];
        [self.player play];
        
        //7.调节速率
        self.player.rate = 2.0;
        
        // 延迟执行站立方法
        [self performSelector:@selector(stand) withObject:nil afterDelay:self.imageView.animationDuration];
    }
}
@end
