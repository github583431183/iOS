#import <Foundation/Foundation.h>
#import "Person.h"

int main(int argc, const char * argv[]) {

	/*
	ARC机制下有几个明显的标志:
		1.不允许调用对象的 release方法
		2.不允许调用 autorelease方法
		3.再重写父类的dealloc方法时,不能再调用 [super dealloc];
	*/

 	/*
 	// MRC 方式
	Person *p = [[[Person alloc] init] autorelease];
    //默认情况下所有的指针都是强指针
	Person *p = [[Person alloc] init];
	[p retain];
	[p release];
     */
    

    // ARC的判断准则: 只要 没有 强指针指向对象, 对象就会释放
    // 默认情况下所有的指针都是强指针
    Person *p = [[Person alloc] init];
    p = nil;
        
   	__strong Person *p = [[Person alloc] init];
    // 弱指针
    __weak Person *p2 = p;
    p = nil;
        
    // 在开发中, 千万不要使用一个 弱指针 保存一个刚刚创建的对象
    // 该对象会 立即释放
    __weak Person *p = [[Person alloc] init];        
    }

     // 不用写release, main函数执行完毕后p会被 自动释放
    Person *p = [[Person alloc] init];
    return 0;

}