//
//  ZXSettingCell.h
//  ZXLottery
//
//  Created by zhixiongchen on 2017/8/6.
//  Copyright © 2017年 zhixiongchen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZXSettingCell : UITableViewCell
+(instancetype)settingCellWithTableView:(UITableView *)tableView andItem:(NSDictionary *)item;
@property (nonatomic ,strong)NSDictionary * item;
@end
