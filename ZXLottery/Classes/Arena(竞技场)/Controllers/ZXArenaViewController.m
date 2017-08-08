//
//  ZXArenaViewController.m
//  ZXLottery
//
//  Created by zhixiongchen on 2017/8/5.
//  Copyright © 2017年 zhixiongchen. All rights reserved.
//

#import "ZXArenaViewController.h"

@interface ZXArenaViewController ()

@end

@implementation ZXArenaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //设置控制器的背景颜色，以拉伸的形式
    self.view.layer.contents=(__bridge id)[UIImage imageNamed:@"NLArenaBackground"].CGImage;
    //设置导航栏的图片
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"NLArenaNavBar64"] forBarMetrics:UIBarMetricsDefault];
//    UIBarMetricsDefault, //横屏竖屏都显示
//    UIBarMetricsCompact,//横屏显示，竖屏不显示
//    UIBarMetricsDefaultPrompt = 101,//有副标题的时候竖屏显示，横屏不显示
//    UIBarMetricsCompactPrompt,//有副标题的时候竖屏不显示，横屏显示
    //用代码的方式去获取在storyboard中是titleView的控件
    UISegmentedControl * seg=(UISegmentedControl *)self.navigationItem.titleView;
    //设置默认的背景颜色
    [seg setBackgroundImage:[UIImage imageNamed:@"CPArenaSegmentBG"] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    //设置被选中的图片
    [seg setBackgroundImage:[UIImage imageNamed:@"CPArenaSegmentSelectedBG"] forState:UIControlStateSelected barMetrics:UIBarMetricsDefault];
    //设置文字的颜色
    //正常情况下
    [seg setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]} forState:UIControlStateNormal];
    //被选中的情况下
     [seg setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]} forState:UIControlStateSelected];
    //让seg中间的线不为蓝色
    [seg setTintColor:[UIColor clearColor]];
                                  
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
