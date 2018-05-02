//
//  WJZContactItem.h
//  07-通讯录(简单逆传)
//
//  Created by 吴佳臻 on 2018/5/2.
//  Copyright © 2018年 wjz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WJZContactItem : NSObject

/**姓名*/
@property (nonatomic,strong) NSString *name;

/**电话*/
@property (nonatomic,strong) NSString *phone;

+(instancetype)itemWithName:(NSString *)name phone:(NSString *)phone;
@end
