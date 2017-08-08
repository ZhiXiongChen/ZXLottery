//
//  ZXHelpWebController.m
//  ZXLottery
//
//  Created by zhixiongchen on 2017/8/8.
//  Copyright © 2017年 zhixiongchen. All rights reserved.
//

#import "ZXHelpWebController.h"

@interface ZXHelpWebController ()<UIWebViewDelegate>

@end

@implementation ZXHelpWebController
-(void)loadView
{
    self.view=[[UIWebView alloc]init];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    //获取webView
    UIWebView * webView=(UIWebView *)self.view;
    //设置代理
    webView.delegate=self;
    //创建一个url对象,和pathForResource差不多前面是文件名，后面是后缀
    NSURL * url=[[NSBundle mainBundle]URLForResource:self.help.html withExtension:nil];
    //通过一个统一的资源定位符，包装成一个请求
    NSURLRequest * request=[NSURLRequest requestWithURL:url];
    //加载请求
    [webView loadRequest: request];
}
//网页加载完成执行js代码
-(void)webViewDidFinishLoad:(UIWebView *)webView
{
    NSString * code=[NSString stringWithFormat:@"document.location.href = '#%@';",self.help.ids];
    [webView stringByEvaluatingJavaScriptFromString:code];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
