//
//  main.m
//  _05_self关键字
//
//  Created by 吴佳臻 on 2017/6/2.
//  Copyright © 2017年 吴佳臻. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    // self关键字 不能离开类, 离开类之后没有任何意义 \
        因为self关键字代表当前类
    
    [Iphone carameWithFlahlightStatus:kFlahlightStatusClose];
    
    return 0;
}
