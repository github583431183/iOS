//
//  WJZTestCell.m
//  008_11_静态cell
//
//  Created by 吴佳臻 on 2018/5/9.
//  Copyright © 2018年 wjz. All rights reserved.
//

#import "WJZTestCell.h"

@interface WJZTestCell ()

@property(nonatomic,weak)IBOutlet UISwitch *s;

@end

@implementation WJZTestCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.s.on = NO;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)s:(id)sender {
}
@end
