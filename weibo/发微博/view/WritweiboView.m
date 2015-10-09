//
//  WritweiboView.m
//  weibo
//
//  Created by zjq on 15-10-6.
//  Copyright (c) 2015年 zjq. All rights reserved.
//

#import "WritweiboView.h"

@interface WritweiboView ()

@property(nonatomic,strong)UIImageView *bgimageview;
@property(nonatomic,strong)UIButton *deletebutton;
@property(nonatomic,strong)NSMutableArray *buttonarray;

@end

@implementation WritweiboView


+ (instancetype)create
{
    return [[self alloc]init];
    
}



- (void)showWriteweiboview
{
    UIWindow *keywindow = [UIApplication sharedApplication].keyWindow;
    self.frame = CGRectMake(0, 0, TScreenWidth, TScreenHeight);
    self.backgroundColor = [UIColor colorWithRed:244/255.0 green:244/255.0 blue:244/255.0 alpha:1];
    
    [keywindow addSubview:self];
    
    [self bgimageview];
    [self deletebutton];
    [self createAnimationbutton];
    [self setbuttonAnimationisShow:YES];
    
}


- (NSMutableArray *)buttonarray
{
    if (_buttonarray == nil) {
        
        _buttonarray = [NSMutableArray array];
        
    }
    return _buttonarray;
}




- (UIImageView *)bgimageview
{
    if (_bgimageview == nil) {
        _bgimageview = [[UIImageView alloc]initWithFrame:CGRectMake((TScreenWidth-150)/2, 100, 200, 100)];
        
        _bgimageview.contentMode = UIViewContentModeScaleAspectFit;
        
        _bgimageview.image = [UIImage imageNamed:@"compose_slogan"];
        
        [self addSubview:_bgimageview];
    }
    
    return _bgimageview;
}

- (void)createAnimationbutton
{
    NSArray *imagebutton = @[@"tabbar_compose_idea",
                             @"tabbar_compose_photo",
                             @"tabbar_compose_camera",
                             @"tabbar_compose_lbs",
                             @"tabbar_compose_review",
                             @"tabbar_compose_more"];
    
    NSArray *titlebutton = @[@"文字",@"相册",@"相机",@"签到",@"点评",@"更多"];
    
    CGFloat buttonheight = 100;
    CGFloat buttonwidth = (TScreenWidth - 40)/3;
    
    for (int i = 0; i < 6; i++) {
        
        CGFloat x = 10 +(buttonwidth+10)*(i % 3);
        CGFloat y = TScreenHeight +(i/3)*buttonheight;
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.tag = i;
        button.frame = CGRectMake(x, y, buttonwidth, buttonheight);
        
        [button setImage:[UIImage imageNamed:imagebutton[i]] forState:UIControlStateNormal];
        [button setTitle:titlebutton[i] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
         button.titleLabel.font = [UIFont systemFontOfSize:15];
        
//        button.backgroundColor = [UIColor grayColor];
        
        [button addTarget:self action:@selector(animationbuttonAction:) forControlEvents:UIControlEventTouchUpInside];
        
        CGFloat titleleft = TScreenHeight > 320 ? -75 :70;
        CGFloat imageleft = TScreenHeight > 320 ? 12 : 10;
        [button setTitleEdgeInsets:UIEdgeInsetsMake(100, titleleft, 0, 0)];
        [button setImageEdgeInsets:UIEdgeInsetsMake(-10, imageleft, 0, 0)];
        
        [self addSubview:button];
        
        [self.buttonarray addObject:button];
    }
    
    
}

- (void)animationbuttonAction:(UIButton *)button
{
    [UIView animateWithDuration:0.5 animations:^{
        button.transform = CGAffineTransformMakeScale(1.5, 1.5);
        button.alpha = 0;
        
    }];
    
    [self.buttonarray removeObject:button];
    for (UIButton *button in self.buttonarray) {
        
        [UIView animateWithDuration:0.5 animations:^{
            button.transform = CGAffineTransformMakeScale(0.5, 0.5);
            button.alpha = 0;
        }];
    }
   
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        [self removeFromSuperview];
    });
}




- (UIButton *)deletebutton
{
    if (_deletebutton == nil) {
        _deletebutton = [UIButton buttonWithType:UIButtonTypeContactAdd];
    
        _deletebutton.frame = CGRectMake(0, TScreenHeight-45, TScreenWidth, 45);
        _deletebutton.backgroundColor = [UIColor whiteColor];
        
        [_deletebutton setImage:[UIImage imageNamed:@"tabbar_compose_background_icon_close"] forState:UIControlStateNormal];
        
        [_deletebutton addTarget:self action:@selector(closeviewAction) forControlEvents:UIControlEventTouchUpInside];
        
        [self addSubview:_deletebutton];
    
    }
    return _deletebutton;
}

- (void)closeviewAction
{
    [self setbuttonAnimationisShow:NO];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        [self removeFromSuperview];
        
    });
    
}




- (void)setbuttonAnimationisShow:(BOOL)isShow
{
    
    CGFloat onerowY = TScreenHeight -320;
    CGFloat tworewY = TScreenHeight -200;
    CGFloat delay = 0;
    
    if (!isShow) {
        
        onerowY = TScreenHeight;
        tworewY = TScreenHeight+100;
        delay = 0.3;
    }
    
    for (UIButton *button  in self.buttonarray) {
        
        [UIView animateWithDuration:0.8 delay:delay usingSpringWithDamping:0.7 initialSpringVelocity:0 options:0 animations:^{
            
            button.y = button.tag<3 ? onerowY : tworewY;
            
        } completion:^(BOOL finished) {
            
        }];
        
        delay = isShow ? delay+0.05 : delay-0.05;
        
    }
    
}




@end
