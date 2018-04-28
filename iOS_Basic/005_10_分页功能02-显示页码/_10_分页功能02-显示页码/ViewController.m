//
//  ViewController.m
//  _10_分页功能02-显示页码
//
//  Created by 吴佳臻 on 2018/1/16.
//  Copyright © 2018年 wjz. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
#pragma mark - scrollView
    //1.添加图片
    CGFloat scrollViewW = self.scrollView.frame.size.width;
    CGFloat scrollViewH = self.scrollView.frame.size.height;
    int count = 5;
    for (int i = 0; i<count; i ++) {
        UIImageView *imageView = [[UIImageView alloc] init];
        NSString *name = [NSString stringWithFormat:@"img_0%d",i + 1];
        imageView.image = [UIImage imageNamed:name];
        imageView.frame = CGRectMake(i * scrollViewW, 0, scrollViewW, scrollViewH);
        [self.scrollView addSubview:imageView];
    }
    //2.设置contentSize
    // 这个0表示树脂方向不可以滚动
    self.scrollView.contentSize = CGSizeMake(count * scrollViewW, 0);
    //3.开启分页功能
    // 标准：以 scrollView 的尺寸为一页
    self.scrollView.pagingEnabled = YES;
    
#pragma mark - pageControl
    //4.设置总页数
    self.pageControl.numberOfPages = count;
    //5.单页的时候是否隐藏pageControl
    self.pageControl.hidesForSinglePage = YES;
    //6.设置pageControl图片
    [self.pageControl setValue:[UIImage imageNamed:@"current"] forKey:@"_currentPageImage"];
    [self.pageControl setValue:[UIImage imageNamed:@"other"] forKey:@"_pageImage"];
    
}

/**
 当scrollView 正在滚动的时候就会自动调用这个方法
 
 @param scrollView <#scrollView description#>
 */
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    // 会多次调用，界面卡顿
    NSLog(@"--scrollViewDidScroll--");
    // 四舍五入: int(小数 + 0.5)
    // 0.2 ---> 0  int(0.2 + 0.5)= 0.7 -> 0
    // 0.3 ---> 0  int(0.3 + 0.5)= 0.8 -> 0
    // 0.9 ----> 1 int(0.9 + 0.5)= 1.4 -> 1
    // 1.5 ----> 2 int(1.5 + 0.5)= 2 -> 2

    // 1.计算页码
    int page = (int)(scrollView.contentOffset.x / scrollView.frame.size.width + 0.5);

    // 2.设置页码
    self.pageControl.currentPage = page;
}

/**
 用户已经停止拖拽 scrollView 时就会调用这个方法
 
 @param scrollView <#scrollView description#>
 @param decelerate <#decelerate description#>
 */
//- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
//{
//    // NO    停止滚动   \
//       Yes   惯性
//    if (decelerate == NO) {
//        // 1.计算页码
//        int page = scrollView.contentOffset.x / scrollView.frame.size.width;
//
//        // 2.设置页码
//        self.pageControl.currentPage = page;
//    }
//}
/**
 scrollView减速完毕会调用,停止滚动
 
 @param scrollView <#scrollView description#>
 */
//- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
//{
//    // 1.计算页码
//    int page = scrollView.contentOffset.x / scrollView.frame.size.width;
//
//    // 2.设置页码
//    self.pageControl.currentPage = page;
//
//}

@end
