//
//  Dog.h
//  _08_@class应用场景二
//
//  Created by 吴佳臻 on 2017/11/25.
//  Copyright © 2017年 吴佳臻. All rights reserved.
//

#import <Foundation/Foundation.h>
//#import "Person.h"
@class Person;

@interface Dog : NSObject

@property(nonatomic, retain)Person *owner;
@end

