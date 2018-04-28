
#import "Person.h"

@implementation Person
- (void)playFootball
{
    NSLog(@"%s", __func__);
}

// 一下协议 是可选的，编译器只是报个提醒
//- (void)playBasketball
//{
//    NSLog(@"%s", __func__);
//}
//
//- (void)playBaseball
//{
//    NSLog(@"%s", __func__);
//}

- (void)study
{
    NSLog(@"%s", __func__);
}
@end
