#import <Foundation/Foundation.h>

@interface Person : NSObject

@property (nonatomic, assign) int age;

+ (instancetype)person;

- (instancetype)initWithAge:(int)age;

+ (instancetype)personWithAge:(int)age;
@end
