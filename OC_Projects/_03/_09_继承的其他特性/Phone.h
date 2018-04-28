//
//  Phone.h
//  _03
//
//  Created by 吴佳臻 on 2017/6/6.
//  Copyright © 2017年 吴佳臻. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Phone : NSObject
{
    int _cpu;
}

// 打电话
- (void)signalWithNumber:(NSString *)number;

// 发短信
- (void)sendMessageWithNumber:(NSString *)number andContent:(NSString *)content;

// 打印品牌信息
+ (void)brand;
@end
