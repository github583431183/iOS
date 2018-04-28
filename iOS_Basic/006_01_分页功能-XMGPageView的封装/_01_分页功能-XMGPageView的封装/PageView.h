//
//  PageView.h
//  _01_分页功能-XMGPageView的封装
//
//  Created by 吴佳臻 on 2018/1/16.
//  Copyright © 2018年 wjz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PageView : UIView

// 图片名数据
@property (strong, nonatomic) NSArray *imageNames;

+ (instancetype)pageView;

@end
