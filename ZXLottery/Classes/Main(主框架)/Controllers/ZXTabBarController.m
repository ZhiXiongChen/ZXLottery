//
//  ZXTabBarController.m
//  ZXLottery
//
//  Created by zhixiongchen on 2017/8/5.
//  Copyright © 2017年 zhixiongchen. All rights reserved.
//

#import "ZXTabBarController.h"
#import "ZXTabBar.h"
@interface ZXTabBarController ()

@end

@implementation ZXTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    //获取tabbar的控制器
    UIViewController * vc1=[self loadViewControllerWithStoryboardName:@"Hall"];
    UIViewController * vc2=[self loadViewControllerWithStoryboardName:@"Arena"];
    UIViewController * vc3=[self loadViewControllerWithStoryboardName:@"Discovery"];
    UIViewController * vc4=[self loadViewControllerWithStoryboardName:@"History"];
    UIViewController * vc5=[self loadViewControllerWithStoryboardName:@"MyLottery"];
    //设置tabbar的控制器
    self.viewControllers=@[vc1,vc2,vc3,vc4,vc5];
    //这里我们需要自定义一个tabbar，因为系统自带的是默认图片在上面底下还有文字的位置给我们，而我们这里只用到了图片，所以我们自定义一个tabbar
   ZXTabBar * tabbar=[[ZXTabBar alloc]init];
    //设置tabbar的frame为系统tabbar的frame,这里如果把tabbar添加到self.tabbar中就不能把self.tabBar的frame赋给自定义的tabbar的frame了。
//    tabbar.frame=self.tabBar.frame;
    tabbar.frame=self.tabBar.bounds;
    //想让自定义的tabbar跟着push一起隐藏的话，就把自定义的tabbar加入到self.tabbar当中
    [self.tabBar addSubview:tabbar];
    //给tabbar设置按钮
    for(int i=0;i<self.viewControllers.count;i++)
    {
        //设置按钮正常状态的图片
        NSString * str=[NSString stringWithFormat:@"TabBar%d",i+1];
       
        //设置按钮被选择状态的图片
        NSString *str1=[NSString stringWithFormat:@"TabBar%dSel",i+1];
        [tabbar addbuttonWithImage:[UIImage imageNamed:str ]andWithSelectImage:[UIImage imageNamed:str1]];
    }
    __weak ZXTabBarController * weakSelf=self;
    tabbar.jumpBlock = ^void(NSInteger a)
    {
        weakSelf.selectedIndex=a;
    };
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//抽出通过加载storyboard获取的方法
-(UIViewController *)loadViewControllerWithStoryboardName:(NSString *)name
{
    UIStoryboard * sb=[UIStoryboard storyboardWithName:name bundle:nil];
    return [sb instantiateInitialViewController];
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
