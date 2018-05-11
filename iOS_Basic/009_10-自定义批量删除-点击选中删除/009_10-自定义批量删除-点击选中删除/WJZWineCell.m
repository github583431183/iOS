//
//  WJZWineCell.m
//  009_04_数据刷新01-全局刷新
//
//  Created by 吴佳臻 on 2018/5/11.
//  Copyright © 2018年 wjz. All rights reserved.
//

#import "WJZWineCell.h"
#import "WJZWine.h"
@interface WJZWineCell ()

/** 打钩控件 */
@property (nonatomic, weak) UIImageView *checkedImageView;

@end
@implementation WJZWineCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        // 添加打钩控件
        UIImageView *checkedImageView = [[UIImageView alloc] init];
        checkedImageView.hidden = YES;
        checkedImageView.image = [UIImage imageNamed:@"check"];
        [self.contentView addSubview:checkedImageView];
        self.checkedImageView = checkedImageView;
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    // 设置打钩的位置和尺寸
    CGFloat WH = 24;
    CGFloat X = self.contentView.frame.size.width - WH - 10;
    CGFloat Y = (self.contentView.frame.size.height - WH) * 0.5;
    self.checkedImageView.frame = CGRectMake(X, Y, WH, WH);
    
    // 调整textLabel的宽度
    CGRect frame = self.textLabel.frame;
    frame.size.width = self.contentView.frame.size.width - WH - 20 - self.textLabel.frame.origin.x;
    self.textLabel.frame = frame;
}


-(void)setWine:(WJZWine *)wine{
    _wine = wine;
    self.textLabel.text = wine.name;
    self.imageView.image = [UIImage imageNamed:wine.image];
    self.detailTextLabel.text = [NSString stringWithFormat:@"¥%@",wine.money];
    // 根据模型的checked属性确定打钩控件显示还是隐藏
    if (wine.isCheched) {
        self.checkedImageView.hidden = NO;
    } else {
        self.checkedImageView.hidden = YES;
    }
}
@end
