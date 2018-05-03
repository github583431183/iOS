//
//  main.m
//  _10_super关键字
//
//  Created by 吴佳臻 on 2017/6/6.
//  Copyright © 2017年 吴佳臻. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Iphone.h"
int main(int argc, const char * argv[]) {
    Iphone *p = [Iphone new];
    [p test];
    [Iphone carameWithFlahlightStatus:kFlahlightStatusOpen];
    return 0;
}
