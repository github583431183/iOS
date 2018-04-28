#import <Foundation/Foundation.h>
#import "Person.h"

int main(int argc, const char * argv[]) {

	@autoreleasepool {

		/*
		//场景一：
		Person *p = [[[Person alloc] init] autorelease];
        p.age = 10;
        NSLog(@"age = %i", p.age);
        
        Person *p1 = [[[Person alloc] init] autorelease];
        
        Person *p2 = [[[Person alloc] init] autorelease];

		*/

		// 场景二：
        Person *p = [Person person];
        p.age = 10;
        NSLog(@"age = %i", p.age);
        
         // 注意: Foundation框架的类, 但凡是通过 类工厂方法 \
         		创建的对象都是autorelease的
        [[NSString alloc] init];
        [NSString string];
        
//        [NSString alloc] initWithString:<#(NSString *)#>
//        [NSString stringWithString:<#(NSString *)#>];

		/*
//        Person *p = [[[Person alloc] initWithAge:10] autorelease];
//        NSLog(@"age = %i", p.age);
        
        Person *p = [Person personWithAge:10];
        NSLog(@"age = %i", p.age);
         */
 	}
    return 0;	
}