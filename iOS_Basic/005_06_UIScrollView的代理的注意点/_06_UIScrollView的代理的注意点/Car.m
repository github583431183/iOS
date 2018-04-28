//
//  Car.m
//  _06_UIScrollView的代理的注意点
//
//  Created by 吴佳臻 on 2018/1/16.
//  Copyright © 2018年 wjz. All rights reserved.
//

#import "Car.h"
@interface Car()
@end

@implementation Car
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSLog(@"scrollViewDidScroll");
}

- (void)dealloc
{
    NSLog(@"dealloc--车挂了");
}
@end
