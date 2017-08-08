//
//  ZXSettingCell.m
//  ZXLottery
//
//  Created by zhixiongchen on 2017/8/6.
//  Copyright © 2017年 zhixiongchen. All rights reserved.
//

#import "ZXSettingCell.h"

@implementation ZXSettingCell

+(instancetype)settingCellWithTableView:(UITableView *)tableView andItem:(NSDictionary *)item
{
    //static NSString * cellID=@"setting_cell";
    //涉及到cell重用的原因，所以需要创建Cell的时候需要根据不同的类型去设置不同的cell的ID
    NSString * cellID=@"";
    //根据UITableBarCellStyle来进行设置判断是否存在这个key，这个value是否为空
    if(item[@"cellType"]&&[item[@"cellType"]length]>0)
    {
        cellID=item[@"cellType"];
    }
    else
    {
        cellID=@"setting_cell";
    }
    ZXSettingCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if(!cell)
    {
        cell=[[ZXSettingCell alloc]initWithStyle:[self loadCellStyleWithItem:item] reuseIdentifier:cellID];
    }
    return cell;
}
//写一个返回tableViewCellStyle的方法，根据plist文件中的字符串,来返回相应的cell的类型
+(UITableViewCellStyle)loadCellStyleWithItem:(NSDictionary *)item
{
    if([item[@"cellType"] isEqualToString:@"UITableViewCellStyleSubtitle"])
    {
        return UITableViewCellStyleSubtitle;
    }
    else if([item[@"cellType"] isEqualToString:@"UITableViewCellStyleDefault"])
    {
        return UITableViewCellStyleDefault;
    }
    else if([item[@"cellType"] isEqualToString:@"UITableViewCellStyleValue2"])
    {
        return UITableViewCellStyleValue2;
    }
    else
    {
        return UITableViewCellStyleValue1;
    }
}
//重写cell中的item字典的方法，传入数据
-(void)setItem:(NSDictionary *)item
{
    _item=item;
    //防止某些plist文件中没有icon这个属性
    if(item[@"icon"]&&[item[@"icon"] length]>0)
    {
        self.imageView.image=[UIImage imageNamed:item[@"icon"]];
    }
    //设置主标题
    self.textLabel.text=item[@"title"];
    //设置副标题,不进行判断也可以的，系统会自动为我们处理，如果传入的是空的话
    self.detailTextLabel.text=item[@"subTitle"];
    //判断是否有设置红色的颜色的key
    if([item[@"isRed"]boolValue]&&item[@"isRed"])
    {
        self.detailTextLabel.textColor=[UIColor redColor];
    }
    //根据一个字符串来创建对象
    NSString * accessoryType=item[@"accessoryType"];
    Class class=NSClassFromString(accessoryType);
    //class就代表你获得到的字符串的相应的那个类型
    UIView * view=[[class alloc]init];
    //还要判断下accessoryType是不是imageView类型的，如果是就需要设置frame
    if([view isKindOfClass:[UIImageView class]])
    {
        //设置imageView的frame和图片
        UIImageView * imageView=(UIImageView *)view;
        imageView.image=[UIImage imageNamed:item[@"accessoryContent"]];
        [imageView sizeToFit];
    }
    //如果是开关的类型，我们就去监听
    else if([view isKindOfClass:[UISwitch class]])
    {
        UISwitch * switch1=(UISwitch *)view;
        [switch1 addTarget:self action:@selector(switchChange:) forControlEvents:UIControlEventValueChanged];
        //获取单例
        NSUserDefaults * ud=[NSUserDefaults standardUserDefaults];
        //获取按钮的状态
       switch1.on = [ud boolForKey:item[@"switchKey"]];
    }
    
    self.accessoryView=view;

}
//在开关状态改变的时候调用
-(void)switchChange:(UISwitch *)sender
{
    //获取单利对象ud
    NSUserDefaults * ud=[NSUserDefaults standardUserDefaults];
    //记录开关的状态,要保证唯一的key就需要在plist文件中增加个属性
    [ud setBool:sender.isOn forKey:self.item[@"switchKey"]];
}
@end
