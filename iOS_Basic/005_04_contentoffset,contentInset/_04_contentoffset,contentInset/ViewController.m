//
//  ViewController.m
//  _04_contentoffset,contentInset
//
//  Created by 吴佳臻 on 2018/1/16.
//  Copyright © 2018年 wjz. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //1.UIImageView
    UIImage *image = [UIImage imageNamed:@"minion"];
    UIImageView *imageView = [[UIImageView alloc]initWithImage:image];
    [self.scrollView addSubview:imageView];
    //2.设置contentSize
    self.scrollView.contentSize = image.size;
    //3.内容的偏移量
    //作用1:控制内容滚动的位置
    //作用2:得知内容滚动的位置
    self.scrollView.contentOffset = CGPointMake(0, -50);
    
    //4.内边距
    self.scrollView.contentInset = UIEdgeInsetsMake(100, 0, 0, 0);
}


/**
 
 @override
 点击控制器的view会自动调用这个方法
 */
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    //self.scrollView.contentOffset = CGPointMake(-100, -100);
}

#pragma mark - 按钮的点击

- (IBAction)top:(id)sender {
//    [UIView animateWithDuration:2.0 animations:^{
////        CGPoint offset = self.scrollView.contentOffset;
////        offset.y = 0;
////        self.scrollView.contentOffset = offset;
//        self.scrollView.contentOffset = CGPointMake(self.scrollView.contentOffset.x, 0);
//    }];
    // 带动画效果
    [self.scrollView setContentOffset:CGPointMake(self.scrollView.contentOffset.x, 0) animated:YES];
}
- (IBAction)bottom:(id)sender {
    CGFloat offsetX = self.scrollView.contentOffset.x;
    // 直接去图片底部
    CGFloat offsetY = self.scrollView.contentSize.height - self.scrollView.frame.size.height;
    CGPoint offset = CGPointMake(offsetX, offsetY);
    [self.scrollView setContentOffset:offset animated:YES];
}
- (IBAction)left:(id)sender {
    [self.scrollView setContentOffset:CGPointMake(0, self.scrollView.contentOffset.y) animated:YES];
}
- (IBAction)right:(id)sender {
    CGFloat offsetY = self.scrollView.contentOffset.y;
    CGFloat offsetX = self.scrollView.contentSize.width - self.scrollView.frame.size.width;
    CGPoint offset = CGPointMake(offsetX, offsetY);
    [self.scrollView setContentOffset:offset animated:YES];
}
- (IBAction)rightTop:(id)sender {
}
- (IBAction)leftBottom:(id)sender {
}

@end
