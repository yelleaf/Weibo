//
//  TSearchView.m
//  weibo
//
//  Created by zjq on 15-10-5.
//  Copyright (c) 2015年 zjq. All rights reserved.
//

#import "TSearchView.h"

@implementation TSearchView


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setSearchView];
    }
    
    return self;
}




- (void)setSearchView
{
    self.borderStyle = UITextBorderStyleNone;
    
    UIImage *bgimage = [UIImage imageNamed:@"search_navigationbar_textfield_background"];
    bgimage = [bgimage stretchableImageWithLeftCapWidth:5 topCapHeight:10];
    self.background = bgimage;
    self.placeholder = @"搜索";
    self.font = [UIFont systemFontOfSize:15];
    self.tintColor = [UIColor grayColor];
    self.clearButtonMode = UITextFieldViewModeAlways;
    UIImageView *leftview = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 20, 20)];
    
    leftview.contentMode = UIViewContentModeScaleAspectFill;
    leftview.image = [UIImage imageNamed:@"searchbar_textfield_search_icon"];
    
    self.leftViewMode = UITextFieldViewModeAlways;
    self.leftView = leftview;
    

    
    
}





@end
