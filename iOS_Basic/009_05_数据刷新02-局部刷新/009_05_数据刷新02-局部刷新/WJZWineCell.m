//
//  WJZWineCell.m
//  009_04_数据刷新01-全局刷新
//
//  Created by 吴佳臻 on 2018/5/11.
//  Copyright © 2018年 wjz. All rights reserved.
//

#import "WJZWineCell.h"
#import "WJZWine.h"
@implementation WJZWineCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setWine:(WJZWine *)wine{
    _wine = wine;
    self.textLabel.text = wine.name;
    self.imageView.image = [UIImage imageNamed:wine.image];
    self.detailTextLabel.text = [NSString stringWithFormat:@"¥%@",wine.money];
}
@end
