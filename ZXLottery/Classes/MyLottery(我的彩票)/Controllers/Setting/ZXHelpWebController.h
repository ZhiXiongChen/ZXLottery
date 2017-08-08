//
//  ZXHelpWebController.h
//  ZXLottery
//
//  Created by zhixiongchen on 2017/8/8.
//  Copyright © 2017年 zhixiongchen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZXHelp.h"
@interface ZXHelpWebController : UIViewController
//Help的控制器要把模型传给这里去加载静态的html网页，是数据的顺传
@property (nonatomic ,strong)ZXHelp * help;
@end
