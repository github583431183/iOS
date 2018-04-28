#import <Foundation/Foundation.h>
#import "SportProtocol.h"
// Dog 也遵守 人的 协议，此处有问题
@interface Dog : NSObject<SportProtocol>

@end