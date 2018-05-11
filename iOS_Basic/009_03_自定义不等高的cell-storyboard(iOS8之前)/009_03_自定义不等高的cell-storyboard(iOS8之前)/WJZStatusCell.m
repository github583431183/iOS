//
//  WJZStatusCell.m
//  008_12_自定义不等高的cell-weibo-搭建基本框架
//
//  Created by 吴佳臻 on 2018/5/10.
//  Copyright © 2018年 wjz. All rights reserved.
//

#import "WJZStatusCell.h"
#import "WJZStatus.h"
@interface WJZStatusCell ()

@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UIImageView *pictureImageView;

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *vipImageView;
@property (weak, nonatomic) IBOutlet UILabel *text_Label;


@end
@implementation WJZStatusCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
    }
    return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
}

-(void)setStatus:(WJZStatus *)status{
    _status = status;
    
    self.iconImageView.image = [UIImage imageNamed:status.icon];
    self.nameLabel.text = status.name;
    if (status.isVip) {
        self.nameLabel.textColor = [UIColor orangeColor];
        self.vipImageView.hidden = NO;
    }else{
        self.nameLabel.textColor = [UIColor blackColor];
        self.vipImageView.hidden = YES;
    }
    self.text_Label.text = status.text;
    if (status.picture) {
        self.pictureImageView.hidden = NO;
        self.pictureImageView.image = [UIImage imageNamed:status.picture];
        
    }else{
        self.pictureImageView.hidden = YES;
        
    }
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    //手动设置文字的最大高度(让Label能够计算出自己最真实的尺寸)
    self.text_Label.preferredMaxLayoutWidth = [UIScreen mainScreen].bounds.size.width - 20;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(CGFloat)cellHeight{
    //强势刷新(Label根据约束自动计算他的宽度和高度)
    [self layoutIfNeeded];
    CGFloat cellHeight = 0;
    if (self.status.picture) {
        cellHeight = CGRectGetMaxY(self.pictureImageView.frame) + 10;
    }else{
        cellHeight = CGRectGetMaxY(self.text_Label.frame) + 10;
    }
    return cellHeight;
}
@end
