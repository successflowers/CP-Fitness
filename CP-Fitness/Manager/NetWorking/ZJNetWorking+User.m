//
//  ZJNetWorking+User.m
//  CP-Fitness
//
//  Created by 张敬 on 2017/11/18.
//  Copyright © 2017年 Jing Zhang. All rights reserved.
//

#import "ZJNetWorking+User.h"

@implementation ZJNetWorking (User)

#pragma mark ------- 用户名／邮箱注册 -------
- (void)userRegistWithUserModel:(UserModel *)userModel callBack:(BusinessOperationCallback)callBack
{
    NSString *urlStr = NSStringFormat(URL_Server, URL_User_NameOrEmailBox_Register);
    
    NSMutableDictionary *parameters = @{}.mutableCopy;
    [parameters setValue:APP_Channel forKey:@"channel"];
    [parameters setValue:userModel.username forKey:@"username"];
    [parameters setValue:userModel.password forKey:@"password"];
    [parameters setValue:userModel.email forKey:@"email"];
    
    [self getResponseDataWithUrl:urlStr parameter:parameters callBack:callBack];
}

#pragma mark ------- 用户名／邮箱登陆 -------
- (void)userLoginWithUserModel:(UserModel *)userModel callBack:(BusinessOperationCallback)callBack
{
    NSString *urlStr = NSStringFormat(URL_Server, URL_User_NameOrEmailBox_Login);
    NSMutableDictionary *parameters = @{}.mutableCopy;
    [parameters setValue:APP_Channel forKey:@"channel"];
    [parameters setValue:userModel.username forKey:@"username"];
    [parameters setValue:userModel.password forKey:@"password"];
    [parameters setValue:@"2" forKey:@"source"]; //source 1=android,2=iphone
    [self getResponseDataWithUrl:urlStr parameter:parameters callBack:callBack];
}

#pragma mark ------- 检测用户名／邮箱 -------
- (void)userCheckUserNameOrEmailBoxWithUserModel:(UserModel *)userModel callBack:(BusinessOperationCallback)callBack
{
    NSString *urlStr = NSStringFormat(URL_Server, URL_User_NameOrEmailBox_Check);
    NSMutableDictionary *parameters = @{}.mutableCopy;
    [parameters setValue:APP_Channel forKey:@"channel"];
    if (userModel.username) {
         [parameters setValue:userModel.username forKey:@"username"];
    }else{
        [parameters setValue:userModel.password forKey:@"password"];
    }
    [self getResponseDataWithUrl:urlStr parameter:parameters callBack:callBack];
}

#pragma mark ------- 发送邮箱验证码 -------
- (void)userSendKeyToEmailBoxWithUserModel:(UserModel *)userModel callBack:(BusinessOperationCallback)callBack
{
    NSString *urlStr = NSStringFormat(URL_Server, URL_User_EmailBox_Keypass_Send);
    NSMutableDictionary *parameters = @{}.mutableCopy;
    [parameters setValue:APP_Channel forKey:@"channel"];
    [parameters setValue:userModel.email forKey:@"email"];
    [parameters setValue:@"1" forKey:@"templet"];
  
   [self getResponseDataWithUrl:urlStr parameter:parameters callBack:callBack];
}

#pragma mark ------- 修改密码（根据邮箱和验证码）-------
- (void)userModifyPassWordWithUserModel:(UserModel *)userModel callBack:(BusinessOperationCallback)callBack
{
    NSString *urlStr = NSStringFormat(URL_Server, URL_User_NameOrEmailBox_Keypass_Modify);
    NSMutableDictionary *parameters = @{}.mutableCopy;
    [parameters setValue:APP_Channel forKey:@"channel"];
    [parameters setValue:userModel.email forKey:@"email"];
    [parameters setValue:userModel.code forKey:@"code"];
    [parameters setValue:userModel.password forKey:@"password"];
   
    [self getResponseDataWithUrl:urlStr parameter:parameters callBack:callBack];
}
#pragma mark ------- 修改用户信息，可单项修改 -------
- (void)userModifyUserImformationUserModel:(UserModel *)userModel callBack:(BusinessOperationCallback)callBack
{
    NSString *urlStr = NSStringFormat(URL_Server, URL_User_Information_Modify);
    NSMutableDictionary *parameters = @{}.mutableCopy;
    [parameters setValue:APP_Channel forKey:@"channel"];
    [parameters setValue:userModel.email forKey:@"email"];
    [parameters setValue:userModel.code forKey:@"code"];
    [parameters setValue:userModel.password forKey:@"password"];
    
    [self getResponseDataWithUrl:urlStr parameter:parameters callBack:callBack];
}

#pragma mark ------- 获取用户信息 -------
- (void)userGetUserImformationUserModel:(UserModel *)userModel callBack:(BusinessOperationCallback)callBack
{
    NSString *urlStr = NSStringFormat(URL_Server, URL_User_Information_Get);
    NSMutableDictionary *parameters = @{}.mutableCopy;
    [parameters setValue:APP_Channel forKey:@"channel"];
    [parameters setValue:userModel.characterId forKey:@"characterId"];
    
    [self getResponseDataWithUrl:urlStr parameter:parameters callBack:callBack];
}

@end
