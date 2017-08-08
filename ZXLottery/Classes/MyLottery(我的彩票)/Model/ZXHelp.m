//
//  ZXHelp.m
//  ZXLottery
//
//  Created by zhixiongchen on 2017/8/8.
//  Copyright © 2017年 zhixiongchen. All rights reserved.
//

#import "ZXHelp.h"

@implementation ZXHelp
+(instancetype)helpWithDict:(NSDictionary *)dict
{
    ZXHelp * p=[[self alloc]init];
    p.title=dict[@"title"];
    p.html=dict[@"html"];
    p.ids=dict[@"id"];
    return p;
}
@end
