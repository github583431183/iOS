//
//  Status.m
//  _06_多个对象的内存管理练习
//
//  Created by 吴佳臻 on 2017/11/25.
//  Copyright © 2017年 吴佳臻. All rights reserved.
//

#import "Status.h"

@implementation Status
- (void)setText:(NSString *)text // nil
{
    // 加入上一次的值是@"abc";
    
    if (_text != text) {
        [_text release];
        _text = [text retain]; // _text = nil;
    }
}
- (void)dealloc
{
    NSLog(@"%s", __func__);
    /*
     [_text release];
     _text = nil;
     
     [_picture release];
     _picture = nil;
     
     [_author release];
     _author = nil;
     
     [_repostStatus release];
     _repostStatus = nil;
     */
    
    // 下面这句话相当于调用了set方法
    // 先release旧值, 然后再将新值赋值给属性
    self.text = nil;
    self.picture = nil;
    self.author = nil;
    self.repostStatus = nil;
    
    [super dealloc];
}

@end
