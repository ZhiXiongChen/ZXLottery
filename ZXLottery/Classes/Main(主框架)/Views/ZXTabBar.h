//
//  ZXTabBar.h
//  ZXLottery
//
//  Created by zhixiongchen on 2017/8/5.
//  Copyright © 2017年 zhixiongchen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZXTabBar : UIView
//直接用这个方法去添加按钮的操作
-(void)addbuttonWithImage:(UIImage *)image andWithSelectImage:(UIImage *)imageSelect;
//用block去跳转页面，相当于作为代理
@property (nonatomic ,copy)void(^jumpBlock)(NSInteger );
@end
