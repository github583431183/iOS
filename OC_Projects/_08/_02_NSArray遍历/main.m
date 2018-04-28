//
//  main.m
//  _02_NSArray遍历
//
//  Created by 吴佳臻 on 2017/12/7.
//  Copyright © 2017年 吴佳臻. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
int main(int argc, const char * argv[]) {
    
    NSArray *arr = @[@"lnj", @"lmj", @"jjj"];
    // 常规遍历
    for (int i = 0; i < arr.count; ++i) {
        NSLog(@"arr[%i] = %@", i, arr[i]);
    }
    
    // 如果是 OC数组 可以使用 OC 的增强 for 循环  \
        逐个取出 arr 中的元素，将取出的元素赋值给 obj \
    注意：     \
        obj 的类型可以根据数组中的元素类型来写，不一定要写 NSObject
    for (NSString *obj in arr) {
        NSLog(@"obj = %@", obj);
    }
    
    //使用 OC数组 的 迭代器 来遍历     \
        每取出一个元素就会调用一次 block     \
        每次调用 block 都会将当前取出的元素和元素对应的索引传递给我们  \
        obj 就是当前取出的元素，idx 就是当前元素对应的索引   \
        stop 用于控制什么时候停止遍历
    [arr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (idx == 1) {
            *stop = YES;
        }
        NSLog(@"obj = %@, idx = %lu", obj, idx);
    }];
    
    Person *p1 = [Person new];
    Person *p2 = [Person new];
    Person *p3 = [Person new];
    Person *p4 = [Person new];
    
    NSArray *arr2 = @[p1, p2, p3, p4];
    
    [arr2 enumerateObjectsUsingBlock:^(Person *obj, NSUInteger idx, BOOL *stop) {
        [obj say];
    }];
    
    // 如果使用 OC数组 存储对象，可以调用 OC数组的方法让数组中所有的元素都执行指定方法  \
        注意： \
            如果数组中保存的不是相同类型的数据，并且没有相同的方法，那么会报错
    [arr2 makeObjectsPerformSelector:@selector(say)];
    
    // withObject：需要传递给调用方法的参数
    [arr2 makeObjectsPerformSelector:@selector(sayWithName:) withObject:@"lnj"];
    
    return 0;
}
