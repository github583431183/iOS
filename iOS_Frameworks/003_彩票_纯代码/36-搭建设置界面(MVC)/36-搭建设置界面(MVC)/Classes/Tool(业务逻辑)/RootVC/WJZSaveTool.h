//
//  WJZSaveTool.h
//  34-业务逻辑类
//
//  Created by 吴佳臻 on 2018/5/22.
//  Copyright © 2018年 wjz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WJZSaveTool : NSObject
+(nullable id)objectForKey:(NSString *)defaultName;
+(void)setObject:(nullable id)value forKey:(NSString *)defaultName;
@end
