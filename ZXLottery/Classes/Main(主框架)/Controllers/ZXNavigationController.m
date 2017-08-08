//
//  ZXNavigationController.m
//  ZXLottery
//
//  Created by zhixiongchen on 2017/8/5.
//  Copyright © 2017年 zhixiongchen. All rights reserved.
//

#import "ZXNavigationController.h"

@interface ZXNavigationController ()

@end

@implementation ZXNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    //设置navigationBar的背景图片
    [self.navigationBar setBackgroundImage:[UIImage imageNamed:@"NavBar64"] forBarMetrics:UIBarMetricsDefault];
    //设置导航栏文字的颜色
    [self.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    //设置系统渲染的颜色把所有导航栏渲染的颜色都变成白色
    [self.navigationBar setTintColor:[UIColor whiteColor]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//如果我们想让导航控制器push的时候去隐藏导航栏我们不需要在storyboard中一个一个的去做就直接重写下push方法，不管是在storyboard还是代码push都会去调用下面这个方法
-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    viewController.hidesBottomBarWhenPushed=YES;
    [super pushViewController:viewController animated:animated];
}
@end
