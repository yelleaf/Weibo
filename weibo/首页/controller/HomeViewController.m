//
//  HomeViewController.m
//  weibo
//
//  Created by zjq on 15-10-5.
//  Copyright (c) 2015年 zjq. All rights reserved.
//

#import "HomeViewController.h"
#import "TSPopview.h"
#import "Achivertoken.h"
#import "TokenModel.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];


}


- (void)createpopview:(UIView *)view withType:(Popviewtype)type
{
//    UIView *contentview = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 100, 100)];
//    contentview.backgroundColor = [UIColor whiteColor];
//    TSPopview *popview = [[TSPopview alloc]init];
    
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeContactAdd];
    button.bounds = CGRectMake(0, 0, 100, 100);
    
    TSPopview *popview = [TSPopview creat];
    
    popview.contentview = button;
    
    [popview showPopview:view withType:type];
    
    
    
}

- (IBAction)buttonaction:(UIButton *)sender{
    
    [self createpopview:sender withType:Popviewiscenter];
    
}

- (IBAction)leftbuttonaction:(UIButton *)sender{
    
    [self createpopview:sender withType:Popviewisleft];
    
}

- (IBAction)rightbuttonaction:(UIButton *)sender{
    
    [self createpopview:sender withType:Popviewisright];
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
