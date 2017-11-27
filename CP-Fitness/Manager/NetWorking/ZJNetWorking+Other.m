//
//  ZJNetWorking+Other.m
//  CP-Fitness
//
//  Created by 张敬 on 2017/11/18.
//  Copyright © 2017年 Jing Zhang. All rights reserved.
//

#import "ZJNetWorking+Other.h"

@implementation ZJNetWorking (Other)

#pragma mark ------- 获取盒子app升级信息，启动时调用 -------
- (void)otherAppVersionUpdateWithUserModel:(UserModel *)userModel callBack:(BusinessOperationCallback)callBack
{
    NSString *urlStr = NSStringFormat(URL_Server, URL_App_Version_Update);
    
    NSMutableDictionary *parameters = @{}.mutableCopy;
    [parameters setValue:APP_Channel forKey:@"channel"];
    [parameters setValue:userModel.mac forKey:@"mac"];
    [parameters setValue:userModel.versionCode forKey:@"versionCode"];
    
    [self getResponseDataWithUrl:urlStr parameter:parameters callBack:callBack];
}

#pragma mark ------- 上传运动数据 -------
- (void)otherSportDataSendWithUserModel:(UserModel *)userModel callBack:(BusinessOperationCallback)callBack
{
    NSString *urlStr = NSStringFormat(URL_Server, URL_SportData_Send);
    
    NSMutableDictionary *parameters = @{}.mutableCopy;
    [parameters setValue:APP_Channel forKey:@"channel"];
    [parameters setValue:userModel.indexid forKey:@"indexid"];
    
    [self getResponseDataWithUrl:urlStr parameter:parameters callBack:callBack];
}

#pragma mark ------- 广告 -------
- (void)otherAdListWithUserModel:(UserModel *)userModel callBack:(BusinessOperationCallback)callBack
{
    NSString *urlStr = NSStringFormat(URL_Server, URL_Ad_List);
    
    NSMutableDictionary *parameters = @{}.mutableCopy;
    [parameters setValue:APP_Channel forKey:@"channel"];
    [parameters setValue:userModel.indexid forKey:@"indexid"];
    
    [self getResponseDataWithUrl:urlStr parameter:parameters callBack:callBack];
}

@end
