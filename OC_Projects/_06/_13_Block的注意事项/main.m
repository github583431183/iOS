#import <Foundation/Foundation.h>
#import "Person.h"

int main(int argc, const char * argv[]) {

    //1.block中可以访问外面的变量
    int a = 10;
    void (^aBlock)() = ^{
         NSLog(@"a = %i", a);
    };
    aBlock();

    //2.block中可以定义和外界同名的变量，\
        并且如果在block中定义了和外界同名的变量, \
        在block中访问的是block中的变量
    int b = 10;
    void (^bBlock)()=^{
        int b = 20;
        NSLog(@"a = %i", b);
    };
    bBlock();

    //3.默认情况下, 不可以在block中修改外界变量的值 \
        因为block中的变量和外界的变量并不是同一个变量 \
        如果block中访问到了外界的变量, block会将外界的变量 copy 一份到堆内存中 \
        因为block中使用的外界变量是copy的,  \
            所以在调用之前修改外界变量的值, 不会影响到block中copy的值

    int c =10;
    NSLog(@"&c = %p", &c);
    void (^cBlock)() = ^{
        //c = 50;
        NSLog(@"&c = %p", &c);
        NSLog(@"c = %i", c);
    };
    c = 20;
    cBlock();
    NSLog(@"a = %i", a);

    int d = 10; // 如果没有添加__block是值传递

     __block int dd = 10;
    void (^ddBlock)() = ^{
        dd = 310;
        NSLog(@"a = %i", dd);
    };
    NSLog(@"a = %i,值被 ddBlock 修改", dd);
    ddBlock();

    /* block是存储在堆中还是栈中
        1. 默认情况下block存储在 栈中, 如果对block进行一个 copy 操作, block会转移到 堆中
            1. 如果 block在 栈 中, block中访问了 外界的对象, 那么不会对 外界对象 进行retain 操作
            2. 但是如果block在 堆 中, block中访问了 外界的对象, 那么会对 外界对象 进行一次retain
        2. 如果在block中访问了 外界对象, 一定要给对象加上 __block,
        3. 只要加上了 __block, 哪怕block在 堆 中, 也不会对 外界对象进行retain 
        4. 如果是在 ARC 开发中就需要在前面加上__weak
     */
    __block Person *pB = [[Person alloc] init]; // 1
     // 如果在做iOS开发时, 在 ARC 开发中不这样写容易导致循环引用
    Person *p = [[Person alloc] init];
    __weak Person *weakP = p;

    //NSLog(@"retainCount = %lu", [p retainCount]);
    void (^myBlock)() = ^{
        NSLog(@"p = %@", p); // 2
        NSLog(@"p = %p", weakP);
        //NSLog(@"block retainCount = %lu", [p retainCount]);
    };
    //Block_copy(myBlock);
    myBlock();
    
    //[p release]; // 1
    
    
    return 0;
}
