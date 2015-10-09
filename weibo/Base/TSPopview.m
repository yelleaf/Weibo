//
//  TSPopview.m
//  weibo
//
//  Created by zjq on 15-10-6.
//  Copyright (c) 2015年 zjq. All rights reserved.
//

#import "TSPopview.h"


@interface TSPopview ()

@property(nonatomic,strong)UIImageView *Popimageview;

@end

@implementation TSPopview

+(instancetype)creat
{
    return [[self alloc]init];
}


- (UIImageView *)Popimageview
{
    if (_Popimageview == nil) {
        _Popimageview = [[UIImageView alloc]init];
        
        _Popimageview.userInteractionEnabled = YES;
        
        [self addSubview:_Popimageview];
    }
    
    
    
    return _Popimageview;
}

- (void)showPopview:(UIView *)view withType:(Popviewtype)type
{
    UIWindow *keywindow = [UIApplication sharedApplication].keyWindow;
    self.frame = keywindow.bounds;
    
    [keywindow addSubview:self];
    
//    self.Popimageview.bounds = CGRectMake(0, 0, 100, 150);
    
    CGRect newframe = [view convertRect:view.bounds toView:keywindow];
    
    self.Popimageview.y = CGRectGetMaxY(newframe);
    
    NSString *imagename = nil;
    if (type == Popviewisleft) {
        imagename = @"popover_background_left";
        self.Popimageview.X = CGRectGetMinX(newframe);
    }else if (type == Popviewiscenter){
        
        imagename = @"popover_background";
        self.Popimageview.centerX = CGRectGetMidX(newframe);
    }else if (type == Popviewisright){
        
        imagename = @"popover_background_right";
        self.Popimageview.x = CGRectGetMaxX(newframe)- CGRectGetWidth(self.Popimageview.frame);
    }
    
    UIImage *imgae = [UIImage imageNamed:imagename];
    imgae = [imgae stretchableImageWithLeftCapWidth:10 topCapHeight:20];
    _Popimageview.image = imgae;

//    self.Popimageview.centerX = CGRectGetMidX(newframe);
    
    
}

- (void)setContentview:(UIView *)contentview
{
    _contentview= contentview;
    
    contentview.x = 5;
    contentview.y = 12;
    
    self.Popimageview.width = contentview.width+10;
    self.Popimageview.height = contentview.height+20;
    
    [self.Popimageview addSubview:contentview];
    
}




- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    
    [self removeFromSuperview];
    
    
}


@end
