//
//  ZXAboutHeaderView.m
//  ZXLottery
//
//  Created by zhixiongchen on 2017/8/7.
//  Copyright © 2017年 zhixiongchen. All rights reserved.
//

#import "ZXAboutHeaderView.h"

@implementation ZXAboutHeaderView
+(instancetype)loadHeaderView
{
    return [[NSBundle mainBundle]loadNibNamed:@"ZXAboutHeaderView" owner:nil options:nil][0];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
