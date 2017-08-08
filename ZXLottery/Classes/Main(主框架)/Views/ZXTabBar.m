//
//  ZXTabBar.m
//  ZXLottery
//
//  Created by zhixiongchen on 2017/8/5.
//  Copyright © 2017年 zhixiongchen. All rights reserved.
//

#import "ZXTabBar.h"
@interface ZXTabBarButton :UIButton

@end
@implementation ZXTabBarButton
-(void)setHighlighted:(BOOL)highlighted
{
    //如果加了下面这句话就和我们没有写这个方法是一样的，所以我们想取消高亮状态就要把下面这句话给注释掉
    //[super setHighlighted:highlighted];
}
@end
@interface ZXTabBar ()
@property(nonatomic,weak)UIButton * currentbutton;
@end
@implementation ZXTabBar
-(void)addbuttonWithImage:(UIImage *)image andWithSelectImage:(UIImage *)imageSelect
{
    ZXTabBarButton * button=[[ZXTabBarButton alloc]init];
     [button setBackgroundImage:image forState:UIControlStateNormal];
    [button setBackgroundImage:imageSelect forState:UIControlStateSelected];
    //只是取消高亮状态下的效果
    //button.adjustsImageWhenHighlighted=NO;
    //我们想取消按钮的高亮状态,需要自定义一个button
    //给按钮添加点击事件
    [button addTarget:self action:@selector(tabbarButtonClick:) forControlEvents:UIControlEventTouchDown];
    //让button加入到view中
    [self addSubview:button];

}
-(void)tabbarButtonClick:(ZXTabBarButton *)sender
{
    //取消按钮的选中状态
    self.currentbutton.selected=NO;
    sender.selected=YES;
    //把当前已经选中的按钮给self.currentbutton这个按钮
    self.currentbutton=sender;
    //判断block是否有值
    if(self.jumpBlock)
    {
        //调用block用于跳转界面
        self.jumpBlock(sender.tag);
    }
    //让页面进行切换
    //self.selectedIndex=sender.tag;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    for(int i=0;i<self.subviews.count;i++)
    {
        ZXTabBarButton * button=self.subviews[i];
        //设置buttonD的tag，这样在点击按钮切换页面的时候可以直接让selectIndex设置为tag的值
         button.tag=i;
        CGFloat w=KScreenWidth/5;
        CGFloat h=49;
        CGFloat x=i*w;
        CGFloat y=0;
        //设置button的frame
        button.frame=CGRectMake(x, y, w, h);
        //此处为了让tabbar下面的图形一进入程序就亮起来，所以我们要模拟下按钮的点击
        if(i==0)
        {
        [self tabbarButtonClick:button];
        }
    }
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
