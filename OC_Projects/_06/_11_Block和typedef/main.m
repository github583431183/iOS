#import <Foundation/Foundation.h>

// 指向函数的指针
int sum(int value1, int value2)
{
    return value1 + value2;
}

int minus(int value1, int value2)
{
    return value1 - value2;
}

// 使用 typedef 给 函数指针 取别名
typedef int (*calculte)(int, int);

// 使用 typedef 给 block 去别名
typedef int (^calculteBlock)(int,int);

int main(int argc, const char * argv[]) {

    int (*sumP)(int,int);
    sumP = sum;
    calculte cSumP =sum;
    NSLog(@"sum = %i", cSumP(20, 10));

    int (*minusP)(int, int);
    minusP = minus;
    calculte cMinusP = minus;
    NSLog(@"minus = %i", cMinusP(20, 10));

    // block
    //int (^sumBlock)(int , int );
    calculteBlock sumBlock = ^int (int v1,int v2){
        return v1+v2;
    };
    NSLog(@"sum = %i", sumBlock(20, 10));
    //int (^minusBlock)(int , int);
    calculteBlock minusBlock = ^int (int v1,int v2){
        return v1-v2;
    };
    
    NSLog(@"minus = %i", minusBlock(20, 10));
    return 0;
}
