//
//  ViewController.m
//  _03_综合练习
//
//  Created by 吴佳臻 on 2018/1/12.
//  Copyright © 2018年 wjz. All rights reserved.
//

#import "ViewController.h"
#import "Shop.h"
#import "ShopView.h"
#import "ButtonShopView.h"
@interface ViewController ()

//购物车
@property (weak, nonatomic) IBOutlet UIView *shopCarView;
//添加按钮
@property (weak, nonatomic) IBOutlet UIButton *addButton;
//删除按钮
@property (weak, nonatomic) IBOutlet UIButton *removeButton;
// 数据数组
@property (strong,nonatomic) NSArray *dataArr;

// 提示文字
@property (weak, nonatomic) IBOutlet UILabel *showHUB;

@end

@implementation ViewController

/*
 懒加载
    1.作用:
        1.用到的时候在加载
        2.全局只会被加载一次
        3.全局可以使用
    2.过程
        1.重写成员变量的get方法
        2.在get方法中判断：
            1.如果为空，加载数据
            2.如果不为空，就直接返回数据
 */
/*
    类前缀
    // Foundation
    NSString;
    NSArray;
    NSDictionary;
    NSURL;

    // UIKit
    UIView;
    UIImageView;
    UISwitch;
*/
- (NSArray *)dataArr{
    if(_dataArr == nil){
        // 加载数据
//        self.dataArr = @[
//                         @{@"name":@"单肩包", @"icon":@"danjianbao"},
//                         @{@"name":@"钱包", @"icon":@"qianbao"},
//                         @{@"name":@"链条包", @"icon":@"liantiaobao"},
//                         @{@"name":@"手提包", @"icon":@"shoutibao"},
//                         @{@"name":@"双肩包", @"icon":@"shuangjianbao"},
//                         @{@"name":@"斜挎包", @"icon":@"xiekuabao"}
//                         ];
        
        //1. 获取 plist 的全路径
        NSString *dataPath = [[NSBundle mainBundle] pathForResource:@"shopData.plist" ofType:nil];
        self.dataArr = [NSArray arrayWithContentsOfFile:dataPath];
        // 将字典转模型
        // 创建临时可变数组
        NSMutableArray *tempArray = [NSMutableArray array];
        for (NSDictionary *dict in _dataArr) {
            // 创建shop对象
            // 对象方法
            //Shop *shop = [[Shop alloc] initWithIcon:dict[@"icon"] name:[@"name"]];
            // 类方法
            //Shop *shop = [Shop shopWithIcon:dict[@"icon"] name:dict[@"name"]];
            Shop *shop = [Shop shopWithIcon:dict];
            // 把模型装入数组
            [tempArray addObject:shop];
        }
        self.dataArr = tempArray;
    }
    return _dataArr;
}
/**
 添加购物车
 */
- (IBAction)add:(UIButton *)button {
    //*****1.定义一些常量
    //1.总列数
    NSInteger allCols = 3;
    //2.商品的宽度和高度
    CGFloat width = 80;
    CGFloat height = 100;
    //3.求出水平间距和垂直间距
    CGFloat hMargin = (self.shopCarView.frame.size.width - allCols * width) / (allCols -1);
    CGFloat vMargin = (self.shopCarView.frame.size.height - 2 * height);
    //4.设置索引
    NSInteger index = self.shopCarView.subviews.count;
    //5.求出x值
    CGFloat x = (hMargin + width) * (index % allCols);
    CGFloat y = (vMargin + height) * (index / allCols);
    
    //*****2.创建一个商品
    /*
    //1.创建商品view
    UIView *shopView = [[UIView alloc] init];
    //2.设置frame
    shopView.frame = CGRectMake(x, y, width, height);
    //3.设置背景颜色
    shopView.backgroundColor = [UIColor greenColor];
    //4.添加购物车
    [self.shopCarView addSubview:shopView];
    
    //5.创建商品的UIImageView对象
    UIImageView *iconView = [[UIImageView alloc] init];
    iconView.frame = CGRectMake(0, 0, width, width);
    iconView.backgroundColor = [UIColor blueColor];
    [shopView addSubview:iconView];
    
    //6.创建商品标题对象
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.frame = CGRectMake(0, width, width, height - width);
    titleLabel.backgroundColor = [UIColor yellowColor];
    titleLabel.textAlignment = NSTextAlignmentCenter; //居中
    [shopView addSubview:titleLabel];
    
     */
    //ShopView *shopView = [[ShopView alloc] init];
     //ShopView *shopView = [ShopView shopView];
    ButtonShopView *shopView = [[ButtonShopView alloc] init];
//    ShopView *shopView = [ShopView shopViewWithShop:self.dataArr[index]];
    shopView.frame = CGRectMake(x, y, width, height);
    shopView.shop = self.dataArr[index];
    [self.shopCarView addSubview:shopView];
     
    //*****3.设置数据
    //数值数据
    //方式一：（不可取：数据都是一样的）
//    iconView.image = [UIImage imageNamed:@"danjianbao"];
//    titleLabel.text = @"单肩包";
    
    //方式二：（不可取：太冗余）
//    if(index == 0){
//        iconView.image = [UIImage imageNamed:@"danjianbao"];
//        titleLabel.text = @"单肩包";
//    }else if (index == 1){
//        iconView.image = [UIImage imageNamed:@"qianbao"];
//        titleLabel.text = @"钱包";
//    }else if (index == 2){
//        iconView.image = [UIImage imageNamed:@"danjianbao"];
//        titleLabel.text = @"单肩包";
//    }else if (index == 3){
//        iconView.image = [UIImage imageNamed:@"danjianbao"];
//        titleLabel.text = @"单肩包";
//    }else if (index == 4){
//        iconView.image = [UIImage imageNamed:@"danjianbao"];
//        titleLabel.text = @"单肩包";
//    }else if (index == 5){
//        iconView.image = [UIImage imageNamed:@"danjianbao"];
//        titleLabel.text = @"单肩包";
//    }
    //方式三：（数组：两个数组之间没有任何联系，容易出错）
//    NSArray<NSString *> *imageNames = @[@"danjianbao", @"qianbao", @"liantiaobao", @"shoutibao", @"shuangjianbao", @"xiekuabao"];
//    NSArray<NSString *> *titleNames = @[@"单肩包", @"钱包", @"链条包", @"手提包", @"双肩包", @"斜挎包"];
//    // 设置数据
//    iconView.image = [UIImage imageNamed:imageNames[index]];
//    titleLabel.text = titleNames[index];
    //方式四：（数组 + 字典）
    NSArray<NSDictionary *> *dataArr = @[
                                         @{@"name":@"单肩包", @"icon":@"danjianbao"},
                                         @{@"name":@"钱包", @"icon":@"qianbao"},
                                         @{@"name":@"链条包", @"icon":@"liantiaobao"},
                                         @{@"name":@"手提包", @"icon":@"shoutibao"},
                                         @{@"name":@"双肩包", @"icon":@"shuangjianbao"},
                                         @{@"name":@"斜挎包", @"icon":@"xiekuabao"}
                                         ];
    // 设置数据
//    NSDictionary *dict = self.dataArr[index];
//    iconView.image = [UIImage imageNamed:dict[@"icon"]];
//    titleLabel.text = dict[@"name"];
//    Shop *shop = self.dataArr[index];
//    iconView.image = [UIImage imageNamed:shop.icon];
//    titleLabel.text = shop.name;
//    shopView.iconView.image = [UIImage imageNamed:shop.icon];
//    shopView.titleLabel.text = shop.name;

//    [shopView setIcon:shop.icon];
//    [shopView setName:shop.name];
    
    //*****4.设置按钮状态
    button.enabled = (index!=5);
    //5.设置删除按钮的状态
    self.removeButton.enabled = YES;

    //*********4.设置HUB的状体啊
    if (index == 5) {
        [self showWithInfo:@"当前购物车已满,不要买买买~"];
    }
}

/**
 从购物车中删除
 */
- (IBAction)remove:(UIButton *)sender {
    //1.删除最后一个商品
    // 获取最后一个view
    UIView *lastShopView = [self.shopCarView.subviews lastObject];
    [lastShopView removeFromSuperview];
    //2.设置添加按钮的状态
    self.addButton.enabled = YES;
    //3.设置删除按钮的状态
    self.removeButton.enabled = (self.shopCarView.subviews.count !=0);
    
    //4.设置HUB的状态
    if (self.shopCarView.subviews.count == 0) {
        [self showWithInfo:@"当前购物车已空，赶紧买买买～"];
    }
}

- (void)showWithInfo:(NSString *)info{
    [UIView animateWithDuration:2.0 animations:^{
        self.showHUB.text = info;
        self.showHUB.alpha = 1.f;
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:1.0 delay:1.0 options:UIViewAnimationOptionCurveLinear animations:^{
            self.showHUB.alpha = 0;
        } completion:nil];
    }];
}


@end
