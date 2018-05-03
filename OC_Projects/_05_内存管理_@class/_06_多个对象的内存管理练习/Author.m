//
//  Author.m
//  _06_多个对象的内存管理练习
//
//  Created by 吴佳臻 on 2017/11/25.
//  Copyright © 2017年 吴佳臻. All rights reserved.
//

#import "Author.h"

@implementation Author

- (void)dealloc
{
    NSLog(@"%s", __func__);
    [_name release];
    [_icon release];
    [_account release];
    [super dealloc];
}
@end
