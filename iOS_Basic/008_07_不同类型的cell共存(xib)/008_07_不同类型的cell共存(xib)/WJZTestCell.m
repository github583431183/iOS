//
//  WJZTestCell.m
//  008_07_不同类型的cell共存(xib)
//
//  Created by 吴佳臻 on 2018/5/8.
//  Copyright © 2018年 wjz. All rights reserved.
//

#import "WJZTestCell.h"

@implementation WJZTestCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    NSLog(@"%s",__func__);
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
