#import "Person.h"

@interface Person ()
{
    int _age;
}

- (void)say;

@end

@implementation Person
//{
//    int _age;
//}

-(void)eat
{
    NSLog(@"%s", __func__);
}

- (void)say
{
    NSLog(@"age = %i", _age);
}
@end
