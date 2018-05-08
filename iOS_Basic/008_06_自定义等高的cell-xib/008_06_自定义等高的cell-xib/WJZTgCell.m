//
//  WJZTgCell.m
//  008_06_自定义等高的cell-xib
//
//  Created by 吴佳臻 on 2018/5/8.
//  Copyright © 2018年 wjz. All rights reserved.
//

#import "WJZTgCell.h"
#import "WJZTg.h"
@interface WJZTgCell ()
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UILabel *buyCountLabel;

@end

@implementation WJZTgCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    NSLog(@"%s",__func__);
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
    NSLog(@"%s",__func__);
}

-(void)setTg:(WJZTg *)tg{
    _tg = tg;
    self.iconImageView.image = [UIImage imageNamed:tg.icon];
    self.titleLabel.text = tg.title;
    self.priceLabel.text = [NSString stringWithFormat:@"¥%@",tg.price];
    self.buyCountLabel.text = [NSString stringWithFormat:@"%@人已经购买",tg.buyCount];
}

@end
