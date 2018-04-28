//
//  Tools.h
//  _21_宏定义抽取单例
//
//  Created by 吴佳臻 on 2017/12/8.
//  Copyright © 2017年 吴佳臻. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Singleton.h"

@interface Tools : NSObject<NSCopying, NSMutableCopying>

// share + 当前的类名
//+ (instancetype)shareTools;

interfaceSingleton(Tools);

@end
