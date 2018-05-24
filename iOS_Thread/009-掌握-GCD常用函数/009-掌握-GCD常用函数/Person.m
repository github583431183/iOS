//
//  Person.m
//  009-掌握-GCD常用函数
//
//  Created by 吴佳臻 on 2018/5/24.
//  Copyright © 2018年 wjz. All rights reserved.
//

#import "Person.h"

@implementation Person


-(NSArray *)books
{
//        if (_books == nil) {
//            _books = @[@"1234",@"56789"];
//        }
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _books = @[@"1234",@"56789"];
    });
    return _books;
}
@end
