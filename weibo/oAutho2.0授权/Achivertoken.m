//
//  Achivertoken.m
//  weibo
//
//  Created by zjq on 15-10-7.
//  Copyright (c) 2015年 zjq. All rights reserved.
//
#define TokenAchiverPath  [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"tokenModel.plist"]

#import "Achivertoken.h"
#import "TokenModel.h"

@implementation Achivertoken

+ (void)achivertokenmodel:(TokenModel *)model
{
    
    [NSKeyedArchiver archiveRootObject:model toFile:TokenAchiverPath];

}
+ (TokenModel *)unarchivertokenmodel
{
    TokenModel *model = [NSKeyedUnarchiver unarchiveObjectWithFile:TokenAchiverPath ];
     NSLog(@"token = %@",TokenAchiverPath);
    
    NSDate *date = [model.createdate dateByAddingTimeInterval:[model.expires_in doubleValue]];
    
    //判断当前日期降序则过期
    NSComparisonResult result = [[NSDate date]compare:date];
    if (result == NSOrderedDescending) {
    
        return nil;
    }
    
    return  model;
}

@end
