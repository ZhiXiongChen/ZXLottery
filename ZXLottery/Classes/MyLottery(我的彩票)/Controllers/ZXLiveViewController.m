//
//  ZXLiveViewController.m
//  ZXLottery
//
//  Created by zhixiongchen on 2017/8/6.
//  Copyright © 2017年 zhixiongchen. All rights reserved.
//
//比分直播推送界面
#import "ZXLiveViewController.h"
#import "UIView+Frame.h"
@interface ZXLiveViewController ()
@property(nonatomic,weak)UIDatePicker * datePicker;
@property(nonatomic,weak)UITextField * textField;
@end

@implementation ZXLiveViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.section==0)
    {
        return;
    }
    //创建一个文本框
    UITextField * text=[[UITextField alloc]init];
    self.textField=text;
    //获取cell
    UITableViewCell * cell=[tableView cellForRowAtIndexPath:indexPath];
    //把文本框添加到cell的contentView中
    [cell.contentView addSubview:text];
    //创建一个日期选择器
    UIDatePicker * datePicker=[[UIDatePicker alloc]init];
    self.datePicker=datePicker;
    //设置中文
    datePicker.locale=[[NSLocale alloc]initWithLocaleIdentifier:@"zh_CN"];
    //设置时间的格式
    datePicker.datePickerMode=UIDatePickerModeTime;
    //设置文本框的inputView
    text.inputView=datePicker;
    //创建一个UIToolBar
    UIToolbar * bar=[[UIToolbar alloc]init];
    //设置bar的高度
    bar.h=44;
    //创建item - 取消
    UIBarButtonItem * cancelItem=[[UIBarButtonItem alloc]initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(cancelClick)];
    //创建item - 弹簧按钮
    UIBarButtonItem * item=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    //创建item - 完成
    UIBarButtonItem * doneItem=[[UIBarButtonItem alloc]initWithTitle:@"完成" style:UIBarButtonItemStyleDone target:self action:@selector(doneClick)];
    bar.items=@[cancelItem,item,doneItem];
    //设置键盘的样式
    text.inputAccessoryView=bar;
    //让text成为第一响应者
    [text becomeFirstResponder];
}
//收回键盘
-(void)cancelClick
{
    [self.view endEditing:YES];
}
-(void)doneClick
{
    //获取时间
    NSDate * date=self.datePicker.date;
    //创建格式化时间的对象
    NSDateFormatter * formatter=[[NSDateFormatter alloc]init];
    //设置时间的格式
    formatter.dateFormat=@"HH:mm";//HH是24小时制的
    //得到时间的字符串
    NSString * str=[formatter stringFromDate:date];
    //要得到cell就要通过选中行来得到NSIndexPath
    NSIndexPath * path=[self.tableView indexPathForSelectedRow];
    //通过path来都得到cell
    UITableViewCell * cell=[self.tableView cellForRowAtIndexPath:path];
    //设置cell的detailLabel
    cell.detailTextLabel.text=str;
    [self.view endEditing:YES];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
