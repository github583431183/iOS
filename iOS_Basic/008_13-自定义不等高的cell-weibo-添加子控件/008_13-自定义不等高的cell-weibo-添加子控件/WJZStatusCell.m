//
//  WJZStatusCell.m
//  008_12_自定义不等高的cell-weibo-搭建基本框架
//
//  Created by 吴佳臻 on 2018/5/10.
//  Copyright © 2018年 wjz. All rights reserved.
//

#import "WJZStatusCell.h"

@interface WJZStatusCell ()

@property(nonatomic,weak)UIImageView *iconImageView;
@property(nonatomic,weak)UILabel *nameLabel;
@property(nonatomic,weak)UIImageView *vipImageView;
@property(nonatomic,weak)UILabel *text_Label;
@property(nonatomic,weak)UIImageView *pictureImageView;

@end

@implementation WJZStatusCell

// 添加子控件的原则:把所有 有可能显示的子控件都先添加进去
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        //图像
        UIImageView *iconImageView = [[UIImageView alloc]init];
        [self.contentView addSubview:iconImageView];
        self.iconImageView = iconImageView;
        
        //配图
        UIImageView *pictureImageView = [[UIImageView alloc]init];
        [self.contentView addSubview:pictureImageView];
        self.pictureImageView = pictureImageView;
        
        //vip
        UIImageView *vipImageView = [[UIImageView alloc] init];
        [self.contentView addSubview:vipImageView];
        self.vipImageView = vipImageView;
        
        //昵称
        UILabel *nameLabel = [[UILabel alloc] init];
        [self.contentView addSubview:nameLabel];
        self.nameLabel = nameLabel;
        
        //正文
        UILabel *text_Label = [[UILabel alloc] init];
        [self.contentView addSubview:text_Label];
        self.text_Label = text_Label;
    }
    return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
}

-(void)setStatus:(WJZStatus *)status{
    _status = status;
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
