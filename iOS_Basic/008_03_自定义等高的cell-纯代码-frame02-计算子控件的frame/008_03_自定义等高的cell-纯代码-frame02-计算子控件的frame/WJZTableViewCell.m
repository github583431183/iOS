//
//  WJZTableViewCell.m
//  008_02_自定义等高的cell-纯代码-frame01-添加子控件
//
//  Created by 吴佳臻 on 2018/5/7.
//  Copyright © 2018年 wjz. All rights reserved.
//

#import "WJZTableViewCell.h"

@interface WJZTableViewCell()

@property(nonatomic,weak)UIImageView *iconImageView;
@property(nonatomic,weak)UILabel *titleLabel;
@property(nonatomic,weak)UILabel *priceLabel;
@property(nonatomic,weak)UILabel *buyCountLabel;

@end

@implementation WJZTableViewCell

/**
 在这个方法中添加所有的子控件
 */
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        UIImageView *iconImageView = [[UIImageView alloc]init];
        iconImageView.backgroundColor = [UIColor redColor];
        [self.contentView addSubview:iconImageView];
        self.iconImageView = iconImageView;
        
        UILabel *titleLabel = [[UILabel alloc]init];
        titleLabel.backgroundColor = [UIColor blueColor];
        [self.contentView addSubview:titleLabel];
        self.titleLabel = titleLabel;
        
        UILabel *priceLabel = [[UILabel alloc]init];
        priceLabel.backgroundColor = [UIColor yellowColor];
        [self.contentView addSubview:priceLabel];
        self.priceLabel = priceLabel;
        
        UILabel *buyCountLabel = [[UILabel alloc]init];
        buyCountLabel.backgroundColor = [UIColor orangeColor];
        [self.contentView addSubview:buyCountLabel];
        self.buyCountLabel = buyCountLabel;
    }
    return self;
}

/**
 设置所有的子控件的frame
 */
-(void)layoutSubviews{
    [super layoutSubviews];
    
    CGFloat space = 10;
    CGFloat contentViewW = self.contentView.frame.size.width;
    CGFloat contentViewH = self.contentView.frame.size.height;
    
    //图标
    CGFloat iconX = space;
    CGFloat iconY = space;
    CGFloat iconW = 80;
    CGFloat iconH = contentViewH - 2 * space;
    self.iconImageView.frame = CGRectMake(iconX, iconY, iconW, iconH);
    
    /** 标题 */
    CGFloat titleX = iconX + iconW + space;
    CGFloat titleY = iconY;
    CGFloat titleW = contentViewW - titleX - space;
    CGFloat titleH = 20;
    self.titleLabel.frame = CGRectMake(titleX, titleY, titleW, titleH);
    
    /** 价格 */
    CGFloat priceW = 100;
    CGFloat priceH = 15;
    CGFloat priceX = titleX;
    CGFloat priceY = iconY + iconH - priceH;
    self.priceLabel.frame = CGRectMake(priceX, priceY, priceW, priceH);
    
    /** 购买数 */
    CGFloat buyW = 150;
    CGFloat buyH = 14;
    CGFloat buyX = contentViewW - buyW - space;
    CGFloat buyY = iconY + iconH - buyH;
    self.buyCountLabel.frame = CGRectMake(buyX, buyY, buyW, buyH);
}



@end
