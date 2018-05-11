//
//  WJZWine.h
//  009_04_数据刷新01-全局刷新
//
//  Created by 吴佳臻 on 2018/5/11.
//  Copyright © 2018年 wjz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WJZWine : NSObject
@property(nonatomic,copy)NSString *image;
@property(nonatomic,copy)NSString *money;
@property(nonatomic,copy)NSString *name;

/** 记录打钩控件的状态 */
@property (nonatomic, assign, getter=isCheched) BOOL checked;
@end
