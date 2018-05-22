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
@end
