//
//  ZJNetWorking+User.h
//  CP-Fitness
//
//  Created by 张敬 on 2017/11/18.
//  Copyright © 2017年 Jing Zhang. All rights reserved.
//

#import "ZJNetWorking.h"

@interface ZJNetWorking (User)

//用户名／邮箱注册
- (void)userRegistWithUserModel:(UserModel *)userModel callBack:(BusinessOperationCallback)callBack;
//用户名／邮箱登陆
- (void)userLoginWithUserModel:(UserModel *)userModel callBack:(BusinessOperationCallback)callBack;
//检测用户名／邮箱
- (void)userCheckUserNameOrEmailBoxWithUserModel:(UserModel *)userModel callBack:(BusinessOperationCallback)callBack;
//发送邮箱验证码
- (void)userSendKeyToEmailBoxWithUserModel:(UserModel *)userModel callBack:(BusinessOperationCallback)callBack;
//修改用户密码
- (void)userModifyPassWordWithUserModel:(UserModel *)userModel callBack:(BusinessOperationCallback)callBack;
//修改用户信息，可单项修改
- (void)userModifyUserImformationUserModel:(UserModel *)userModel callBack:(BusinessOperationCallback)callBack;
//获取用户信息
- (void)userGetUserImformationUserModel:(UserModel *)userModel callBack:(BusinessOperationCallback)callBack;

@end
