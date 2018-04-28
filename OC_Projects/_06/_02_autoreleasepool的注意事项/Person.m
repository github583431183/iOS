#import "Person.h"

@implementation Person

- (void)run
{
    NSLog(@"%s", __func__);
}

- (void)dealloc
{
    NSLog(@"%s", __func__);
    [super dealloc];
}
@end