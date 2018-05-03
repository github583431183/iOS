//
//  Iphone.m
//  _03
//
//  Created by 吴佳臻 on 2017/6/6.
//  Copyright © 2017年 吴佳臻. All rights reserved.
//

#import "Iphone.h"

@implementation Iphone

+ (void)carameWithFlahlightStatus:(FlahlightStatus)status
{
    NSLog(@"聚焦");
    NSLog(@"调光");
    NSLog(@"人脸识别");
    
    //    [self carameWithFlahlightStatus:status];
    [super carameWithFlahlightStatus:status];

    /*
     // 由于以下代码和父类中的一模一样, 所以只需调用父类写好的代码即可
     if (status == kFlahlightStatusOpen) {
        [self openFlahlight];
     }else
     {
        [self closeFlahlight];
     }
     NSLog(@"拍照");
     */
    
    
    // 1.只需要利用'super'给父类的方法发送一个消息, 那么系统就会自动调用父类的方法
    // 2.如果以后想在子类中调用父类的方法可以使用 super
    // 3.如果想在给'父类方法'进行扩展的同时保留父类的方法, 那么可以使用super调用父类同名的方法
    }

- (void)test
{
    /*
     1. super在'类方法'中, 一定会调用'父类 的 类方法'
     2. super在'对象方法'中, 一定会调用'父类 的 对象方法'
     3. 可以利用 super 在 任意方法 中调用 父类中的方法
     */
    [super carameWithFlahlightStatus:kFlahlightStatusOpen];
}


@end
