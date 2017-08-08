//
//  ZXProductViewController.m
//  ZXLottery
//
//  Created by zhixiongchen on 2017/8/7.
//  Copyright © 2017年 zhixiongchen. All rights reserved.
//产品推荐界面

#import "ZXProductViewController.h"
#import "ZXProduct.h"
#import "ZXProductCell.h"
@interface ZXProductViewController ()
@property(nonatomic,strong)NSArray *products;
@end
@implementation ZXProductViewController
//希望在Cell跳转到控制器的时候直接可以设置一个布局，这样跳转到collectionViewController就不会报错，
-(instancetype)init
{
    //创建了个layout
    UICollectionViewFlowLayout * layout=[[UICollectionViewFlowLayout alloc]init];
    //设置item的样式
    layout.itemSize=CGSizeMake(80, 80);
    //设置item左右之间最小的距离
    layout.minimumInteritemSpacing=0;
    //设置组边距，就让距离上面有一定的距离
    layout.sectionInset=UIEdgeInsetsMake(15, 0, 0, 0);
    return [super initWithCollectionViewLayout:layout];
}
-(NSArray *)products
{
    if(!_products)
    {
        //获取文件路径
        NSString * path=[[NSBundle mainBundle]pathForResource:@"more_project"ofType:@"json"];
        //把文件转化成data
        NSData * data=[NSData dataWithContentsOfFile:path];
        //把data转化成array,options为0就代表了为NSJSONReadingMutableContainers
        NSArray * tempArray=[NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        //初始化一个可变数组
        NSMutableArray * array=[NSMutableArray array];
        //遍历临时数组，获取字典
        for (NSDictionary * dict in tempArray) {
            //字典转模型
            ZXProduct * product =[ZXProduct productWithDitc:dict];
             //把模型添加到可变数组中
            [array addObject:product];
        }
        _products=array;
    }
    return _products;
}
//可以在设置布局的方法中也直接都返回layout方法
-(instancetype)initWithCollectionViewLayout:(UICollectionViewLayout *)layout
{
    return [self init];
}
static NSString * const reuseIdentifier = @"product_cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    //获取Nib的对象
    UINib * nib=[UINib nibWithNibName:@"ZXProductCell" bundle:nil];
    //注册单元格
    [self.collectionView registerNib:nib forCellWithReuseIdentifier:reuseIdentifier];
    //修改collectionView的背景颜色
    self.collectionView.backgroundColor=[UIColor colorWithRed:0.91 green:0.91 blue:0.91 alpha:1];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark <UICollectionViewDataSource>
//返回有多少组
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {

    return 1;
}

//返回有每一组有多少行
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.products.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    //从缓存池中找
    ZXProductCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    //将数据传给cell
    cell.product=self.products[indexPath.row];
    
    return cell;
}
//collectionView中的点击事件
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    //获取该item的模型
    ZXProduct * model=self.products[indexPath.row];
    //获取app对象
    UIApplication * app=[UIApplication sharedApplication];
    //获取本地程序的URL
    NSURL * appUrl=[NSURL URLWithString:[NSString stringWithFormat:@"%@://%@",model.customUrl,model.ids]];
    //获取appStore中的URL
    NSURL * storeUrl=[NSURL URLWithString:model.url];
    //在ios8的时候，是这么做的，现在就需要在info.plist中去配置些东西
//    if([app canOpenURL:appUrl])
//    {
//     //跳到应用程序
//    }
//    else
//    {
//        //跳到appStore中的页面
//    }
    if(![app openURL:appUrl])
    {
        //如果本地没有这个应用程序，就打开appStore相应的程序
        [app openURL:storeUrl];
    }
    
}
@end
