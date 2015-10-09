//
//  TokenModel.h
//  weibo
//
//  Created by zjq on 15-10-7.
//  Copyright (c) 2015年 zjq. All rights reserved.
//

#import "TSBaseModel.h"

@interface TokenModel : TSBaseModel <NSCoding>

@property(copy,nonatomic)NSString *access_token;
@property(strong,nonatomic)NSNumber *expires_in;
@property(strong,nonatomic)NSNumber *uid;

@property(strong,nonatomic)NSDate *createdate;

@end
