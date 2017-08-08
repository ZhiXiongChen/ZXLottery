//
//  ZXSettingViewController.m
//  ZXLottery
//
//  Created by zhixiongchen on 2017/8/6.
//  Copyright © 2017年 zhixiongchen. All rights reserved.
//设置界面
#import "ZXSettingViewController.h"
#import "ZXRedeemController.h"
#import "ZXSettingCell.h"
#import <MessageUI/MessageUI.h>
@interface ZXSettingViewController ()<MFMessageComposeViewControllerDelegate>
@property(nonatomic,strong)NSArray * groups;
@property (nonatomic ,strong)MFMessageComposeViewController *picker;
@end
@implementation ZXSettingViewController
-(instancetype)init
{
    return [super initWithStyle:UITableViewStyleGrouped];
}
-(NSArray *)groups
{
    if(!_groups)
    {
        NSString * path=[[NSBundle mainBundle]pathForResource:self.plistName ofType:@"plist"];
        NSArray * array=[NSArray arrayWithContentsOfFile:path];
        _groups=array;
    }
    return _groups;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    //如果要重用这个控制器，我们这里最好不要让self.navigationItem.title=@"设置"，因为这里设置了，我们下面复用这个控制器的时候，vc.navigationItem.title=item[@"title"];这个执行完之后又去执行viewDidLoad中的方法了又修改了标题。
    //设置leftBarButtonItem在这里面设置的话通过这个控制器做的leftBarButtonItem都是这个样式的
    UIBarButtonItem * leftBarButtonItem=[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"NavBack"] style:UIBarButtonItemStylePlain target:self action:@selector(backClick)];
    self.navigationItem.leftBarButtonItem=leftBarButtonItem;
}
-(void)backClick
{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return self.groups.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    //获取当前组
    NSDictionary * group=self.groups[section];
    //获取当前组的所有的Cell的信息
    NSArray * items=group[@"items"];
    return items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSDictionary * group=self.groups[indexPath.section];
    //获取当前组的所有的Cell的信息
    NSArray * items=group[@"items"];
    //获取当前cell的信息
    NSDictionary * item=items[indexPath.row];
//    static NSString * cellID=@"setting_cell";
//    
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
//    if(!cell)
//    {
//        cell=[[UITableViewCell alloc]initWithStyle:[self loadCellStyleWithItem:item] reuseIdentifier:cellID];
//    }
    ZXSettingCell * cell=[ZXSettingCell settingCellWithTableView:tableView andItem:item];
    //防止某些plist文件中没有icon这个属性
//    if(item[@"icon"]&&[item[@"icon"] length]>0)
//    {
//    cell.imageView.image=[UIImage imageNamed:item[@"icon"]];
//    }
//    //设置主标题
//    cell.textLabel.text=item[@"title"];
//    //设置副标题,不进行判断也可以的，系统会自动为我们处理，如果传入的是空的话
//    cell.detailTextLabel.text=item[@"subTitle"];
//    //根据一个字符串来创建对象
//    NSString * accessoryType=item[@"accessoryType"];
//    Class class=NSClassFromString(accessoryType);
//    //class就代表你获得到的字符串的相应的那个类型
//    UIView * view=[[class alloc]init];
//    //还要判断下accessoryType是不是imageView类型的，如果是就需要设置frame
//    if([view isKindOfClass:[UIImageView class]])
//        {
//            //设置imageView的frame和图片
//            UIImageView * imageView=(UIImageView *)view;
//            imageView.image=[UIImage imageNamed:item[@"accessoryContent"]];
//            [imageView sizeToFit];
//        }
//    cell.accessoryView=view;
    //给cell设置数据
    cell.item=item;
    return cell;
}
//设置header的title的信息
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    //获取需要展示的header的组
    NSDictionary * group=self.groups[section];
    return group[@"header"];
}
//设置footer的title的信息
-(NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    //获取需要展示的footer的组
    NSDictionary * group=self.groups[section];
    return group[@"footer"];
}
//封装进了Cell
////写一个返回tableViewCellStyle的方法，根据plist文件中的字符串,来返回相应的cell的类型
//-(UITableViewCellStyle)loadCellStyleWithItem:(NSDictionary *)item
//{
//    if([item[@"cellType"] isEqualToString:@"UITableViewCellStyleSubtitle"])
//    {
//        return UITableViewCellStyleSubtitle;
//    }
//    else if([item[@"cellType"] isEqualToString:@"UITableViewCellStyleDefault"])
//    {
//        return UITableViewCellStyleDefault;
//    }
//    else if([item[@"cellType"] isEqualToString:@"UITableViewCellStyleValue2"])
//    {
//        return UITableViewCellStyleValue2;
//    }
//    else
//    {
//        return UITableViewCellStyleValue1;
//    }
//}
//设置点击相应的cell跳转到相应的界面
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
        //获取组
        NSDictionary *group=self.groups[indexPath.section];
        //获取相应的组当中的Cell
        NSArray * items=group[@"items"];
        //获取Cell的信息
        NSDictionary * item=items[indexPath.row];
        //这两个条件第一个是判断plist文件中是不是有targetVC中的key，第二个是判断plist文件中有没有写这个value
        if(item[@"targetVC"]&&[item[@"targetVC"]length])
        {
        //获取plist文件中相应的字符串
        NSString * targetVC=item[@"targetVC"];//获取到的是@"ZXRedeemController"
        Class class=NSClassFromString(targetVC);//获取到的ZXRedeemController这个类型
        //在这里我们不用判断UIViewController是不是ZXSettingViewController,我们重写init方法就可以了，默认的ZXSettingViewController创建的就是组的样式
        UIViewController * vc=[[class alloc]init];
            vc.navigationItem.title=item[@"title"];
        //我们这里要判断下vc是不是ZXSettingViewController类型的，如果是的话我们就需要强转一下，传入plistName这个属性
        if([vc isKindOfClass:[ZXSettingViewController class]])
        {
            ZXSettingViewController * vc1=(ZXSettingViewController *)vc;
            //不能把plistName给写死了，所以要在Setting.plist文件中多增加个plistName属性
            vc1.plistName=item[@"plistName"];
        }
        [self.navigationController pushViewController:vc animated:YES];
        }
    if(item[@"funcName"]&&[item[@"funcName"]length]>0)
    {
        //把字符串转换成一个方法的名字,在plist文件中增加了一个方法名的属性
        SEL funcName=NSSelectorFromString(item[@"funcName"]);
//这个就可以忽略警告了
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
        //执行这个方法
        [self performSelector:funcName];
#pragma clang diagnostic pop
    }
}
-(void)checkUpdate
{
    //创建一个弹窗
    UIAlertController * alert=[UIAlertController alertControllerWithTitle:@"已经是最新版本" message:@"不需要更新了" preferredStyle:UIAlertControllerStyleAlert];
    [self presentViewController:alert animated:YES completion:nil];
    UIAlertAction * confirm=[UIAlertAction actionWithTitle:@"确定" style: UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
    }];
    [alert addAction:confirm];
}
//打电话的方法
-(void)makeCall
{
    
        //获取程序对象
        UIApplication * app=[UIApplication sharedApplication];
        //获取统一资源定位符，协议头是tel
        NSURL * url=[NSURL URLWithString:@"tel://10010"];
        //通过open url去打电话
        [app openURL:url];
}
//发短信的方法
-(void)makeSms
{
    //帮我们打开短信这个应用程序
//    //获取应用程序对象
//    UIApplication * app=[UIApplication sharedApplication];
//    //协议头是sms
//    NSURL * url=[NSURL URLWithString:@"sms://10010"];
//    [app openURL:url];
    //没有打开短信的程序，这个控制器是专门用来发短信的程序
    MFMessageComposeViewController * picker=[[MFMessageComposeViewController alloc]init];
    picker.messageComposeDelegate=self;
    picker.navigationBar.tintColor=[UIColor blueColor];
    picker.body=@"查询话费";
    picker.recipients=[NSArray arrayWithObject:@"10001"];
    self.picker=picker;
    [self presentViewController:picker animated:YES completion:nil];
}
- (void)messageComposeViewController:(MFMessageComposeViewController *)controller didFinishWithResult:(MessageComposeResult)result;
{
    [self dismissViewControllerAnimated:self.picker completion:nil];
}
//评分支持
-(void)pushAppstore
{
    //获取程序对象
    UIApplication * app=[UIApplication sharedApplication];
    //获取统一资源定位符，百度上搜索应用程序在appstore的地址
    NSURL * url=[NSURL URLWithString:@"https://itunes.apple.com/cn/app/wang-yi-cai-piao-gei-meng/id411654863?mt=8"];
    //通过open url去跳转到appStore中的地址
    [app openURL:url];
}
@end
