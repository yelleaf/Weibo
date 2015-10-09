//
//  WellcomeViewController.m
//  weibo
//
//  Created by zjq on 15-10-7.
//  Copyright (c) 2015年 zjq. All rights reserved.
//

#import "WelcomeViewController.h"

@interface WelcomeViewController ()<UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *scrollview;

@property (weak, nonatomic) IBOutlet UIPageControl *pagecontrol;

@property (weak, nonatomic) IBOutlet UIButton *welcomebutton;


@end

@implementation WelcomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addwelcomeimage];
}

- (void)addwelcomeimage
{
    self.scrollview.contentSize  = CGSizeMake(TScreenWidth*4, TScreenHeight);
    
    for (int i= 0; i<4; i++) {
        
        UIImageView *image = [[UIImageView alloc]initWithFrame:CGRectMake(TScreenWidth*i, 0, TScreenWidth, TScreenHeight)];
        
        NSString *imagename = [NSString stringWithFormat:@"new_feature_%d",i+1];
        
        image.image = [UIImage imageNamed:imagename];
        
        [self.scrollview addSubview:image];
        
    }
    
}
//代理反法
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSInteger currentpage = scrollView.contentOffset.x / TScreenWidth;
    self.pagecontrol.currentPage = currentpage;
    if (currentpage == 3) {
        
        self.welcomebutton.hidden = NO;
    }else{
        
        self.welcomebutton.hidden = YES;
    }
}


//进入微博按钮
- (IBAction)showbuttonaction:(UIButton *)sender {
    
    UIWindow *keywindow = [UIApplication sharedApplication].keyWindow;
    keywindow.rootViewController = [self.storyboard instantiateInitialViewController];
    
    
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
