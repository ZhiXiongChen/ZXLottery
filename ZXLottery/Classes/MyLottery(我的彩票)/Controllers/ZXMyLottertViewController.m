//
//  ZXMyLottertViewController.m
//  ZXLottery
//
//  Created by zhixiongchen on 2017/8/6.
//  Copyright © 2017年 zhixiongchen. All rights reserved.
//我的彩票界面

#import "ZXMyLottertViewController.h"
#import "ZXSettingViewController.h"
#import "ZXHelpTableViewController.h"
@interface ZXMyLottertViewController ()
- (IBAction)settingClick:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *loginButton;

@end

@implementation ZXMyLottertViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    //先获取图片
    UIImage * image=[UIImage imageNamed:@"RedButton"];
    //然后图片进行拉伸
    image=[image stretchableImageWithLeftCapWidth:image.size.width*0.5 topCapHeight:image.size.height*0.5];
    //设置图片
    [self.loginButton setBackgroundImage:image forState:UIControlStateNormal];
    //获取高亮状态下的图片
    UIImage * imagePress=[UIImage imageNamed:@"RedButtonPressed"];
    //设置高亮状态下的图片拉伸就是一个像素的拉伸
    imagePress=[imagePress stretchableImageWithLeftCapWidth:imagePress.size.width*0.5 topCapHeight:imagePress.size.height*0.5];
    //设置登录高亮状态下的图片
    [self.loginButton setBackgroundImage:imagePress forState:UIControlStateHighlighted];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)settingClick:(id)sender {
    //这里init也可以不用加上style了，因为我们重写了init方法，设置init出来的都是Group类型的
    ZXSettingViewController * vc=[[ZXSettingViewController alloc]init];
    //因为我们可以进行复用，只要我们换个plistName就可以重新加载另一个tableViewController了
    vc.plistName=@"Setting";
    //设置标题
    vc.navigationItem.title=@"设置";
    //添加一个按钮
    UIBarButtonItem * helpitem=[[UIBarButtonItem alloc]initWithTitle:@"常见问题" style:UIBarButtonItemStylePlain target:self action:@selector(helpClick)];
    vc.navigationItem.rightBarButtonItem=helpitem;
    [self.navigationController pushViewController:vc animated:YES];
}
-(void)helpClick
{
    ZXHelpTableViewController * vc=[[ZXHelpTableViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}
@end
