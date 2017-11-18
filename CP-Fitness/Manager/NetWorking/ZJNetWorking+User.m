//
//  ZJNetWorking+User.m
//  CP-Fitness
//
//  Created by 张敬 on 2017/11/18.
//  Copyright © 2017年 Jing Zhang. All rights reserved.
//

#import "ZJNetWorking+User.h"

@implementation ZJNetWorking (User)

#pragma mark ------- 用户名／邮箱注册 ------
- (void)userRegistWithUserModel:(UserModel *)userModel callBack:(BusinessOperationCallback)callBack
{
    NSString *urlStr = NSStringFormat(URL_Server, URL_User_NameOrEmailBox_Register);
    NSMutableDictionary *parameters = @{}.mutableCopy;
    [parameters setValue:APP_Channel forKey:@"channel"];
    [parameters setValue:userModel.username forKey:@"username"];
    [parameters setValue:userModel.password forKey:@"password"];
    [parameters setValue:userModel.email forKey:@"email"];
    [ZJNetWorkingHelper postJsonWithUrl:urlStr parameter:parameters
                                success:^(NSDictionary *responseObject){
                                    
                                    _flag = NO;_result = nil;_eMsg = nil;
                                        if (responseObject)
                                            {
                                                long errnoNumber = [[responseObject objectForKey:@"errno"] longValue];
                                                if (errnoNumber == 0){
                                                    _flag = YES;
                                                    _result = responseObject;
                                                    DDLog(@"regist success");}
                                            }else{
                                                _eMsg = @"数据异常";
                                                DDLog(@"%@",[responseObject objectForKey:@"errmsg"]);
                                            }
                                    callBack(_flag,_result,_eMsg);
                                    }
                                   fail:^(NSError *error){
                                        if (error){
                                            _eMsg = [NSString stringWithFormat:@"%@",error];
                                            DDLog(@"%@",error);
                                        }
                                       callBack(_flag,_result,_eMsg);
                                       }
     ];
}

#pragma mark ------- 用户名／邮箱登陆 -------
- (void)userLoginWithUserModel:(UserModel *)userModel callBack:(BusinessOperationCallback)callBack
{
    NSString *urlStr = NSStringFormat(URL_Server, URL_User_NameOrEmailBox_Login);
    NSMutableDictionary *parameters = @{}.mutableCopy;
    [parameters setValue:APP_Channel forKey:@"channel"];
    [parameters setValue:userModel.username forKey:@"username"];
    [parameters setValue:userModel.password forKey:@"password"];
    [parameters setValue:@"iphone" forKey:@"source"];
    [ZJNetWorkingHelper postJsonWithUrl:urlStr parameter:parameters
                                success:^(NSDictionary *responseObject){
                                    
                                    _flag = NO;_result = nil;_eMsg = nil;
                                    if (responseObject)
                                    {
                                        long errnoNumber = [[responseObject objectForKey:@"errno"] longValue];
                                        if (errnoNumber == 0){
                                            _flag = YES;
                                            _result = responseObject;
                                            DDLog(@"regist success");}
                                    }else{
                                        _eMsg = @"数据异常";
                                        DDLog(@"%@",[responseObject objectForKey:@"errmsg"]);
                                    }
                                    callBack(_flag,_result,_eMsg);
                                }
                                   fail:^(NSError *error){
                                       if (error){
                                           _eMsg = [NSString stringWithFormat:@"%@",error];
                                           DDLog(@"%@",error);
                                       }
                                       callBack(_flag,_result,_eMsg);
                                   }
     ];
}

@end
