//
//  WJZContactItem.h
//  08-通讯录(代理逆传)
//
//  Created by 吴佳臻 on 2018/5/2.
//  Copyright © 2018年 wjz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WJZContactItem : NSObject

@property(nonatomic,strong)NSString *name;
@property(nonatomic,strong)NSString *phone;

+(instancetype)itemWithName:(NSString *)name phone:(NSString *)phone;
@end
