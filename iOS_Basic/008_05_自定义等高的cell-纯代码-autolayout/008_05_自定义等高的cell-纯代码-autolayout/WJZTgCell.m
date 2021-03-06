//
//  WJZTgCell.m
//  008_04_自定义等高的cell-纯代码-frame03-设置数据
//
//  Created by 吴佳臻 on 2018/5/7.
//  Copyright © 2018年 wjz. All rights reserved.
//

#import "WJZTgCell.h"
#import "WJZTg.h"

//define this constant if you want to use Masonry without the 'mas_' prefix
#define MAS_SHORTHAND

//define this constant if you want to enable auto-boxing for default syntax
#define MAS_SHORTHAND_GLOBALS
#import "Masonry.h"

@interface WJZTgCell ()

/** 图标 */
@property (nonatomic, weak) UIImageView *iconImageView;

/** 标题 */
@property (nonatomic, weak) UILabel *titleLabel;

/** 价格 */
@property (nonatomic, weak) UILabel *priceLabel;

/** 购买数 */
@property (nonatomic, weak) UILabel *buyCountLabel;

@end

@implementation WJZTgCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
//        /** 图标 */
//        UIImageView *iconImageView = [[UIImageView alloc] init];
//        [self.contentView addSubview:iconImageView];
//        self.iconImageView = iconImageView;
//
//        /** 标题 */
//        UILabel *titleLabel = [[UILabel alloc] init];
//        [self.contentView addSubview:titleLabel];
//        self.titleLabel = titleLabel;
//
//        /** 价格 */
//        UILabel *priceLabel = [[UILabel alloc] init];
//        priceLabel.textColor = [UIColor orangeColor];
//        priceLabel.font = [UIFont systemFontOfSize:15];
//        [self.contentView addSubview:priceLabel];
//        self.priceLabel = priceLabel;
//
//        /** 购买数 */
//        UILabel *buyCountLabel = [[UILabel alloc] init];
//        buyCountLabel.textAlignment = NSTextAlignmentRight;
//        buyCountLabel.textColor = [UIColor lightGrayColor];
//        buyCountLabel.font = [UIFont systemFontOfSize:14];
//        [self.contentView addSubview:buyCountLabel];
//        self.buyCountLabel = buyCountLabel;
        
        CGFloat space = 10;
        UIImageView *iconImageView = [[UIImageView alloc]init];
        [self.contentView addSubview:iconImageView];
        self.iconImageView = iconImageView;
        [iconImageView makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.equalTo(self.contentView).offset(space);
            make.bottom.equalTo(self.contentView).offset(-space);
            make.width.equalTo(80);
        }];
        
        UILabel *titleLabel = [[UILabel alloc]init];
        [self.contentView addSubview:titleLabel];
        self.titleLabel = titleLabel;
        [titleLabel makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(iconImageView.top);
            make.left.equalTo(iconImageView.right).offset(space);
            make.right.equalTo(self.contentView).offset(-space);
            make.height.equalTo(20);
        }];
        /** 价格 */
        UILabel *priceLabel = [[UILabel alloc] init];
        priceLabel.textColor = [UIColor orangeColor];
        priceLabel.font = [UIFont systemFontOfSize:15];
        [self.contentView addSubview:priceLabel];
        self.priceLabel = priceLabel;
        [priceLabel makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(titleLabel.left);
            make.bottom.equalTo(iconImageView.bottom);
            make.size.equalTo(CGSizeMake(100, 15));
        }];
        
        /** 购买数 */
        UILabel *buyCountLabel = [[UILabel alloc] init];
        buyCountLabel.textAlignment = NSTextAlignmentRight;
        buyCountLabel.textColor = [UIColor lightGrayColor];
        buyCountLabel.font = [UIFont systemFontOfSize:14];
        [self.contentView addSubview:buyCountLabel];
        self.buyCountLabel = buyCountLabel;
        [buyCountLabel makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(iconImageView.bottom);
            make.right.equalTo(titleLabel.right);
            make.size.equalTo(CGSizeMake(150, 14));
            
        }];
    }
    return self;
}

//- (void)layoutSubviews{
//    [super layoutSubviews];
//    CGFloat space = 10;
//    //    CGFloat contentViewW = self.contentView.frame.size.width;
//    CGFloat contentViewW = CGRectGetWidth(self.contentView.frame);
//    //    CGFloat contentViewH = self.contentView.frame.size.height;
//    CGFloat contentViewH = CGRectGetHeight(self.contentView.frame);
//
//    /** 图标 */
//    CGFloat iconX = space;
//    CGFloat iconY = space;
//    CGFloat iconW = 80;
//    CGFloat iconH = contentViewH - 2 * space;
//    self.iconImageView.frame = CGRectMake(iconX, iconY, iconW, iconH);
//
//    /** 标题 */
//    //    CGFloat titleX = iconX + iconW + space;
//    CGFloat titleX = CGRectGetMaxX(self.iconImageView.frame) + space;
//    CGFloat titleY = iconY;
//    CGFloat titleW = contentViewW - titleX - space;
//    CGFloat titleH = 20;
//    self.titleLabel.frame = CGRectMake(titleX, titleY, titleW, titleH);
//
//    /** 价格 */
//    CGFloat priceW = 100;
//    CGFloat priceH = 15;
//    CGFloat priceX = titleX;
//    //    CGFloat priceY = iconY + iconH - priceH;
//    CGFloat priceY = CGRectGetMaxY(self.iconImageView.frame) - priceH;
//    self.priceLabel.frame = CGRectMake(priceX, priceY, priceW, priceH);
//
//    /** 购买数 */
//    CGFloat buyW = 150;
//    CGFloat buyH = 14;
//    CGFloat buyX = contentViewW - buyW - space;
//    //    CGFloat buyY = iconY + iconH - buyH;
//    CGFloat buyY = CGRectGetMaxY(self.iconImageView.frame) - buyH;
//    self.buyCountLabel.frame = CGRectMake(buyX, buyY, buyW, buyH);
//
//}

/**
 *  设置子控件的数据
 */
- (void)setTg:(WJZTg *)tg
{
    _tg = tg;
    self.iconImageView.image = [UIImage imageNamed:tg.icon];
    self.titleLabel.text = tg.title;
    self.priceLabel.text = [NSString stringWithFormat:@"￥%@",tg.price];
    self.buyCountLabel.text = [NSString stringWithFormat:@"%@人已购买",tg.buyCount];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
