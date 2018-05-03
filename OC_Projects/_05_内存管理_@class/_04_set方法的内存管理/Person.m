//
//  Person.m
//  _05
//
//  Created by 吴佳臻 on 2017/6/9.
//  Copyright © 2017年 吴佳臻. All rights reserved.
//

#import "Person.h"

@implementation Person

-(void)setRoom:(Room *)room
{
    // 只有 Room 对象不同才需要 release 和 retain
    if(_room != room){
    
        // 将之前的 room 对象释放掉 -1
        [_room release];
        
        // 对 新的 Room 对象引用计数器 +1    \
            retain 方法不仅会对引用计数器 +1,而且会返回当前对象
        _room = [room retain];
        
    }
}

-(Room *)room
{
    return _room;
}

-(void)dealloc
{
    [_room release];
    NSLog(@"%s",__func__);
    [super dealloc];
}

@end
