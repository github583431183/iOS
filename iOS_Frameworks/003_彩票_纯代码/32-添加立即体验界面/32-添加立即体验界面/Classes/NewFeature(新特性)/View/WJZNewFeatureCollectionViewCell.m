//
//  WJZNewFeatureCollectionViewCell.m
//  29-新特性界面动画上
//
//  Created by 吴佳臻 on 2018/5/22.
//  Copyright © 2018年 wjz. All rights reserved.
//

#import "WJZNewFeatureCollectionViewCell.h"
@interface WJZNewFeatureCollectionViewCell ()

@property(nonatomic,weak)UIImageView *bgImageView;
@property(nonatomic,weak)UIButton *startBtn;

@end
@implementation WJZNewFeatureCollectionViewCell
-(UIImageView *)bgImageView{
    if (!_bgImageView) {
        UIImageView *imageVIew = [[UIImageView alloc] initWithFrame:self.bounds];
        [self.contentView addSubview:imageVIew];
        _bgImageView = imageVIew;
    }
    return _bgImageView;
}
-(void)setImage:(UIImage *)image{
    _image = image;
    self.bgImageView.image = image;
}
-(UIButton *)startBtn{
    if (!_startBtn) {
        UIButton *button = [[UIButton alloc] init];
        [button setBackgroundImage:[UIImage imageNamed:@"guideStart"] forState:UIControlStateNormal];
        [button sizeToFit];
        button.center = CGPointMake(self.width/2, self.height*0.9f);
        [self.contentView addSubview:button];
        _startBtn = button;
    }
    return _startBtn;
}
-(void)setIndexPath:(NSIndexPath *)indexPath count:(NSInteger)count{
    if (indexPath.item == count - 1 ) {
        // 最后一个cell
        // 当是最后一个cell添加立即体验按钮
        //        UIButton *button
        // 显示
        self.startBtn.hidden = NO;
        
    }else{
        // 不是最后一cell
        //        隐藏立即体验按钮
        self.startBtn.hidden = YES;
    }
}
@end
