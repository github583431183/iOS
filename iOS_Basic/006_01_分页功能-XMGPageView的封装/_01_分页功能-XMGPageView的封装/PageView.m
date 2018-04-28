//
//  PageView.m
//  _01_分页功能-XMGPageView的封装
//
//  Created by 吴佳臻 on 2018/1/16.
//  Copyright © 2018年 wjz. All rights reserved.
//

#import "PageView.h"

@interface PageView() <UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;

// 定时器
@property (weak, nonatomic) NSTimer *timer;
@end
@implementation PageView

- (void)awakeFromNib{
    [super awakeFromNib];
    
    //0.增加 autoresizing \
        功能：填充父控件
    self.scrollView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    self.pageControl.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleTopMargin;
    
    //1. 单页的时候是否隐藏pageControl
    self.pageControl.hidesForSinglePage = YES;
    //2. 设置pageControl的图片
    [self.pageControl setValue:[UIImage imageNamed:@"current"] forKeyPath:@"_currentPageImage"];
    [self.pageControl setValue:[UIImage imageNamed:@"other"] forKeyPath:@"_pageImage"];
    //3. 开启定时器
    [self startTimer];
}

+ (instancetype)pageView{
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil] lastObject];
}

- (void)setImageNames:(NSArray *)imageNames{
    _imageNames = imageNames;
    //0.移除之前添加的 \
        让subviews这个数组中每一个对象都执行removeFromSuperview
    [self.scrollView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    //1.根据图片名称数据创建ImageView添加到scrollView
    CGFloat scrollViewW = self.scrollView.frame.size.width;
    CGFloat scrollViewH = self.scrollView.frame.size.height;
    NSUInteger count = imageNames.count;
    for (int i = 0; i < count; i++) {
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.image = [UIImage imageNamed:imageNames[i]];
        imageView.frame = CGRectMake(i * scrollViewW, 0, scrollViewW, scrollViewH);
        [self.scrollView addSubview:imageView];
    }
    
    //2.设置contentSize
    self.scrollView.contentSize = CGSizeMake(count * scrollViewW, 0);
    
    //3.设置总页数
    self.pageControl.numberOfPages = count;
}

#pragma mark - 定时器相关代码
- (void)startTimer{
    //返回一个自动执行的定时器对象
    self.timer = [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(nextPage:) userInfo:@"123" repeats:YES];
    [[NSRunLoop mainRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
}
- (void)stopTimer{
    [self.timer invalidate];
}
- (void)nextPage:(NSTimer *)timer{
    //1.计算下一页
    NSInteger page = self.pageControl.currentPage + 1;
    //2.超过了最后一页
    if (page == self.imageNames.count) {
        page = 0;
    }
    //3.滚动到下一页
    [self.scrollView setContentOffset:CGPointMake(page * self.scrollView.frame.size.width, 0) animated:YES];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    // 1.计算页码
    int page = (scrollView.contentOffset.x / scrollView.frame.size.width + 0.5);
    //2.设置野马
    self.pageControl.currentPage = page;
}
-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    [self stopTimer];
}
-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    [self startTimer];
}
@end
