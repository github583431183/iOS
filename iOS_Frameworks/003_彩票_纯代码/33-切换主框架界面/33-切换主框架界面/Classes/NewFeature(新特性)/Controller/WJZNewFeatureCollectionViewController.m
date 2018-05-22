//
//  WJZNewFeatureCollectionViewController.m
//  28-UICollectionView简单介绍
//
//  Created by 吴佳臻 on 2018/5/22.
//  Copyright © 2018年 wjz. All rights reserved.
//

#import "WJZNewFeatureCollectionViewController.h"
#import "WJZNewFeatureCollectionViewCell.h"
@interface WJZNewFeatureCollectionViewController ()

@property(nonatomic,assign)CGFloat lastOffsetX;
@property(nonatomic,weak)UIImageView *guide;

@end

@implementation WJZNewFeatureCollectionViewController

static NSString * const reuseIdentifier = @"Cell";

-(instancetype)init{
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    //修改item的大小
    //flowLayout.itemSize = CGSizeMake(100, 100);
    flowLayout.itemSize = [UIScreen mainScreen].bounds.size;
    //修改行间距
    flowLayout.minimumLineSpacing = 0;
    //修改每一个item的间距
    flowLayout.minimumInteritemSpacing = 0;
    //修改滚动方向
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    //修改每一组的边距
    //flowLayout.sectionInset = UIEdgeInsetsMake(100, 20, 30, 40);
    return [super initWithCollectionViewLayout:flowLayout];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Register cell classes
    [self.collectionView registerClass:[WJZNewFeatureCollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor yellowColor];
    self.collectionView.backgroundColor = [UIColor redColor];
    
    //设置分页
    self.collectionView.pagingEnabled = YES;
    //禁止弹簧效果
    self.collectionView.bounces = NO;
    //隐藏滚动条
    self.collectionView.showsHorizontalScrollIndicator = NO;
    //添加内容
    //1.添加图片
    //2.添加到哪里 collectionView
    [self setupAddChildImageView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/**
 滑动减速的时候调用
 */
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    NSLog(@"%s, line = %d", __FUNCTION__, __LINE__);
    
    //平移一个屏幕的宽度
    
    //总偏移量
    CGFloat offestX = scrollView.contentOffset.x;
    
    NSLog(@"总偏移量 %f",offestX);
    
    // 计算一个偏移量
    CGFloat del = offestX - self.lastOffsetX;
    NSLog(@"一个偏移量 %f",del);
    
    // 切换图片
    // 计算页码
    NSInteger page = offestX / del;
    
    NSString *name = [NSString stringWithFormat:@"guide%ld",page + 1];
    self.guide.image = [UIImage imageNamed:name];
    
    // 偏移子控件
    self.guide.x += del * 2;
    
    [UIView animateWithDuration:0.25 animations:^{
        self.guide.x -= del;
    }];
    
    self.lastOffsetX = offestX;
}

-(void)setupAddChildImageView{
    //1.线
    UIImageView *guideLine = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"guideLine"]];
    [self.collectionView addSubview:guideLine];
    //调整线的位置
    guideLine.x -= 150;
    //2.球
    UIImageView *guide = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"guide1"]];
    [self.collectionView addSubview:guide];
    guide.x += 50;
    self.guide = guide;
    //3.大标题
    UIImageView *guideLargeText = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"guideLargeText1"]];
    [self.collectionView addSubview:guideLargeText];
    guideLargeText.center = CGPointMake(self.view.width / 2, self.view.height * 0.7f );    
    // 4.小标题 guideSmallText
    UIImageView *guideSmallText = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"guideSmallText1"]];
    [self.collectionView addSubview:guideSmallText];
    guideSmallText.center = CGPointMake(self.view.width / 2, self.view.height * 0.8f );
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
#warning Incomplete implementation, return the number of sections
    return 1;
}

#define XMGPage 4

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of items
    return XMGPage;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    WJZNewFeatureCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    // Configure the cell

    cell.backgroundColor = [UIColor blueColor];

    //cell创建出来就有imageView
    //创建image
    //拼接图片名字
    NSString *name = [NSString stringWithFormat:@"guide%ldBackground",indexPath.item + 1];
    
    UIImage *image = [UIImage imageNamed:name];
    cell.image = image;
    [cell setIndexPath:indexPath count:XMGPage];
    
    return cell;
}

#pragma mark <UICollectionViewDelegate>

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end
