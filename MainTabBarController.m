//
//  MainTabBarController.m
//  weibo
//
//  Created by zjq on 15-10-5.
//  Copyright (c) 2015年 zjq. All rights reserved.
//

#import "MainTabBarController.h"
#import "UIView+Extension.h"
#import "WritweiboView.h"

@interface MainTabBarController()

@property(strong,nonatomic)UIButton *centerbutton;

@end

@implementation MainTabBarController

- (void)viewDidLoad{
    [super viewDidLoad];
    
    [self setTabBarItem];
    
}

- (void)setTabBarItem

{
    
    self.tabBar.barTintColor = [UIColor whiteColor];
    self.tabBar.tintColor = [UIColor colorWithRed:255/255.0 green:111/255.0 blue:0 alpha:1];
    
    [self.tabBar addSubview:self.centerbutton];
    
    
    NSArray *selectimages = @[@"tabbar_home_selected",
                              @"tabbar_message_center_selected",
                              @"",
                              @"tabbar_discover_selected",
                              @"tabbar_profile_selected"];
    NSArray *viewcols = self.viewControllers;
    
    for (int i = 0 ; i<selectimages.count; i++) {
        
        
        if (i == 2) {
            continue;
        }
        
        UIViewController *viewcol = viewcols[i];
        
        NSString *imagename = selectimages[i];
        
        viewcol.tabBarItem.selectedImage = [[UIImage imageNamed:imagename]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        
    }
    
}


- (UIButton *)centerbutton{
    if (_centerbutton == nil) {
        
        _centerbutton = [UIButton buttonWithType:UIButtonTypeCustom];
                         
        CGFloat centerx = CGRectGetMidX(self.tabBar.frame);
        CGFloat height = CGRectGetHeight(self.tabBar.frame);
        
        _centerbutton.frame = CGRectMake(centerx - 32, (height-44)/2, 64, 44);
        
        [_centerbutton setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button"] forState:UIControlStateNormal];
        
        [_centerbutton setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button_highlighted"] forState:UIControlStateHighlighted];
        
        [_centerbutton setImage:[UIImage imageNamed:@"tabbar_compose_icon_add_highlighted"] forState:UIControlStateNormal];
        [_centerbutton addTarget:self action:@selector(centerbuttonaction:) forControlEvents:UIControlEventTouchUpInside];
        
        
    }
    
    
    return _centerbutton;
    
}


- (void)centerbuttonaction:(UIButton *)button
{
    
    WritweiboView *anamationview = [WritweiboView create];
    [anamationview showWriteweiboview];
    
}


@end
