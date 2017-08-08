//
//  ZXHelpTableViewController.m
//  ZXLottery
//
//  Created by zhixiongchen on 2017/8/7.
//  Copyright © 2017年 zhixiongchen. All rights reserved.
//

#import "ZXHelpTableViewController.h"
#import "ZXHelp.h"
#import "ZXNavigationController.h"
#import "ZXHelpWebController.h"
@interface ZXHelpTableViewController ()
@property (nonatomic ,strong)NSArray *helps;
@end

@implementation ZXHelpTableViewController
-(NSArray *)helps
{
    if(!_helps)
    {
        //获取路径
        NSString * path=[[NSBundle mainBundle]pathForResource:@"help" ofType:@"json"];
        //获取NSData数据
        NSData * data=[NSData dataWithContentsOfFile:path];
        //得到数组
        NSArray * tempArray=[NSJSONSerialization JSONObjectWithData:data options:0 error: nil];
        //创建一个数组
        NSMutableArray * array=[NSMutableArray array];
        for (NSDictionary * dict in tempArray) {
            //字典转模型
            ZXHelp * model=[ZXHelp helpWithDict:dict];
            //添加到数组中
            [array addObject:model];
        }
        _helps=array;
    }
    return _helps;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    //会去找你有没有个title如果有的话，就帮你设置了
    self.title=@"常见问题";
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return self.helps.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString * CellId=@"help_cell";
    UITableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:CellId];
    if(!cell)
    {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellId];
    }
    cell.textLabel.text=[self.helps[indexPath.row] title];
    cell.accessoryView=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"arrow_right"]];
    return cell;
}
//跳转到所点的那个位置的控制器
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //创建我们自定义的UIViewController
    ZXHelpWebController * vc=[[ZXHelpWebController alloc]init];
    vc.help=self.helps[indexPath.row];
    //创建自定义的navigationController
    ZXNavigationController * nav=[[ZXNavigationController alloc]initWithRootViewController:vc];
    //添加一个取消按钮
    UIBarButtonItem * item=[[UIBarButtonItem alloc]initWithTitle:@"关闭" style:UIBarButtonItemStylePlain target:self action:@selector(cancelClick)];
    vc.navigationItem.leftBarButtonItem=item;
    //跳转到模态视图，也就是相应的navigationController
    [self presentViewController:nav animated:YES completion:nil];
}
-(void)cancelClick
{
    //弹回模态视图，其实是这样的A跳转到B，如果要把模态视图弹回的话，如果我们在B当中dismiss的话本质上就是B给A发消息，然后让A来dismiss，我们这里就是直接让B不用发消息了，直接让Adismiss了。
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
