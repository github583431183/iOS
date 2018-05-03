//
//  main.m
//  _03_NSArray排序
//
//  Created by 吴佳臻 on 2017/12/7.
//  Copyright © 2017年 吴佳臻. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
int main(int argc, const char * argv[]) {
    
    NSArray *arr = @[@10, @20, @5, @7, @15];
    NSLog(@"排序前: %@", arr);
    
    // 注意：  \
        想使用 compare 方法对数组中的元素进行排序，  \
        那么数组中的元素必须是 Foundation 框架中的对象，也就是说不能是自定义对象
    NSArray *newArr = [arr sortedArrayUsingSelector:@selector(compare:)];
    NSLog(@"排序后: %@", newArr);
    
    Person *p1 = [Person new];
    p1.age = 10;
    
    Person *p2 = [Person new];
    p2.age = 20;
    
    Person *p3 = [Person new];
    p3.age = 5;
    
    Person *p4 = [Person new];
    p4.age = 7;
    
    NSArray *arr2 = @[p1, p2, p3, p4];
    NSLog(@"排序前: %@", arr2);
    // 按照人的年龄进行排序   \
        不能使用 compare: 方法对自定义对象排序
    // NSArray *newArr2 = [arr2 sortedArrayUsingSelector:@selector(compare:)];
    
    // 该方法默认会按照升序排序
    NSArray *newArr2 = [arr2 sortedArrayWithOptions:NSSortStable
                                   usingComparator:^NSComparisonResult(Person *obj1, Person *obj2) {
                                       // 每次调用该block都会取出数组中的两个元素给我们 \
                                            二分法
                                       NSLog(@"obj1 = %@, obj2 = %@", obj1, obj2);
                                       /*
                                        if (obj1.age > obj2.age) {
                                           // 5 4
                                           return NSOrderedDescending;
                                       }else if(obj1.age < obj2.age)
                                       {
                                           // 4 5
                                           return NSOrderedAscending;
                                       }else
                                       {
                                           return NSOrderedSame;
                                       }
                                        */
                                       return obj1.age > obj2.age;
                                   }];
    NSLog(@"排序后: %@", newArr);
    
    return 0;
}
