//
//  ZXAllColorsButton.m
//  ZXLottery
//
//  Created by zhixiongchen on 2017/8/6.
//  Copyright © 2017年 zhixiongchen. All rights reserved.
//

#import "ZXAllColorsButton.h"
#import "UIView+Frame.h"
@implementation ZXAllColorsButton

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(void)layoutSubviews
{
    //交换button内部的子控件
    [super layoutSubviews];
//    //获取button中的titleLabel的frame
//    CGRect labelRect=self.titleLabel.frame;
//    //然后修改下titleLabel的x轴的坐标
//    labelRect.origin.x=0;
//    //然后修改frame
//    self.titleLabel.frame=labelRect;
//    //获取button中的imageView的frame
//    CGRect imageRect=self.imageView.frame;
//    //修改imageRect的x轴的坐标
//    imageRect.origin.x=labelRect.size.width;
//    //修改imageView的frame
//    self.imageView.frame=imageRect;
    //抽出了个分类给UIView增加了x和w的属性所以就可以设置了
    self.titleLabel.x=0;
    self.imageView.x=self.titleLabel.w;
}
@end
