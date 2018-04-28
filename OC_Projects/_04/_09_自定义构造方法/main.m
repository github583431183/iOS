//
//  main.m
//  _09_自定义构造方法
//
//  Created by 吴佳臻 on 2017/6/7.
//  Copyright © 2017年 吴佳臻. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

int main(int argc, const char * argv[]) {
    
    //    Person *p = [Person new];
    //    Person *p = [[Person alloc] init];
    //    p.age = 20;
    //    Person *p = [[Person alloc] initWithAge:20];
    //    Person *p = [[Person alloc] initWithName:@"haha"];
    Person *p = [[Person alloc] initWithAge:20 andName:@"haha"];
    NSLog(@"%@", p);
    
    //    Person *p2 = [[Person alloc] init];
    //    p2.age = 30;
    //    Person *p2 = [[Person alloc] initWithAge:30];
    //    Person *p2 = [[Person alloc] initWithName:@"haha"];
    Person *p2 = [[Person alloc] initWithAge:30 andName:@"haha"];
    NSLog(@"%@", p2);
    return 0;
}
