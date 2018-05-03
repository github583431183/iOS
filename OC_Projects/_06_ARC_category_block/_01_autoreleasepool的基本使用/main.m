#import <Foundation/Foundation.h>
#import "Person.h"
int main(int argc, const char * argv[]) {
	//1. 没使用 autoreleasepool 之前
	@autoreleasepool {

         Person *p  =[[Person alloc] init];
         
         [p run];
         
         // 时时刻刻都关注对象什么时候被释放
         [p release];
         p = nil;
         
         // 给野指针发送消息
         [p run];

    }

    //2.autoreleasepool 的基本使用
    @autoreleasepool { // 创建一个自动释放池
        Person *p = [[Person alloc] init]; // 1
        // 不用关心对象什么时候释放, 只要能够 访问p 的地方都可以 使用p
        p = [p autorelease]; // 只要调用了 autorelease, 那么就不用调用release了
        
        [p retain]; // 2
        
        [p run];
    } // 自动释放池销毁了, 给 自动释放池 中所有的对象发送 一条release消息，\
    	p 被 retain 了 所以此时 是1，并没有销毁 p 对象

    //3. autorelease其它写法
    @autoreleasepool {
//        Person *p = [[Person alloc] init];
//        p = [p autorelease];
        Person *p  = [[[Person alloc] init] autorelease];
        [p run];
    }

    //4. iOS 5.0前,创建一个自动释放池
    // 自动释放池只是将release延迟了而已
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    //-------------------
    Person *p = [[[Person alloc] init] autorelease];
    [p run];
    //-------------------
    // 销毁一个自动释放池
    [pool release];

    return 0;
}