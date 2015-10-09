//
//  TSPopview.h
//  weibo
//
//  Created by zjq on 15-10-6.
//  Copyright (c) 2015年 zjq. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    Popviewisleft,
    Popviewiscenter,
    Popviewisright,
} Popviewtype;

@interface TSPopview : UIView

@property(nonatomic,strong)UIView *contentview;

- (void)showPopview:(UIView *)view withType:(Popviewtype)type;

+ (instancetype)creat;


@end
