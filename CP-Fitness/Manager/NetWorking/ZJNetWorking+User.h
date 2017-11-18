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

@end
