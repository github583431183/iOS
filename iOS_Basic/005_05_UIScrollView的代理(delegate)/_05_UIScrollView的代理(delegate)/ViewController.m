//
//  ViewController.m
//  _05_UIScrollView的代理(delegate)
//
//  Created by 吴佳臻 on 2018/1/16.
//  Copyright © 2018年 wjz. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIScrollViewDelegate> // 代理

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //1.UIScrollView
    UIScrollView *scrollView = [[UIScrollView alloc] init];
    scrollView.backgroundColor = [UIColor redColor];
    scrollView.frame = CGRectMake(0, 20, 300, 200);
    [self.view addSubview:scrollView];
    //注意：   \
        通过代码创建 UIScrollView ，一开始 subviews 这个数组为 nil
    NSLog(@"%@",scrollView.subviews);
    
    //1.1创建 UIImageView
    UIImage *image = [UIImage imageNamed:@"minion"];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    [scrollView addSubview:imageView];
    
    //1.2设置contentSize
    scrollView.contentSize = image.size;
    
    //2.设置代理
    scrollView.delegate = self;
}

#pragma mark - UIScrollViewDelegate 代理方法


/**
 当scrollView 正在滚动的时候就会自动调用这个方法

 @param scrollView <#scrollView description#>
 */
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    NSLog(@"scrollViewDidScroll--");
}


/**
 用户即将开始拖拽scrollView时就会调用这个方法

 @param scrollView <#scrollView description#>
 */
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    NSLog(@"scrollViewWillBeginDragging--");
}


/**
 用户即将停止拖拽 scrollView 时就会调用这个方法

 @param scrollView <#scrollView description#>
 @param velocity <#velocity description#>
 @param targetContentOffset <#targetContentOffset description#>
 */
- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset{
    NSLog(@"scrollViewWillEndDragging--");
}


/**
 用户已经停止拖拽 scrollView 时就会调用这个方法

 @param scrollView <#scrollView description#>
 @param decelerate <#decelerate description#>
 */
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    if (decelerate == NO) {
        NSLog(@"用户已经停止拖拽scrollView,停止滚动");
    } else {
        NSLog(@"用户已经停止拖拽scrollView,但是scrollView由于惯性会继续滚动,减速");
    }
}

/**
 scrollView减速完毕会调用,停止滚动

 @param scrollView <#scrollView description#>
 */
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    NSLog(@"scrollView 减速完毕会调用,停止滚动");
}
@end
