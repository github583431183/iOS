//
//  Shop.m
//  _03_综合练习
//
//  Created by 吴佳臻 on 2018/1/12.
//  Copyright © 2018年 wjz. All rights reserved.
//

#import "Shop.h"

@implementation Shop

// 自定义构造方法，必须符合苹果规范！    \
    先初始化父类，并判断父类是否初始化成功

-(instancetype)initWithIcon:(NSString *)icon name:(NSString *)name{
    if(self = [super init]){
        self.icon = icon;
        self.name = name;
    }
    return self;
}

-(instancetype)initWithDict:(NSDictionary *)dict{
    if(self = [super init]){
        self.icon = dict[@"icon"];
        self.name = dict[@"name"];
    }
    return self;
}

+(instancetype)shopWithIcon:(NSString *)icon name:(NSString *)name{
    return [[self alloc] initWithIcon:icon name:name];
}
+(instancetype)shopWithIcon:(NSDictionary *)dict{
    return [[self alloc] initWithDict:dict];
}
@end
