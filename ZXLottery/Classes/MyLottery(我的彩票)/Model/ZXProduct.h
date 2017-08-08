//
//  ZXProduct.h
//  ZXLottery
//
//  Created by zhixiongchen on 2017/8/7.
//  Copyright © 2017年 zhixiongchen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZXProduct : NSObject
@property (nonatomic,copy)NSString * title;
@property (nonatomic,copy)NSString * stitle;
@property (nonatomic,copy)NSString * ids;
@property (nonatomic,copy)NSString * url;
@property (nonatomic,copy)NSString * icon;
@property (nonatomic,copy)NSString * customUrl;
+(instancetype)productWithDitc:(NSDictionary *)dict;
@end
