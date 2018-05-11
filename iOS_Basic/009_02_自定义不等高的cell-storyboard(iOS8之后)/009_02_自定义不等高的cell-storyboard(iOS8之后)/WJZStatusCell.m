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
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *pictureHeight;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *pictureBottom;

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
        self.pictureHeight.constant = 100;
        self.pictureBottom.constant = 10;
    }else{
        self.pictureImageView.hidden = YES;
        self.pictureHeight.constant = 0;
        self.pictureBottom.constant = 0;
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
