//
//  WJZAPP.h
//  112-掌握-多图下载综合案例-数据展示
//
//  Created by 吴佳臻 on 2018/5/30.
//  Copyright © 2018年 wjz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WJZAPP : NSObject
/** APP的名称 */
@property (nonatomic, strong) NSString *name;
/** APP的图片的url地址 */
@property (nonatomic, strong) NSString *icon;
/** APP的下载量 */
@property (nonatomic, strong) NSString *download;

+(instancetype)appWithDict:(NSDictionary *)dict;
@end
