//
//  UIWindow+Rootviewcontroller.m
//  weibo
//
//  Created by zjq on 15-10-7.
//  Copyright (c) 2015年 zjq. All rights reserved.
//

#import "UIWindow+Rootviewcontroller.h"

@implementation UIWindow (Rootviewcontroller)

- (void)setWindowrootviewcontroller
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    NSString *oldversion = [[NSUserDefaults standardUserDefaults]objectForKey:@"version"];
    //获取当前应用的版本号
    NSDictionary *infodic = [NSBundle mainBundle].infoDictionary;
    NSString *versionnum = infodic[@"CFBundleVersion"];
    if ([versionnum isEqualToString:oldversion]) {
        
        self.rootViewController = [storyboard instantiateInitialViewController];
        
    }else
    {
        self.rootViewController = [storyboard instantiateViewControllerWithIdentifier:@"WelcomeViewController"];
        //保存当前应用的版本号
        [[NSUserDefaults standardUserDefaults]setObject:versionnum forKey:@"version"];
        [[NSUserDefaults standardUserDefaults]synchronize];
        
        
    }
    
}

@end
