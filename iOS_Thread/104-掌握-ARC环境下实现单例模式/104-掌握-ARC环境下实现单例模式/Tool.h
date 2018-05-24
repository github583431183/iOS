//
//  Tool.h
//  104-掌握-ARC环境下实现单例模式
//
//  Created by 吴佳臻 on 2018/5/24.
//  Copyright © 2018年 wjz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Tool : NSObject


//类方法
//1.方便询问
//2.标明身份
//3.注意:share+类名|default+类名|share|default|类名
+(instancetype)shareTool;

@end
