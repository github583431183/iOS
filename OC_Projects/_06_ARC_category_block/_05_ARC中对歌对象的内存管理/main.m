#import <Foundation/Foundation.h>
#import "Person.h"
#import "Dog.h"
int main(int argc, const char * argv[]) {
	// ARC下 单对象 内存管理
 	@autoreleasepool {
        Person *p = [[Person alloc] init];
         p = nil; // 执行到这一行, 由于没有强指针指向对象, 所以对象被释放

        // p是弱指针, 对象会被立即释放
        __weak Person *p1 = [[Person alloc] init];

    } // 执行到这一行局部变量p释放
    // 由于没有强指针指向对象, 所以对象也释放


    Person *p = [[Person alloc] init];
    Dog *d = [[Dog alloc] init];
    p.dog = d;
    d.owner = p;
    
    d = nil;
    
    NSLog(@"-----");
    
    p = nil;
    
    return 0;
}
