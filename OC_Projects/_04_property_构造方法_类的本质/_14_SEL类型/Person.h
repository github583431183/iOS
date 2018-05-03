//
//  Person.h
//  _04
//
//  Created by 吴佳臻 on 2017/6/8.
//  Copyright © 2017年 吴佳臻. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

@property int age;

+ (void)test;
- (void)demo;

- (void)signalWithNumber:(NSString *)number;

- (void)sendMessageWithNumber:(NSString *)number andContent:(NSString *)content;

// 调用 传入对象 的指定方法
- (void)makeObject:(id)obj andSel:(SEL)sel;
@end
