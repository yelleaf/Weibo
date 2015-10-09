//
//  TokenModel.m
//  weibo
//
//  Created by zjq on 15-10-7.
//  Copyright (c) 2015年 zjq. All rights reserved.
//

#import "TokenModel.h"

@implementation TokenModel 

- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    self.createdate = [NSDate date];
}
//加密
- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.access_token forKey:@"access_token"];
    [aCoder encodeObject:self.expires_in forKey:@"expires_in"];
    [aCoder encodeObject:self.uid forKey:@"uid"];
    [aCoder encodeObject:self.createdate forKey:@"createdate"];
}


//解密
- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if (self) {
        
        self.access_token = [aDecoder decodeObjectForKey:@"access_token"];
        self.expires_in = [aDecoder decodeObjectForKey:@"expires_in"];
        self.uid = [aDecoder decodeObjectForKey:@"uid"];
        self.createdate = [aDecoder decodeObjectForKey:@"createdate"];
    }
    
    return self;
}



@end
