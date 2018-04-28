//
//  ViewController.m
//  _08_内容缩放
//
//  Created by 吴佳臻 on 2018/1/16.
//  Copyright © 2018年 wjz. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) UIImageView *imageView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //1.创建UIImaveView
    UIImage *image = [UIImage imageNamed:@"minion"];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    [self.scrollView addSubview:imageView];
    self.imageView = imageView;
    //2.设置contentSize
    self.scrollView.contentSize = image.size;
    //3.设置缩放比例
    self.scrollView.maximumZoomScale = 2.0;
    self.scrollView.minimumZoomScale = 0.5;
    
    //4.代理，可在 storyboar 中设置
    //self.scrollView.delegate = self;
}

#pragma mark - UIScrollViewDelegate

/**
 返回需要缩放的子控件(scrollView 的子控件)

 @param scrollView <#scrollView description#>
 @return <#return value description#>
 */
- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView{
    return self.imageView;
}
- (void)scrollViewDidZoom:(UIScrollView *)scrollView{
    NSLog(@"scrollViewDidZoom---");
}
@end
