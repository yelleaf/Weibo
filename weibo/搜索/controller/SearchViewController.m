//
//  SearchViewController.m
//  weibo
//
//  Created by zjq on 15-10-5.
//  Copyright (c) 2015年 zjq. All rights reserved.
//
#import "SearchViewController.h"
#import "TSearchView.h"

@interface SearchViewController ()

@end

@implementation SearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self addserarchview];

}

- (void)addserarchview
{
    TSearchView *searchView = [[TSearchView alloc] initWithFrame:CGRectMake(0, 0, TScreenWidth - 20, 30)];

    self.navigationItem.titleView = searchView;

    
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
