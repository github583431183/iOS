#import <Foundation/Foundation.h>
#import "Person.h"
#import "Student.h"
#import "Teacher.h"

int main(int argc, const char * argv[]) {

    Person *p = [Person new];
    [p playFootball];
    [p playBasketball];
    [p playBaseball];
    
    Student *stu = [Student new];
    [stu playBaseball];
    
    
    Teacher *tea = [Teacher new];
    [tea playBasketball];
    
    return 0;
}
