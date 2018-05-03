#import <Foundation/Foundation.h>
#import "Person.h"

int main(int argc, const char * argv[]) {

	Person *p = [[Person alloc] init];
    @autoreleasepool {
        
        // 2.在自动释放池中创建了对象, 一定要调用autorelease,才会将对象放入自动释放池中
        
        // 3.只要在自动释放池中调用autorelease, 就会将对象放入自动释放池
        p = [p autorelease];
        [p run];
    }
    // 1.一定要在 自动释放池 中调用autorelease, 才会将对象放入自动释放池中
//    Person *p = [[[Person alloc] init] autorelease];

    // 4.一个程序中可以创建 N个自动释放池, 并且 自动释放池 还可以嵌套
    // 如果存在 多个 自动释放池的时候, 自动释放池是以 "栈" 的形式存储的
    // 栈的特点: 先进后出
    
    // 给一个对象方法发送一条 autorelease 消息, 永远 会将对象放到 栈顶 的自动释放池
    @autoreleasepool { // 创建第一个释放池
        @autoreleasepool { // 创建第二个释放池
            @autoreleasepool { // 创建第三个释放池
                Person *p = [[[Person alloc] init] autorelease];
                [p run];
            } // 第三个释放池销毁
            
            Person *p = [[[Person alloc] init] autorelease];
            
        }// 第二个释放池销毁
    }// 第一个释放池销毁

 	@autoreleasepool {
        // 千万不要写 多次 autorelease
        // 一个 alloc/new 对应一个autorelease
//        Person *p = [[[[Person alloc] init] autorelease] autorelease];
        
        // 如果写了autorelease就不要写release
        // 总之记住: 一个alloc/new对应一个autorelease或者release
        Person *p = [[[Person alloc] init] autorelease];
        [p release];
    }

	return 0;
}