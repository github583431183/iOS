#import "LinkHome.h"
#import "Person.h" // 导入一个协议的声明

@implementation LinkHome

- (void)personFindHourse:(Person *)person
{
    NSLog(@"%s", __func__);
}
@end
