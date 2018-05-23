//
//  ViewController.m
//  005-掌握-线程安全
//
//  Created by 吴佳臻 on 2018/5/23.
//  Copyright © 2018年 wjz. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property(nonatomic,strong)NSThread *threadA;
@property(nonatomic,strong)NSThread *threadB;
@property(nonatomic,strong)NSThread *threadC;
@property(nonatomic,assign)NSInteger totalCount;
@end

@implementation ViewController

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    //设置中票数
    self.totalCount = 100;
    self.threadA = [[NSThread alloc] initWithTarget:self selector:@selector(saleTicket) object:nil];
    self.threadB = [[NSThread alloc] initWithTarget:self selector:@selector(saleTicket) object:nil];
    self.threadC = [[NSThread alloc] initWithTarget:self selector:@selector(saleTicket) object:nil];
    
    self.threadA.name = @"售票员A";
    self.threadB.name = @"售票员B";
    self.threadC.name = @"售票员C";
    
    //启动线程
    @synchronized(self) {
        [self.threadA start];
        [self.threadB start];
        [self.threadC start];
    }
}

-(void)saleTicket{
    while (1) {
        //锁:必须是全局唯一的
        //1.注意加锁的位置
        //2.注意加锁的前提条件，多线程共享同一块资源
        //3.注意加锁是需要代价的，需要耗费性能
        //4.加锁的结果:线程同步
        
        @synchronized(self){
            //线程1
            //线程2
            //线程3
            NSInteger count = self.totalCount;
            if (count > 0) {
                
                for (NSInteger i = 0; i<1000000; i++) {
                }
                
                self.totalCount = count -1;
                //卖出一张票
                NSLog(@"%@卖出去了一张票,还剩下%zd张票", [NSThread currentThread].name,self.totalCount);
            }else{
                NSLog(@"不要回公司上班了");
                break;
            }
        }
    }
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
