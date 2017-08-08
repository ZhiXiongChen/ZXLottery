//
//  ZXHallController.m
//  ZXLottery
//
//  Created by zhixiongchen on 2017/8/5.
//  Copyright © 2017年 zhixiongchen. All rights reserved.
//

#import "ZXHallController.h"

@interface ZXHallController ()
@property (nonatomic ,weak)UIView * coverView;
@property (nonatomic ,weak)UIImageView * imageView;
@end

@implementation ZXHallController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImage * image=[UIImage imageNamed:@"CS50_activity_image"];
    //设置在使用这个图片的时候，不进行渲染，用图片默认的颜色系统渲染默认是蓝色
    image =[image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    //设置navigation的leftItem
    UIBarButtonItem * item=[[UIBarButtonItem alloc]initWithImage:image style:UIBarButtonItemStylePlain target:self action:@selector(activityClick)];
    self.navigationItem.leftBarButtonItem=item;
}
-(void)activityClick
{
    //设置遮罩的view
    UIView * coverView=[[UIView alloc]initWithFrame:kScreenSize];
    //把它赋给self.cover方便下面的移除
    self.coverView=coverView;
    coverView.backgroundColor=[UIColor blackColor];
    //设置透明度
    coverView.alpha=0.5;
    //把遮罩的view添加到最外层的控制器这样就可以遮到tabbar和navigationbar
    [self.tabBarController.view addSubview:coverView];
    //设置会弹出的imageView
    UIImageView * imageView=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"showActivity"]];
    //方便下面的移除
    self.imageView=imageView;
    //默认创建的imageView是不允许用户交互的
    imageView.userInteractionEnabled=YES;
    //设置imageView的中心
    imageView.center=self.view.center;
    //把imageView添加到tabbarController的view上面，如果把imageView添加到coverView上，则它的父控件是透明的它的子控件也就是透明的
    [self.tabBarController.view addSubview:imageView];
    //添加关闭按钮
    UIButton * closeButton =[[UIButton alloc]init];
    //设置图片
    UIImage * closeButtonImage=[UIImage imageNamed:@"alphaClose"];
    //设置按钮的frame
    closeButton.frame=CGRectMake(imageView.bounds.size.width-closeButtonImage.size.width, 0, closeButtonImage.size.width, closeButtonImage.size.height);
    //自动适应和图片一样大小
//    [closeButton sizeToFit];
    [closeButton setBackgroundImage:closeButtonImage forState:UIControlStateNormal];
    [closeButton addTarget:self action:@selector(closeClick) forControlEvents:UIControlEventTouchUpInside];
    [imageView addSubview:closeButton];
    //设置navigationBar的背景颜色，会有逐渐变白的效果，因为导航栏是半透明的
//    [self.navigationController.navigationBar setBackgroundColor:[UIColor greenColor]];
    //修改系统默认渲染的颜色，本来默认渲染的是蓝色，我们可以改，然后添加到navigationbar上面的按钮item颜色就会设置为我们设置的颜色
//    [self.navigationController.navigationBar setTintColor:[UIColor redColor]];
    //就是设置状态栏20高和导航栏44高的颜色为红色
//    [self.navigationController.navigationBar setBarTintColor:[UIColor redColor]];
    //如果我们想取消navigation的透明效果就去设置,如果你下面这个为NO的话，你添加一个view到navigationController中设置坐标为(0,0)就是从导航栏下面开始算的，如果有透明效果则添加的view的(0,0)点是根据最左上角算的
//    [self.navigationController.navigationBar setTranslucent:NO];
    
}
-(void)closeClick
{
    [UIView animateWithDuration:0.25 animations:^{
        //只需要把coverView和imageView移除就可以了
        [self.coverView removeFromSuperview];
        [self.imageView removeFromSuperview];
    }];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return 0;
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
