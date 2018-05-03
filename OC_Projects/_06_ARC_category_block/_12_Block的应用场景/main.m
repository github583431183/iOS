#import <Foundation/Foundation.h>

// 当发现代码的前面和后面都是一样的时候, 这个时候就可以使用block
void goToWork(void (^workBlock)()){
    NSLog(@"起床");
    NSLog(@"穿衣服");
    NSLog(@"洗漱");
    NSLog(@"喝早茶");
    NSLog(@"驾车去上班");
    
    // 不一样
    workBlock();
    
    NSLog(@"收拾东西");
    NSLog(@"驾车回家");
    NSLog(@"吃晚饭");
    NSLog(@"洗澡");
    NSLog(@"睡觉");
}

void goToWorkInDay1(){
    goToWork(^{
        NSLog(@"认识新同事");
    });
}
void goToWorkInDay2()
{
    goToWork(^{
        NSLog(@"熟悉公司代码");
    });
}
void goToWorkInDay3()
{
    goToWork(^{
        NSLog(@"开始编写代码");
    });
}
void goToWorkInDay4()
{
    goToWork(^{
        NSLog(@"应用程序上架");
    });
}

int main(int argc, const char * argv[]) {
    goToWorkInDay2();
    return 0;
}
