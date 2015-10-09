//
//  TSBaseModel.m
//  weibo
//
//  Created by zjq on 15-10-7.
//  Copyright (c) 2015年 zjq. All rights reserved.
//

#import "TSBaseModel.h"

@implementation TSBaseModel


- (instancetype)initWithDictionary:(NSDictionary *)dic
{
    self = [super init];
    if (self) {
        if ([dic isKindOfClass:[NSDictionary class]]) {
            
            [self setValuesForKeysWithDictionary:dic];
        }else
        {
            NSLog(@"数据不是字典类型！");
        }
    }
    
    
    return self;
    
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    
}

@end
