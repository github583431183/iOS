//
//  ViewController.m
//  _02_展示大图片
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
}


@end
