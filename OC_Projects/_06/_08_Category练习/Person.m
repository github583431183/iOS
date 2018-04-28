#import "Person.h"
#import "NSString+NJ.h"

@implementation Person
-(void)test{
   NSString *str=@"fds64jkl43fjdslkf";
    int count =[NSString countWithStr:str];
    NSLog(@" count= %i",count);
}
@end
