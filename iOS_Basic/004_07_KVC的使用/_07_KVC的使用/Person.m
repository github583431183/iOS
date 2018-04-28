//
//  Person.m
//  _07_KVC的使用
//
//  Created by 吴佳臻 on 2018/1/15.
//  Copyright © 2018年 wjz. All rights reserved.
//

#import "Person.h"

@implementation Person
{
    int _age;
}

- (instancetype)init{
    if(self = [super init]){
        _age = 18;
    }
    return self;
}

- (void)printAge{
    NSLog(@"age:%d", _age);
}

- (NSString *)description{
    return [NSString stringWithFormat:@"name:%@----money:%.2f", _name,_money];
}

- (instancetype)initWithDict:(NSDictionary *)dict{
    if(self = [super init]){
        
//         self.name = dict[@"name"];
//         self.money = [dict[@"money"] floatValue];
        
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+ (instancetype)personWithDict:(NSDictionary *)dict{
    return [[self alloc] initWithDict:dict];
}
@end
