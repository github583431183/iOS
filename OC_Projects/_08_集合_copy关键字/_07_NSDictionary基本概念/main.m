//
//  main.m
//  _07_NSDictionary基本概念
//
//  Created by 吴佳臻 on 2017/12/7.
//  Copyright © 2017年 吴佳臻. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    
    // 1.如何创建
    NSDictionary *dict = [NSDictionary dictionaryWithObject:@"lnj" forKey:@"name"];
    NSString *name = [dict objectForKey:@"name"];
    NSLog(@"name = %@", name);
    
    // 注意: key和value 是一一对应
    NSDictionary *dict2 = [NSDictionary dictionaryWithObjects:@[@"lnj", @"30", @"1.75"]
                                                     forKeys:@[@"name", @"age", @"height"]];
    NSLog(@"%@ %@ %@",
          [dict2 objectForKey:@"name"],
          [dict2 objectForKey:@"age"],
          [dict2 objectForKey:@"height"]);
    
    //NSDictionary *dict = @{key:value};
    NSDictionary *dict3 = @{@"name": @"lnj"};
    NSLog(@"%@", dict3[@"name"]);
    
    NSDictionary *dict4 = @{@"name":@"lnj", @"age":@"30", @"height":@"1.75"};
    NSLog(@"%@ %@ %@", dict4[@"name"], dict4[@"age"], dict4[@"height"]);
    
    
    //2.字典的遍历
    NSDictionary *dict5 = @{@"name":@"lnj", @"age":@"30", @"height":@"1.75"};
    //2.1如何获取字典中key和value的个数, 在字典中key称之为键, value称之为值
    NSLog(@"count = %lu", [dict5 count]);
    
    for (int i = 0; i < dict5.count; ++i) {
        // 获取字典中所有的key
        NSArray *keys = [dict5 allKeys];
        // 取出当前位置对应的key
        NSLog(@"%@", keys[i]);
        NSString *key = keys[i];
        NSString *value = dict5[key];
        NSLog(@"key = %@, value = %@", key, value);
    }
    
    // 如何通过forin遍历字典, 会将所有的key赋值给前面的obj
    for (NSString *key in dict5) {
        NSLog(@"%@", key);
        NSString *value = dict5[key];
        NSLog(@"key = %@, value = %@", key, value);
    }
    
    // 迭代器
    [dict5 enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        NSLog(@"key = %@, value = %@", key, obj);
    }];
    
    
    // 3.字典文件读写
    NSDictionary *dict6 = @{@"name":@"lnj", @"age":@"30", @"height":@"1.75"};
    // XML 扩展名plist
    [dict6 writeToFile:@"/Users/wujiazhen/Desktop/note/info.plist" atomically:YES];
    
    // 注意:      \
        字典和数组不同, 字典中保存的数据是无序的
    NSDictionary *newDict = [NSDictionary dictionaryWithContentsOfFile:@"/Users/wujiazhen/Desktop/note/info.plist"];
    NSLog(@"%@", newDict);
    
    return 0;
}
