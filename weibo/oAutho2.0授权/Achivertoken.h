//
//  Achivertoken.h
//  weibo
//
//  Created by zjq on 15-10-7.
//  Copyright (c) 2015年 zjq. All rights reserved.
//

#import <Foundation/Foundation.h>

@class TokenModel;

@interface Achivertoken : NSObject

//本地保存（归档）tokenModel数据
+ (void)achivertokenmodel:(TokenModel *)model;

//解归档tokeModel数据
+ (TokenModel *)unarchivertokenmodel;





@end
