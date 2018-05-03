//
//  Person.h
//  _03
//
//  Created by 吴佳臻 on 2017/6/6.
//  Copyright © 2017年 吴佳臻. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject
{
    int _age;
    double _height;
    double _weight;
    NSString *_name;
    NSString *_tel;
    NSString *_email;
}


- (void)setAge:(int)age;
- (void)setHeigth:(double)height;
- (void)setWeight:(double)weight;
- (void)setName:(NSString *)name;
- (void)setTel:(NSString *)tel;
- (void)setEmail:(NSString *)email;

- (int)age;
- (double)height;
- (double)weight;
- (NSString *)name;
- (NSString *)tel;
- (NSString *)email;
@end
