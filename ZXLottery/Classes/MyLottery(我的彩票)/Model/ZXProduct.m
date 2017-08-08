//
//  ZXProduct.m
//  ZXLottery
//
//  Created by zhixiongchen on 2017/8/7.
//  Copyright © 2017年 zhixiongchen. All rights reserved.
//

#import "ZXProduct.h"

@implementation ZXProduct
+(instancetype)productWithDitc:(NSDictionary *)dict
{
    ZXProduct * p=[[self alloc]init];
    p.title=dict[@"title"];
    p.stitle=dict[@"stitle"];
    p.ids=dict[@"ids"];
    p.url=dict[@"url"];
    p.icon=dict[@"icon"];
    p.customUrl=dict[@"customUrl"];
    return p;
}

@end
