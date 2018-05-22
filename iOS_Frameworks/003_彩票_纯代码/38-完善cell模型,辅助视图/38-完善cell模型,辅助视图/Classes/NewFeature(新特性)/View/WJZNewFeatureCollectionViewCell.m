//
//  WJZNewFeatureCollectionViewCell.m
//  29-新特性界面动画上
//
//  Created by 吴佳臻 on 2018/5/22.
//  Copyright © 2018年 wjz. All rights reserved.
//

#import "WJZNewFeatureCollectionViewCell.h"
#import "WJZTabBarViewController.h"
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
        
        [button addTarget:self action:@selector(buttonOnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _startBtn;
}
-(void)buttonOnClick:(UIButton *)button{
    //点击立即体验按钮的时候就会调用
    
    // 切换主界面
    // 切换界面方式  1.push 2.tabBarVC  3.modale
    
    // 想让新特性界面销毁
    // 切换窗口的跟控制器
    WJZTabBarViewController *tabBarVC = [[WJZTabBarViewController alloc] init];
    
    WJZKeyWindow.rootViewController = tabBarVC;
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
