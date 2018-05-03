#import <Foundation/Foundation.h>
// 创建一个协议，遵守 NSObject 协议
@protocol SportProtocol <NSObject>
// 方法声明列表
-(void)playFootball;
-(void)playBasketball;
-(void)playBaseball;
@end