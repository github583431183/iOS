//
//  Person.m
//  _05
//
//  Created by 吴佳臻 on 2017/6/9.
//  Copyright © 2017年 吴佳臻. All rights reserved.
//

#import "Person.h"

@implementation Person
/*
 - (void)setRoom:(Room *)room
 {
     // 1.判断传入的对象和当前对象是否一样
     if (_room != room) {
         // 2.release以前的对象
         [_room release];
         // 3.retain传入的对象
         _room = [room retain];
     }
 }
 - (void)setCar:(Car *)car
 {
     if (_car != car) {
         [_car release];
         _car = [car retain];
     }
 }
 - (void)setDog:(Dog *)dog
 {
     if (_dog != dog) {
         [_dog release];
         _dog = [dog retain];
     }
 }
 
 - (Room *)room
 {
    return _room;
 }
 - (Car *)car
 {
    return _car;
 }
 - (Dog *)dog
 {
    return _dog;
 }
 */


- (void)dealloc
{
    [_room release];
    [_car release];
    [_dog release];
    
    NSLog(@"%s", __func__);
    [super dealloc];
}
@end
