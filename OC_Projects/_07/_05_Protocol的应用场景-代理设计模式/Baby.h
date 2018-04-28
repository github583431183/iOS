#import <Foundation/Foundation.h>
#import "BabyProtocol.h"

@class Nanny, Studnet;

/*
什么是代理设计模式
心相印 和 超市
超市就是 心相印 的代理，它可以帮助心相印卖纸巾
也就是说，代理也帮助另外一个类做一些事情

代理设计模式的应用场景
1.当A对象想监听B对象的一些变化，可以使用代理设计模式
    保姆想监听婴儿的变化，那么保姆就可以成为婴儿的代理，
    当婴儿发生变化之后保姆就可以监听到

2.当B对象发生一些事情，想通知A对象，可以使用代理设计模式
    婴儿想通知保姆，那么就可以让保姆成为婴儿的代理，
    只要保姆成为婴儿的代理，以后婴儿发生变化就可以通知保姆
 
3.当对象A无法处理某些行为的使用，想让对象B帮忙处理（让对象B成为对象A的代理对象）
    婴儿无法自己吃东西，也无法自己入睡，所以可以让保姆帮忙处理，
    只要让保姆成为婴儿的代理，就可以帮可以帮婴儿喂它吃东西和哄他睡觉
*/
@interface Baby : NSObject

// 饥饿程度
@property (nonatomic,assign) int hungry;
// 睡意
@property (nonatomic,assign) int sleep;

// 吃东西
-(void)food;
// 困了
-(void)sleepy;

// 让婴儿拥有一个保姆
//@property (nonatomic, strong) Nanny *nanny;
//@property (nonatomic, strong) Studnet *stu;

// 如果使用id类型来接收保姆, 如果将来换保姆了, 婴儿类不用修改代码
@property (nonatomic, strong) id<BabyProtocol> nanny;


@end