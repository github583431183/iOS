//
//  Android.h
//  _03
//
//  Created by 吴佳臻 on 2017/6/6.
//  Copyright © 2017年 吴佳臻. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Phone.h"


/**
 子类
 继承了某个类的类
 */
@interface Android : Phone

-(void)setCpu:(int)cpu;
-(void)cpu;

@end
