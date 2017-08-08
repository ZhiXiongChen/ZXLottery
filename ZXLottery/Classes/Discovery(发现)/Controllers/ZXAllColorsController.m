//
//  ZXAllColorsController.m
//  ZXLottery
//
//  Created by zhixiongchen on 2017/8/6.
//  Copyright © 2017年 zhixiongchen. All rights reserved.
//

#import "ZXAllColorsController.h"
#import "UIView+Frame.h"
@interface ZXAllColorsController ()
- (IBAction)allColorsClick:(id)sender;
@property(nonatomic,weak)UIView * blueView;
@property(nonatomic,weak)UIButton * button;
@property(nonatomic,weak)UIView * Coverview;
@end

@implementation ZXAllColorsController
-(UIView *)blueView
{
    if(!_blueView)
    {
        UIView * blueView=[[UIView alloc]init];
        blueView.frame=CGRectMake(0, 64, KScreenWidth, 0);
        blueView.backgroundColor=[UIColor whiteColor];
        [self.view addSubview:blueView];
        _blueView=blueView;
    }
    return _blueView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    //这里如果不调用，在执行动画的时候才去创建就会出现，view是从左上角开始显示下来的效果表示blueView是在动画里面进行创建
    [self blueView];
    //创建一个button，添加到blueView中
    UIButton * button=[[UIButton alloc]initWithFrame:CGRectMake(20, 20, 50, 50)];
    button.alpha=0;
    [button setBackgroundImage:[UIImage imageNamed:@"MoreWo"] forState:UIControlStateNormal];
    self.button=button;
    [self.blueView addSubview:button];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)allColorsClick:(UIButton *)sender {
    if(self.blueView.h==0)
    {
    //当点击展开的时候，创建一个覆盖的view
    UIView * Coverview=[[UIView alloc]initWithFrame:self.view.bounds];
    Coverview.backgroundColor=[UIColor blackColor];
    self.Coverview=Coverview;
    Coverview.alpha=0.3;
    [self.view addSubview:self.Coverview];
    [self.view bringSubviewToFront:self.blueView];
    }
    [UIView animateWithDuration:0.25 animations:^{
        //如果高度有值了就设置为0，否则设置为150
        self.blueView.h=self.blueView.h ? 0 : 150;
        //在自身的基础上转半圈
        sender.imageView.transform=CGAffineTransformRotate(sender.imageView.transform, M_PI);
        self.button.alpha=self.button.alpha ? 0 : 1;
        //判断弹出的框有没有要被收回去了
        if(self.blueView.h==0)
        {
            //使覆盖的view先让它透明度变为0，再从父控件中移除
            [UIView animateWithDuration:0.1 delay:0.2 options:UIViewAnimationOptionCurveLinear animations:^{
                self.Coverview.alpha=0;
            } completion:^(BOOL finished) {
                [self.Coverview removeFromSuperview];
            }];
        }
    }];
}
@end
