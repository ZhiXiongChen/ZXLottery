//
//  ZXProductCell.m
//  ZXLottery
//
//  Created by zhixiongchen on 2017/8/7.
//  Copyright © 2017年 zhixiongchen. All rights reserved.
//

#import "ZXProductCell.h"
#import "ZXProduct.h"
@interface ZXProductCell()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *detailLabel;

@end
@implementation ZXProductCell
-(void)setProduct:(ZXProduct *)product
{
    _product=product;
    //设置Cell的样式为圆角
    self.imageView.layer.cornerRadius=8;
    self.imageView.layer.masksToBounds=YES;
    //设置图片
    self.imageView.image=[UIImage imageNamed:product.icon];
    NSLog(@"%@",product.icon);
    //设置label
    self.detailLabel.text=product.title;
}
@end
