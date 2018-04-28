//
//  Soldier.m
//  _02
//
//  Created by 吴佳臻 on 2017/6/2.
//  Copyright © 2017年 吴佳臻. All rights reserved.
//

#import "Soldier.h"

@implementation Soldier

-(void)fire:(Gun *)gun clip:(Clip *)clip{

    if(gun!=nil&&
       clip!=nil){
    
        [gun shoot:clip];
    }
    
}
@end
