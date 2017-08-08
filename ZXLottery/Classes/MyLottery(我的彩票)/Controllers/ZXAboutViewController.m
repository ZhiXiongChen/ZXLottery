//
//  ZXAboutViewController.m
//  ZXLottery
//
//  Created by zhixiongchen on 2017/8/7.
//  Copyright © 2017年 zhixiongchen. All rights reserved.
//

#import "ZXAboutViewController.h"
#import "ZXAboutHeaderView.h"
@interface ZXAboutViewController ()

@end

@implementation ZXAboutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.tableHeaderView=[ZXAboutHeaderView loadHeaderView];
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
