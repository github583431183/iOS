#import "NSString+NJ.h"

@implementation NSString (NJ)



-(int)countWithStr:(NSString *)str{
    int count=0;
    for (int i=0; i< str.length; i++) {
        unichar c=[str characterAtIndex:i];
        if (c>='0'&& c<='9') {
            count++;
        }
    }
}



-(int)count{
    int number=0;
    for (int i= 0; i< self.length; ++i) {
        unichar c=[self characterAtIndex:i];
        if(c>='0'&& c<='0');
        number ++;       
    }
}
@end
