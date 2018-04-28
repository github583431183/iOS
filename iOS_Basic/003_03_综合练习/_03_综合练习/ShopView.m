//
//  ShopView.m
//  _03_综合练习
//
//  Created by 吴佳臻 on 2018/1/12.
//  Copyright © 2018年 wjz. All rights reserved.
//

#import "ShopView.h"
#import "Shop.h"

@interface ShopView ()

// 图片控件
//@property (nonatomic, weak) UIImageView *iconView;

// 标题控件
//@property (nonatomic, weak) UILabel *titleLabel;

// 图片控件
@property (weak, nonatomic) IBOutlet UIImageView *iconView;

// 标题控件
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;


@end

@implementation ShopView
/*
 初始化控件（不要设置frame)
 */
//- (instancetype)init{
//    if(self = [super init]){
//        // 0.获取当前控件的尺寸
//        CGFloat width = self.frame.size.width;
//        CGFloat height = self.frame.size.height;
//        NSLog(@"init:%f----%f", width, height);
//
//        // 1.创建商品的UIImageView对象
//        UIImageView *iconView = [[UIImageView alloc] init];
////        iconView.frame = CGRectMake(0, 0, width, width);
//        iconView.backgroundColor = [UIColor blueColor];
//        [self addSubview:iconView];
////        self.iconView = iconView;
//        _iconView = iconView;
//
//        // 2.创建商品标题对象
//        UILabel *titleLabel = [[UILabel alloc] init];
////        titleLabel.frame = CGRectMake(0, width, width, height - width);
//        titleLabel.backgroundColor = [UIColor yellowColor];
//        titleLabel.textAlignment = NSTextAlignmentCenter;
//        [self addSubview:titleLabel];
////        self.titleLabel = titleLabel;
//        _titleLabel = titleLabel;
//    }
//    return self;
//}

-(instancetype)init{
    if(self = [super init]){
        [self setUp];
    }
    return self;
}
/*
 注意：
    创建对象用
        [[xxx alloc] init]方法
        和
        [[xxx alloc] initWithFrame]:方法
    都会调用
        initWithFrame:
 */
- (instancetype)initWithFrame:(CGRect)frame{
    if(self = [super initWithFrame:frame]){
        [self setUp];
    }
    return self;
}

-(instancetype)initWithShop:(Shop *)shop{
    if(self = [super init]){
        // 注意：先创建后赋值
        [self setUp];
        self.shop = shop;
    }
    return self;
}
+(instancetype)shopViewWithShop:(Shop *)shop{
    return [[self alloc] initWithShop:shop];
}

+(instancetype)shopView{
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil] firstObject];
}

/**
 初始化
 */
- (void)setUp{
    //1.创建商品的 UIImageView对象
    UIImageView *iconView = [[UIImageView alloc] init];
    iconView.backgroundColor = [UIColor blueColor];
    [self addSubview:iconView];
    _iconView = iconView;
    //2. 创建商品标题对象
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.backgroundColor = [UIColor yellowColor];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:titleLabel];
    _titleLabel = titleLabel;
}

/**
 重写 @property 生成的 set方法
 set方法：只要外边传数据就会调用
 所用：设置数据
 */
- (void)setShop:(Shop *)shop{
    _shop = shop;
    
    // 设置数据
    self.iconView.image = [UIImage imageNamed:shop.icon];
    self.titleLabel.text = shop.name;
}

/**
 布局子控件（可以拿到frame）
 */
- (void)layoutSubviews{
    // 0.一定要调用super
    [super layoutSubviews];
    
//    // 1.获取当前控件的尺寸
//    CGFloat width = self.frame.size.width;
//    CGFloat height = self.frame.size.height;
//    
//    // 2.设置子控件的frame
//    self.iconView.frame = CGRectMake(0, 0, width, height);
//    self.titleLabel.frame = CGRectMake(0, width, width, height - width);
}

- (void)setIcon:(NSString *)icon{
    // 设置数据
    self.iconView.image = [UIImage imageNamed:icon];
}

- (void)setName:(NSString *)name{
    // 设置数据
    self.titleLabel.text = name;
}
@end
