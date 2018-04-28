#import "Person+NJ.h"

@implementation Person (NJ)
// 实现扩充方法

- (void)playFootball
{
    NSLog(@"%s", __func__);
}

- (void)playBasketball
{
    NSLog(@"%s", __func__);
}
@end
