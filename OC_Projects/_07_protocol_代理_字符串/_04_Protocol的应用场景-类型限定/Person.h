#import <Foundation/Foundation.h>
#import "Wife.h"

@interface Person : NSObject

// 注意: 记住一点, 类型限定 是写在 数据类型 的右边的
@property (nonatomic, strong) Wife<WifeCondition> *wife;

- (void)show;

@end
