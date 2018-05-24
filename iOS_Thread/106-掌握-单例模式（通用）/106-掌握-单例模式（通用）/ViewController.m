//
//  ViewController.m
//  106-掌握-单例模式（通用）
//
//  Created by 吴佳臻 on 2018/5/24.
//  Copyright © 2018年 wjz. All rights reserved.
//

#import "ViewController.h"
#import "Tool.h"
#import "DownloadTool.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//单例不能使用继承
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    
    NSLog(@"%@---%@",[[DownloadTool alloc]init],[DownloadTool shareDownloadTool]);
    //<DownloadTool: 0x60400001f5e0>---<DownloadTool: 0x60400001f5e0>
    
    Tool *t1 = [[Tool alloc]init];
    
    Tool *t2 = [[Tool alloc]init];
    
    Tool *t3 = [Tool new];
    Tool *t4 = [Tool shareTool];
    Tool *t5 = [t1 copy];
    Tool *t6 = [t1 mutableCopy];
    NSLog(@"t1:%@ t2:%@ t3:%p t4:%p t5:%p t6:%p",t1,t2,t3,t4,t5,t6);
    //t1:<Tool: 0x60000001f370> t2:<Tool: 0x60000001f370> t3:0x60000001f370 t4:0x60000001f370 t5:0x60000001f370 t6:0x60000001f370

}

@end
