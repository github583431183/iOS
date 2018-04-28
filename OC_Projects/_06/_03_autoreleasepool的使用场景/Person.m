#import "Person.h"

@implementation Person

+ (instancetype)person
{
    return [[[self alloc] init] autorelease];
}


- (instancetype)initWithAge:(int)age{
    if (self = [super init]) {
        _age = age;
    }

    return self;
}

+ (instancetype)personWithAge:(int)age
{
    /*
    Person *p = [[self alloc] init];
    p.age = age;
    return [p autorelease];
     */
    return [[[self alloc] initWithAge:age] autorelease];// 类工厂方法，默认添加autorelease
}

- (void)dealloc
{
    NSLog(@"%s", __func__);
    [super dealloc];
}
@end
