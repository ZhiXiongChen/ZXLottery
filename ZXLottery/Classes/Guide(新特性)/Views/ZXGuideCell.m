//
//  ZXGuideCell.m
//  ZXLottery
//
//  Created by zhixiongchen on 2017/8/7.
//  Copyright © 2017年 zhixiongchen. All rights reserved.
//

#import "ZXGuideCell.h"
@interface ZXGuideCell ()
@property (nonatomic,weak)UIImageView * imageView;
@end
@implementation ZXGuideCell
-(UIImageView *)imageView
{
    if(!_imageView)
    {
        UIImageView  * imageView=[[UIImageView alloc]init];
        imageView.frame=kScreenSize;
        [self addSubview:imageView];
        _imageView=imageView;
    }
    return _imageView;
}
-(void)setImage:(UIImage *)image
{
    _image=image;
    self.imageView.image=image;
}
@end
