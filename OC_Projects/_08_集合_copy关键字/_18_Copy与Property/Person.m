//
//  Person.m
//  _18_Copy与Property
//
//  Created by 吴佳臻 on 2017/12/8.
//  Copyright © 2017年 吴佳臻. All rights reserved.
//

#import "Person.h"

@implementation Person
- (void)dealloc
{
    // 只要给block发送一条release消息, block中 使用到的对象 也会收到该消息
    Block_release(_pBlock);
    NSLog(@"%s", __func__);
    [super dealloc];
}
@end
