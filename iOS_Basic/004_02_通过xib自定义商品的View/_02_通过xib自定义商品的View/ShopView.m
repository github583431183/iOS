//
//  ShopView.m
//  _02_通过xib自定义商品的View
//
//  Created by 吴佳臻 on 2018/1/13.
//  Copyright © 2018年 wjz. All rights reserved.
//

#import "ShopView.h"

@interface ShopView ()

@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

// 测试 label
@property (weak, nonatomic) UILabel *label;
// 毛玻璃
@property (weak, nonatomic) UIToolbar *toolBar;
@end

@implementation ShopView

/*
xib使用注意事项：
 1. 如果一个view从xib中加载，就不能用
        [[xxx alloc] init]
        和
        [[xxx alloc] initWithFrame:]
        创建
 2. 如果一个xib经常被使用，应该提供快速构造类方法
 3. 如果一个view从xib中加载：
    用代码添加一个子控件，需要在 initWithCoder: 和 awakeFromNib 创建
 4. 如果一个view从xib中加载，会调用initWithCoder: 和 awakeFromNib,
    不会调用 init 和 initWithFrame: 方法
*/

/*
 如果 view 从 xib 中加载，
 就不会调用
    init
    和
    initWithFrame:
    方法
 */
- (instancetype)init{
    if(self = [super init]){
        NSLog(@"%s",__func__);
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame{
    if(self = [super initWithFrame:frame]){
        NSLog(@"%s",__func__);
    }
    return self;
}

/*
 如果 View 从 xib 中加载，
 就会调用
    initWithCoder:方法
 创建子控件
    注意：如果子控件从 xib 中创建，是处于未唤醒状态的
 */
-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    if(self = [super initWithCoder:aDecoder]){
        /*
        UILabel *label = [[UILabel alloc] init];
        label.backgroundColor = [UIColor grayColor];
        label.text = @"哈哈";
        [self addSubview:label];
        self.label = label;
         */
        NSLog(@"1");
    }
    return self;
}

#pragma mark - xib的加载原理
- (UIView *)loadfromNib{
    ShopView *shopView = [[ShopView alloc] initWithCoder:nil];
    shopView.frame = CGRectMake(0, 0, 80, 100);
    
    UIImageView *iconView = [[UIImageView alloc] initWithCoder:nil];
    iconView.backgroundColor = [UIColor greenColor];
    iconView.frame = CGRectMake(0, 0, 80, 80);
    iconView.tag = 100;
    [shopView addSubview:iconView];
    self.iconView = iconView;
    
    UILabel *label = [[UILabel alloc] initWithCoder:nil];
    label.tag = 200;
    [shopView addSubview:label];
    self.titleLabel = label;
    
    return shopView;
}

/*
 从xib中唤醒
 添加 xib 中创建的子控件 的子控件
 */
- (void)awakeFromNib{
    [super awakeFromNib];
    // 往imageView 上加毛玻璃
    UIToolbar *toolbar = [[UIToolbar alloc] init];
    [self.iconView addSubview:toolbar];
    self.toolBar = toolbar;
    NSLog(@"2");
}

#pragma mark - 快速构造方法
+ (instancetype)shopView{
    return [[[NSBundle mainBundle]
             loadNibNamed:@"ShopView" //此处加载 xib 文件不需要写文件的后缀名
             owner:nil options:nil] firstObject];
}

#pragma mark - 布局子控件
- (void)layoutSubviews{
    [super layoutSubviews];
    self.toolBar.frame = //self.bounds 子view的bounds
        self.iconView.bounds;
}

#pragma mark - 设置数据
- (void)setIcon:(NSString *)icon{
    self.iconView.image = [UIImage imageNamed:icon];
}
- (void)setName:(NSString *)name{
    self.titleLabel.text = name;
}

@end
