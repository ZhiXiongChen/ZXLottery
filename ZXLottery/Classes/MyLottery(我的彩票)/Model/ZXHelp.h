//
//  ZXHelp.h
//  ZXLottery
//
//  Created by zhixiongchen on 2017/8/8.
//  Copyright © 2017年 zhixiongchen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZXHelp : NSObject
@property (nonatomic ,copy)NSString * title;
@property (nonatomic ,copy)NSString * html;
@property (nonatomic ,copy)NSString * ids;
+(instancetype)helpWithDict:(NSDictionary *)dict;
@end
