//
//  oAuthoruquestController.m
//  weibo
//
//  Created by zjq on 15-10-7.
//  Copyright (c) 2015年 zjq. All rights reserved.
//

#import "oAuthoruquestController.h"
#import "AFNetworking.h"
#import "TokenModel.h"
#import "Achivertoken.h"
#import "UIWindow+Rootviewcontroller.h"


@interface oAuthoruquestController ()<UIWebViewDelegate>

@end

@implementation oAuthoruquestController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
  //https://api.weibo.com/oauth2/authorize?client_id=123050457758183&redirect_uri=http://www.example.com/response&response_type=code
    
    UIWebView *webview = [[UIWebView alloc]initWithFrame:CGRectMake(0, 0, TScreenWidth, TScreenHeight)];
    
    webview.delegate = self;
    
    [self.view addSubview:webview];
  //授权请求链接
    NSString *urlstr = [NSString stringWithFormat:@"https://api.weibo.com/oauth2/authorize?client_id=%@&redirect_uri=%@",TSAppKey,TSRedirect];
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:urlstr]];
    
    [webview loadRequest:request];
    
    
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    
    NSString *url = request.URL.relativeString;
    NSLog(@"url = %@",url);
    
    NSRange range = [url rangeOfString:@"code="];
    if (range.location != NSNotFound) {
        NSString *code = [url substringFromIndex:range.location+range.length];
        NSLog(@"code = %@",code);
        
        [self requesttoken:code];
    }
    
    return YES;
    
}

- (void)requesttoken:(NSString *)code
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    NSMutableDictionary *parames = [NSMutableDictionary dictionary];
    [parames setObject:TSAppKey forKey:@"client_id"];
    [parames setObject:TSAppSecret forKey:@"client_secret"];
    [parames setObject:@"authorization_code" forKey:@"grant_type"];
    [parames setObject:code forKey:@"code"];
    [parames setObject:TSRedirect forKey:@"redirect_uri"];
    
    [manager POST:TSRequestToken parameters:parames success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSLog(@"%@",responseObject);
        
        TokenModel *model = [[TokenModel alloc]initWithDictionary:responseObject];
        NSLog(@"-----%@",model.access_token);
        
        [Achivertoken achivertokenmodel:model]; //将tokenmode归档
        
        UIWindow *keywindow = [UIApplication sharedApplication].keyWindow;
        [keywindow setWindowrootviewcontroller];
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"%@",error);
    }];
    
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
