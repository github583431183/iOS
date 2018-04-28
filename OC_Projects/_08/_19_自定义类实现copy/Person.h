//
//  Person.h
//  _19_自定义类实现copy
//
//  Created by 吴佳臻 on 2017/12/8.
//  Copyright © 2017年 吴佳臻. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject<NSCopying, NSMutableCopying>
@property (nonatomic, assign) int age;

@property (nonatomic, copy) NSString *name;
@end
