//
//  ViewController.m
//  008_02_自定义等高的cell-纯代码-frame01-添加子控件
//
//  Created by 吴佳臻 on 2018/5/7.
//  Copyright © 2018年 wjz. All rights reserved.
//

#import "ViewController.h"
#import "WJZTgCell.h"
#import "WJZTg.h"
#import "MJExtension.h"

@interface ViewController ()
@property(nonatomic,strong)NSArray *tgs;
@end

@implementation ViewController

-(NSArray *)tgs{
    if (!_tgs) {
        _tgs = [WJZTg mj_objectArrayWithFilename:@"tgs.plist"];
    }
    return _tgs;
}

//NSString *ID = @"tg";

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.rowHeight = 70;
    
    // Do any additional setup after loading the view, typically from a nib.
    
    //[self.tableView registerClass:[WJZTgCell class] forCellReuseIdentifier:ID];
    //[self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([WJZTgCell class]) bundle:nil] forCellReuseIdentifier:ID];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 数据源方法
//@required

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.tgs.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row % 2 == 0) {
        static NSString *ID = @"tg";
        WJZTgCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
        cell.tg = self.tgs[indexPath.row];
        return cell;
    }else{
        return [tableView dequeueReusableCellWithIdentifier:@"test"];
    }
    
}

//@optional


@end
