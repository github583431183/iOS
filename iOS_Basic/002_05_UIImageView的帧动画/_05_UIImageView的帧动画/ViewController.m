//
//  ViewController.m
//  _05_UIImageView的帧动画
//
//  Created by 吴佳臻 on 2018/1/11.
//  Copyright © 2018年 wjz. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

#pragma mark - 开始动画
- (IBAction)startAnimation:(id)sender {
    //1.1加载所有图片
    NSMutableArray<UIImage *> *imageArr = [NSMutableArray array];
    for (int i = 0; i<20; i++) {
        // 获取图片的名称
        NSString *imageName = [NSString stringWithFormat:@"%d",i+1];
        // 创建UIImage对象
        UIImage *image = [UIImage imageNamed:imageName];
        // 加入数组
        [imageArr addObject:image];
    }
    // 设置动画图片
    self.imageView.animationImages = imageArr;
    // 设置播放时长
    // 1秒30帧，一张图片的时间 = 1 / 30 = 0.03333 20*0.0333
    self.imageView.animationDuration = 1.0;
    
    // 开始动画
    [self.imageView startAnimating];
}
#pragma mark - 结束动画
- (IBAction)stopAnimation:(id)sender {
    [self.imageView stopAnimating];
}



@end
