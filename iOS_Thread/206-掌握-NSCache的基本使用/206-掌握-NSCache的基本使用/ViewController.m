//
//  ViewController.m
//  206-掌握-NSCache的基本使用
//
//  Created by 吴佳臻 on 2018/6/4.
//  Copyright © 2018年 wjz. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <NSCacheDelegate>
@property(nonatomic,strong)NSCache *cache;
@end

@implementation ViewController

-(NSCache *)cache{
    if (!_cache) {
        _cache = [[NSCache alloc] init];
        //总成本数是5，如果发现存在的数据超过成本那么会自动回收之前的对象
        _cache.totalCostLimit = 5;
        _cache.delegate = self;
    }
    return _cache;
}

- (IBAction)addBtnClick:(id)sender {
    //存数据
    //NSCache的Key只是对，对象进行Strong引用，不是拷贝(和可变字典的区别)
    for (NSInteger i = 0; i < 10; i++) {
        NSString *str = @"123";
        //cost:成本
        [self.cache setObject:str forKey:@(i) cost:1];
        NSLog(@"存数据%zd",i);
    }
}
- (IBAction)checkBtnClick:(id)sender {
    NSLog(@"+++++++++++++++");
    for (NSInteger i = 0; i < 10; i ++) {
        NSString *str = [self.cache objectForKey:@(i)];
        if (str) {
            NSLog(@"取出数据%zd",i);
        }
    }
}
- (IBAction)removeBtnClick:(id)sender {
    //删除数据
    [self.cache removeAllObjects];
}

#pragma mark NSCacheDelegate
-(void)cache:(NSCache *)cache willEvictObject:(id)obj{
    NSLog(@"回收%zd",[obj length]);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
