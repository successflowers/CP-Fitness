//
//  ZJNetWorking+Other.h
//  CP-Fitness
//
//  Created by 张敬 on 2017/11/18.
//  Copyright © 2017年 Jing Zhang. All rights reserved.
//

#import "ZJNetWorking.h"

@interface ZJNetWorking (Other)
//上传图片接口(base64)
//获取盒子app升级信息，启动时调用
- (void)otherAppVersionUpdateWithUserModel:(UserModel *)userModel callBack:(BusinessOperationCallback)callBack;
//上传运动数据
- (void)otherSportDataSendWithUserModel:(UserModel *)userModel callBack:(BusinessOperationCallback)callBack;
//更新运动标题/背景图
//广告
- (void)otherAdListWithUserModel:(UserModel *)userModel callBack:(BusinessOperationCallback)callBack;

@end
