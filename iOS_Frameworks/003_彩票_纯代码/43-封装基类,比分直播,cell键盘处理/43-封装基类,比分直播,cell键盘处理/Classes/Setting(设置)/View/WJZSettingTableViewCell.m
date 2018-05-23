//
//  WJZSettingTableViewCell.m
//  39-自定义cell
//
//  Created by 吴佳臻 on 2018/5/23.
//  Copyright © 2018年 wjz. All rights reserved.
//

#import "WJZSettingTableViewCell.h"

@implementation WJZSettingTableViewCell

+(instancetype)cellWithTableView:(UITableView *)tablewView{
    static NSString *ID = @"cell";
    WJZSettingTableViewCell *cell = [tablewView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[WJZSettingTableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID];
    }
    return cell;
}

-(void)setItem:(WJZSettingItem *)item{
    _item = item;
    //1.设置数据
    self.imageView.image = item.icon;
    self.textLabel.text = item.title;
    self.detailTextLabel.text = item.subTitle;
    //2.设置右侧视图
    [self setupRightView];
}

-(void)setupRightView{
    if ([_item isKindOfClass:[WJZSettingArrowItem class]]) {
        //右侧视图箭头
        self.accessoryView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"arror_right"]];
    }else if([_item isKindOfClass:[WJZSettingSwitchItem class]]){
        WJZSettingSwitchItem *swItem = (WJZSettingSwitchItem *)_item;
        //右侧视图开关
        UISwitch *sw = [[UISwitch alloc] init];
        sw.on = swItem.isOn;
        
        self.accessoryView = sw;
    }else{
        self.accessoryView = nil;
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
