#import <Foundation/Foundation.h>

@class Person;
@interface Dog : NSObject

//@property(nonatomic, strong)Person *owner;
//@property(nonatomic, assign)Person *owner;
// 在ARC中如果保存对象不要用 assign, 用weak
// ARC和MRC一样, 如果A拥有B, B也拥有A, 那么必须一方使用弱指针
// assign是专门用于保存基本数据类型的, 如果保存对象用weak
// Person 强引用了 Dog , 如果 Dog 再 强引用 Person 会出现循环引用
@property(nonatomic, weak)Person *owner;
@end
