#import <Foundation/Foundation.h>

// 1. 打印玫瑰花
void printRose(int num)
{
    for (int i = 0; i < num; ++i) {
        
        printf("  {@} \n");
        printf("   |  \n");
        printf("  \\|/ \n");
        printf("   | \n");
    }
}

// 2. 两个数相加
int sum(int value1, int value2)
{
    return value1 + value2;
}

int main(int argc, const char * argv[]) {


    /*
    打印玫瑰花：
    printf("  {@} \n");
    printf("   |  \n");
    printf("  \\|/ \n");
    printf("   |");
     */

    /*
    函数指针：
    void 代表 指向 的函数没有返回值
    () 代表指向的函数没有形参
    (*roseP)代表roseP是一个指向函数的指针
    */

    void (*rosep)(int);
    rosep = printRose;
    rosep(3);

    /*
    Block:
    定义一个 block 变量，
    block 和 函数一样，
    可以没有返回值，没有形参
    可以没有返回值，有形参
    可以有返回值  ，没有形参
    可以有返回值  ，有形参
    所以，在定义一个block变量的时候，
        也需要告诉该变量将来保存的代码有没有返回值和形参

    void 代表 block 将来保存的代码没有返回值
    () 代表 block 将来保存的代码没有形参
    (^roseBlock) 代表 roseBlock 是一个 block 变量，可以用于保存一段 block 代码
    */
    // 1. 定义一个 block 没有返回值，没有参数
    void (^roseBlock)();
    // 如果 block 没有参数，那么 ^ 后边的 () 可以省略
    roseBlock = ^(){ //^{ 省略模式
        printf("  {@} \n");
        printf("   |  \n");
        printf("  \\|/ \n");
        printf("   | \n");
    };
    // 要想执行 block 所保存的代码，必须调用 block 才会执行
    roseBlock();
    roseBlock();

    // 2. 定义一个 block 没有返回值，有参数
    void (^roseBlock2)(int);
    roseBlock2 = ^(int num){
        for(int i = 0;i<num;i++){
            printf("  {@} \n");
            printf("   |  \n");
            printf("  \\|/ \n");
            printf("   | \n");
        }
    };

    roseBlock2(10);

    // 函数指针：
    int (*sumP)(int,int);
    sumP = sum;
    NSLog(@"sum=%i",sumP(10,20));

    // block
    int (^sumBlock)(int,int);
    sumBlock = ^(int v1,int v2){
        return v1+v2;
    };
    NSLog(@"sum = %i", sumBlock(10, 40));

    // block 是一种 数据类型
    // 定义 有参数，有返回值的 block
    int (^printBlock)(int) = ^int (int num){
        for(int i = 0;i<num;i++){
            printf("------------\n");
        }
        return 1;
    };
    printBlock(2);

    return 0;
}
