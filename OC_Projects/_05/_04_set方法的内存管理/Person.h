//
//  Person.h
//  _05
//
//  Created by 吴佳臻 on 2017/6/9.
//  Copyright © 2017年 吴佳臻. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Room.h"

@interface Person : NSObject
{
    Room *_room;
}

- (void)setRoom:(Room *)room;
- (Room *)room;
@end
