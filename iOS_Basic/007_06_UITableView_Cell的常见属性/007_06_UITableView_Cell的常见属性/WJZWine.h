//
//  WJZWine.h
//  007_05_UITableView_展示单组数组
//
//  Created by 吴佳臻 on 2018/5/3.
//  Copyright © 2018年 wjz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WJZWine : NSObject

@property(nonatomic,copy)NSString *name;
@property(nonatomic,copy)NSString *image;
@property(nonatomic,copy)NSString *money;

+(instancetype)wineWithDict:(NSDictionary *)dict;

@end
