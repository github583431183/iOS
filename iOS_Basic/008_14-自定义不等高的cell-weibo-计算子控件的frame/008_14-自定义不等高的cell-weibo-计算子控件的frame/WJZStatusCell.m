//
//  WJZStatusCell.m
//  008_12_自定义不等高的cell-weibo-搭建基本框架
//
//  Created by 吴佳臻 on 2018/5/10.
//  Copyright © 2018年 wjz. All rights reserved.
//

#import "WJZStatusCell.h"
#import "WJZStatus.h"
#define WJZTextFont [UIFont systemFontOfSize:14]
#define WJZNameFont [UIFont systemFontOfSize:14]
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
    CGFloat space = 10;
    //图像
    CGFloat iconX = space;
    CGFloat iconY = space;
    CGFloat iconWH = 30;
    self.iconImageView.frame = CGRectMake(iconX, iconY, iconWH, iconWH);
    
    //昵称
    CGFloat nameX = CGRectGetMaxX(self.iconImageView.frame) + space;
    CGFloat nameY = iconY;
    //计算昵称文字的尺寸
    NSDictionary *nameAtt = @{NSFontAttributeName : WJZNameFont};
    CGSize nameSize = [self.status.name sizeWithAttributes:nameAtt];
    CGFloat nameW = nameSize.width;
    CGFloat nameH = nameSize.height;
    self.nameLabel.frame = CGRectMake(nameX, nameY, nameW, nameH);
    
    //vip
    if (self.status.isVip) {
        CGFloat vipX = CGRectGetMaxX(self.nameLabel.frame) + space;
        CGFloat vipW = 14;
        CGFloat vipH = nameH;
        CGFloat vipY = nameY;
        self.vipImageView.frame = CGRectMake(vipX, vipY, vipW, vipH);
    }
    
    /** 正文 */
    CGFloat textX = iconX;
    CGFloat textY = CGRectGetMaxY(self.iconImageView.frame) + space;
    CGFloat textW = self.contentView.frame.size.width - 2 * space;
    NSDictionary *textAtt = @{NSFontAttributeName : XMGTextFont};
    // 最大宽度是textW,高度不限制
    CGSize textSize = CGSizeMake(textW, MAXFLOAT);
    CGFloat textH = [self.status.text boundingRectWithSize:textSize options:NSStringDrawingUsesLineFragmentOrigin attributes:textAtt context:nil].size.height;
    self.text_Label.frame = CGRectMake(textX, textY, textW, textH);
    
    /** 配图 */
    if (self.status.picture) { // 有配图
        CGFloat pictureWH = 100;
        CGFloat pictureX = iconX;
        CGFloat pictureY = CGRectGetMaxY(self.text_Label.frame) + space;
        self.pictureImageView.frame = CGRectMake(pictureX, pictureY, pictureWH, pictureWH);
    }
}

-(void)setStatus:(WJZStatus *)status{
    _status = status;
    self.iconImageView.image = [UIImage imageNamed:status.icon];
    self.nameLabel.text = status.name;
    
    if (status.isVip) {
        self.nameLabel.textColor = [UIColor orangeColor];
        self.vipImageView.hidden = NO;
    } else {
        self.vipImageView.hidden = YES;
        self.nameLabel.textColor = [UIColor blackColor];
    }
    
    self.text_Label.text = status.text;
    
    if (status.picture) { // 有配图
        self.pictureImageView.hidden = NO;
        self.pictureImageView.image = [UIImage imageNamed:status.picture];
    } else { // 无配图
        self.pictureImageView.hidden = YES;
    }
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
