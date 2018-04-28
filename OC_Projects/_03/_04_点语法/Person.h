//
//  Person.h
//  _03
//
//  Created by 吴佳臻 on 2017/6/2.
//  Copyright © 2017年 吴佳臻. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

{
    //    @public
    int _age;
    NSString* _name;
    double _height;
}

// setter 对象方法
- (void)setAge:(int)age;
- (void)setName:(NSString *)name;
- (void)setHeight:(double)height;

// getter 对象方法
- (int)age;
- (double)height;
- (NSString *)name;

- (void)test;

@end
