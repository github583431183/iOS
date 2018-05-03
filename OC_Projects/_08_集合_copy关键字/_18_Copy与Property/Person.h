//
//  Person.h
//  _18_Copy与Property
//
//  Created by 吴佳臻 on 2017/12/8.
//  Copyright © 2017年 吴佳臻. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^myBlock)();

@interface Person : NSObject

//@property (nonatomic, retain) NSString *name;
@property (nonatomic, copy) NSString *name;

// 注意:  \
    如果是 block 使用copy并不是拷贝, 而是转移
@property (nonatomic, copy) myBlock pBlock;
@end
