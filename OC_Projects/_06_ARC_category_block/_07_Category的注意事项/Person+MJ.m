#import "Person+MJ.h"

@implementation Person (MJ)

// 如果 多个分类 中都有和原有类中同名的方法, 那么调用该方法的时候执行谁由编译器决定
// 会执行最后一个参与编译的分类中的方法
-(void)say
{
    NSLog(@"%s", __func__);
}
@end
