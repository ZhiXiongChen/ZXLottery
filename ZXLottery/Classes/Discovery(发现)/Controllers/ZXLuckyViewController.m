//
//  ZXLuckyViewController.m
//  ZXLottery
//
//  Created by zhixiongchen on 2017/8/6.
//  Copyright © 2017年 zhixiongchen. All rights reserved.
//

#import "ZXLuckyViewController.h"

@interface ZXLuckyViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ZXLuckyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //设置做动画的图片
    self.imageView.animationImages=@[[UIImage imageNamed:@"lucky_entry_light0"],[UIImage imageNamed:@"lucky_entry_light1"]];
    //设置做动画的时间
    self.imageView.animationDuration=1;
    //设置动画执行的次数,无限次播放，默认就是无限的，所以也可以不用写
    self.imageView.animationRepeatCount=0;
    //开始动画
    [self.imageView startAnimating];
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
