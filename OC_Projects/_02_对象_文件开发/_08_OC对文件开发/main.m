//
//  main.m
//  _08_OC对文件开发
//
//  Created by 吴佳臻 on 2017/6/2.
//  Copyright © 2017年 吴佳臻. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Soldier.h"
#import "Shop.h"

int main(int argc, const char * argv[]) {
    
    // 1.创建士兵
    Soldier *sp = [Soldier new];
    sp->_name=@"哈哈";
    sp->_height=1.88;
    sp->_weight=100.0;
    
    // 2. 购买手枪
    Gun *gun = [Shop buyGun:888];
    
    // 3. 购买弹夹
    Clip *clip = [Shop buyClip:100];
    
    // 4. 士兵开枪
    [sp fire:gun clip:clip];
    return 0;
}
