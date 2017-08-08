//
//  ZXGuideViewController.m
//  ZXLottery
//
//  Created by zhixiongchen on 2017/8/7.
//  Copyright © 2017年 zhixiongchen. All rights reserved.
//

#import "ZXGuideViewController.h"
#import "ZXGuideCell.h"
#import "UIView+Frame.h"
#import "ZXTabBarController.h"
@interface ZXGuideViewController ()
@property (nonatomic ,weak)UIImageView * largeImageView;
@property (nonatomic,weak)UIImageView * largeTextImageView;
@property (nonatomic,weak)UIImageView * smallTextImageView;
@property (nonatomic,assign)int page;
@end

@implementation ZXGuideViewController

static NSString * const reuseIdentifier = @"guide_cell";
- (instancetype)init
{
    //创建个水流效果的Layout
    UICollectionViewFlowLayout * layout=[[UICollectionViewFlowLayout alloc]init];
    //设置item的大小
    layout.itemSize=kScreenSize.size;
    //设置间距
    layout.minimumLineSpacing=0;
    //设置滑动的方向
    layout.scrollDirection=UICollectionViewScrollDirectionHorizontal;
    return [super initWithCollectionViewLayout:layout];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    //注册单元格
    [self.collectionView registerClass:[ZXGuideCell class] forCellWithReuseIdentifier:reuseIdentifier];
    //设置分页效果
    self.collectionView.pagingEnabled=YES;
    //取消下面的滚动条
    self.collectionView.showsHorizontalScrollIndicator=NO;
    //取消弹性的效果
    self.collectionView.bounces=NO;
    //创建大图片
    UIImageView * largeImageView=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"guide1"]];
    largeImageView.x=20;
    //创建大文字
    UIImageView * largeTextImageView=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"guideLargeText1"]];
    largeTextImageView.y=KScreenHeight*0.75;
    largeTextImageView.x=30;
    //创建小文字
    UIImageView * smallTextImageView=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"guideSmallText1"]];
    smallTextImageView.y=KScreenHeight*0.85;
    smallTextImageView.x=30;
    [self.collectionView addSubview:largeImageView];
     [self.collectionView addSubview:largeTextImageView];
     [self.collectionView addSubview:smallTextImageView];
    self.largeImageView=largeImageView;
    self.largeTextImageView=largeTextImageView;
    self.smallTextImageView=smallTextImageView;
    UIImage * image=[UIImage imageNamed:@"guideLine"];
    UIImageView * lineImage=[[UIImageView alloc]initWithImage:image];
    lineImage.y=40;
    lineImage.x=-60;
    [self.collectionView addSubview:lineImage];
    //创建一个立即体验的按钮
    UIButton * enterButton=[[UIButton alloc]init];
    [enterButton setBackgroundImage:[UIImage imageNamed:@"guideStart"] forState:UIControlStateNormal];
    [enterButton sizeToFit];
    enterButton.x=3*KScreenWidth+(KScreenWidth-enterButton.w)*0.5;
    enterButton.y=KScreenHeight*0.9;
    [self.collectionView addSubview:enterButton];
    //监听立即体验的点击事件
    [enterButton addTarget:self action:@selector(enterClick) forControlEvents:UIControlEventTouchUpInside];
}
-(void)enterClick
{
    ZXTabBarController * tabbarController=[[ZXTabBarController alloc]init];
    //获取主窗口，也可以通过self.view.window来做
    UIWindow * window=[UIApplication sharedApplication].keyWindow;
    window.rootViewController=tabbarController;
}
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 4;
}
-(ZXGuideCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    //从缓存池中去找
    ZXGuideCell * cell=[collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    NSString * imageName=[NSString stringWithFormat:@"guide%zdBackground",indexPath.row+1];
    UIImage * image=[UIImage imageNamed:imageName];
    //把数据传给Cell，这个数据可能是模型，可能是数组，可能是字典
    cell.image=image;
    return cell;
}
//监听 collectionView 滑动完成(scrollView减速完成)
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    //获取scrollView的偏移量
    CGFloat offsetX=scrollView.contentOffset.x;
    //获取当前页数
    int page=offsetX / KScreenWidth;
    //换张图片
    NSString * largeImageName=[NSString stringWithFormat:@"guide%zd",page+1];
     NSString * largeTextImageName=[NSString stringWithFormat:@"guideLargeText%zd",page+1];
     NSString * smallTextImageName=[NSString stringWithFormat:@"guideSmallText%zd",page+1];
    if(self.page>page)
    {
        //从左往右翻就是上一页的效果，要让大图那些也从左往右过来
        self.largeImageView.x=offsetX-KScreenWidth;
        self.largeTextImageView.x=offsetX-KScreenWidth;
        self.smallTextImageView.x=offsetX-KScreenWidth;
    }
    else
    {
        //从右往左翻就是下一页的效果，这样的话图片就从右往左过来了。就是先让图片到下下个屏幕的位置，然后再动画效果过来。
        self.largeImageView.x=offsetX+KScreenWidth;
        self.largeTextImageView.x=offsetX+KScreenWidth;
        self.smallTextImageView.x=offsetX+KScreenWidth;
    }
    self.largeImageView.image= [UIImage imageNamed:largeImageName];
    self.largeTextImageView.image=[UIImage imageNamed:largeTextImageName];
    self.smallTextImageView.image=[UIImage imageNamed:smallTextImageName];
    //添加动画效果
    [UIView animateWithDuration:0.25 animations:^{
        //把偏移量设置给imageView
        self.largeImageView.x=offsetX+20;
        self.largeTextImageView.x=offsetX+20;
        self.smallTextImageView.x=offsetX+20;
    }];
    self.page=page;
}
@end
