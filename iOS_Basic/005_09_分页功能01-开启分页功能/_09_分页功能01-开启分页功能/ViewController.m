//
//  ViewController.m
//  _09_分页功能01-开启分页功能
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
    
    CGFloat scrollViewW = self.scrollView.frame.size.width;
    CGFloat scrollViewH = self.scrollView.frame.size.height;
   
//    UIImageView *imageView = [[UIImageView alloc] init];
//    imageView.image = [UIImage imageNamed:@"img_01"];
//    imageView.frame = CGRectMake(0, 0, scrollViewW, scrollViewH);
//    [self.scrollView addSubview:imageView];
//
//    UIImageView *imageView2 = [[UIImageView alloc]init];
//    imageView2.image = [UIImage imageNamed:@"img_02"];
//    imageView2.frame = CGRectMake(scrollViewW, 0, self.scrollView.frame.size.width, self.scrollView.frame.size.height);
//    [self.scrollView addSubview:imageView2];
//
//    UIImageView *imageView3 = [[UIImageView alloc] init];
//    imageView3.image = [UIImage imageNamed:@"img_03"];
//    imageView3.frame = CGRectMake( 2 * scrollViewW, 0, self.scrollView.frame.size.width, self.scrollView.frame.size.height);
//    [self.scrollView addSubview:imageView3];
    
    int count = 5;
    for (int i = 0; i < count; i ++) {
        UIImageView *imageView = [[UIImageView alloc] init];
        NSString *name = [NSString stringWithFormat:@"img_0%d",i + 1];
        imageView.image = [UIImage imageNamed:name];
        imageView.frame = CGRectMake(i * scrollViewW, 0, scrollViewW, scrollViewH);
        [self.scrollView addSubview:imageView];
    }
    
    
    // 2.设置contentSize
    self.scrollView.contentSize = CGSizeMake(count * scrollViewW, 0);
    
    // 3.开启分页功能
    // 标准:以scrollView的尺寸为一页
    self.scrollView.pagingEnabled = YES;
}


@end
