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
        [self.contentView addSubview:iconImageView];
        self.iconImageView = iconImageView;
        
        UILabel *titleLabel = [[UILabel alloc]init];
        [self.contentView addSubview:titleLabel];
        self.titleLabel = titleLabel;
        
        UILabel *priceLabel = [[UILabel alloc]init];
        [self.contentView addSubview:priceLabel];
        self.priceLabel = priceLabel;
        
        UILabel *buyCountLabel = [[UILabel alloc]init];
        [self.contentView addSubview:buyCountLabel];
        self.buyCountLabel = buyCountLabel;
    }
    return self;
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
