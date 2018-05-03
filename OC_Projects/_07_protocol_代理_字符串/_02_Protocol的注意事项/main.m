#import <Foundation/Foundation.h>
#import "Person.h"
#import "Sutdent.h"

int main(int argc, const char * argv[]) {

    Person *p = [Person new];
    [p playBasketball];
    [p study];
    
    Sutdent *stu = [Sutdent new];
    [stu playBasketball];
    
    return 0;
}
