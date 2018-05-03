//
//  Car.h
//  _07_@class应用场景一
//
//  Created by 吴佳臻 on 2017/11/25.
//  Copyright © 2017年 吴佳臻. All rights reserved.
//

#import <Foundation/Foundation.h>
//#import "Wheel.h"
@class Wheel;

@interface Car : NSObject

@property (nonatomic, retain) Wheel *wheel;
@end
