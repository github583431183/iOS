#import "Person.h"

@implementation Person

- (void)findHourse
{
    NSLog(@"学生想找房子");
    // 通知代理帮他找房子
    // 判断 遵守协议 的类，是否实现协议中的方法 
    if ([self.delegate respondsToSelector:@selector(personFindHourse:)]) {
        [self.delegate personFindHourse:self];
    }
}

@end
