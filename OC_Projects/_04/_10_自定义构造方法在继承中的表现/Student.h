//
//  Student.h
//  _04
//
//  Created by 吴佳臻 on 2017/6/7.
//  Copyright © 2017年 吴佳臻. All rights reserved.
//

#import "Person.h"

@interface Student : Person

@property int no; // 学号

- (instancetype)initWithAge:(int)age
                    andName:(NSString *)name
                      andNo:(int)no;
@end
