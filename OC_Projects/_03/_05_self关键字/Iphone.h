//
//  Iphone.h
//  _03
//
//  Created by 吴佳臻 on 2017/6/2.
//  Copyright © 2017年 吴佳臻. All rights reserved.
//

#import <Foundation/Foundation.h>

// 自定义 枚举
typedef enum
{
    kFlahlightStatusOpen,
    kFlahlightStatusClose
    
} FlahlightStatus;

@interface Iphone : NSObject
{
    int _cpu;
}


/**
 *  根据闪光灯的状态拍照
 *
 *  @param status 闪光灯的状态, 开/关
 */
+ (void)carameWithFlahlightStatus:(FlahlightStatus)status;
/**
 *  打开闪光灯
 */
+ (void)openFlahlight;
/**
 * 关闭闪光灯
 */
+ (void)closeFlahlight;


@end
