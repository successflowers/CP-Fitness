//
//  ZJNetWorking+Student.h
//  CP-Fitness
//
//  Created by 张敬 on 2017/11/18.
//  Copyright © 2017年 Jing Zhang. All rights reserved.
//

#import "ZJNetWorking.h"

@interface ZJNetWorking (Student)
//获取教练列表
- (void)studentTeacherListWithUserModel:(UserModel *)userModel callBack:(BusinessOperationCallback)callBack;
//学员临时绑定教练
- (void)studentTeacherBlindingWithUserModel:(UserModel *)userModel callBack:(BusinessOperationCallback)callBack;
//获取学员临时绑定的教练
- (void)studentTeacherBlindedListWithUserModel:(UserModel *)userModel callBack:(BusinessOperationCallback)callBack;
//学员解除与教练的绑定
- (void)studentTeacherBlindedDeleteWithUserModel:(UserModel *)userModel callBack:(BusinessOperationCallback)callBack;

//注册心率带（查询训练数据）
- (void)studentRegistHeartRateWithUserModel:(UserModel *)userModel callBack:(BusinessOperationCallback)callBack;
//更新用户测量数值
- (void)studentUpdateMeasureNumberWithUserModel:(UserModel *)userModel callBack:(BusinessOperationCallback)callBack;
//获取用户测量数据
- (void)studentGetMeasureNumberWithUserModel:(UserModel *)userModel callBack:(BusinessOperationCallback)callBack;
//创建目标
- (void)studentCreateAimWithUserModel:(UserModel *)userModel callBack:(BusinessOperationCallback)callBack;
//用户目标列表
- (void)studentAimListWithUserModel:(UserModel *)userModel callBack:(BusinessOperationCallback)callBack;
//创建挑战
- (void)studentCreateChallengeChWithUserModel:(UserModel *)userModel callBack:(BusinessOperationCallback)callBack;
//我的挑战列表
- (void)studentChallengeListChWithUserModel:(UserModel *)userModel callBack:(BusinessOperationCallback)callBack;
//获取挑战的用户数据排行
- (void)studentChallengeRankChWithUserModel:(UserModel *)userModel callBack:(BusinessOperationCallback)callBack;
//退出挑战
- (void)studentChallengeQuitChWithUserModel:(UserModel *)userModel callBack:(BusinessOperationCallback)callBack;
//获取用户的统计数据
- (void)studentSportStateWithUserModel:(UserModel *)userModel callBack:(BusinessOperationCallback)callBack;
//通过盒子mac获取绑定的HUB蓝牙路由器信息
- (void)studentHeartRateNumberUserModel:(UserModel *)userModel callBack:(BusinessOperationCallback)callBack;
//获取全部用户、运动时间、健身馆等信息
- (void)studentSportStateListUserModel:(UserModel *)userModel callBack:(BusinessOperationCallback)callBack;
//获取用户未参与的挑战
- (void)studentMatchJoinListUserModel:(UserModel *)userModel callBack:(BusinessOperationCallback)callBack;
//加入挑战
- (void)studentMatchJoinUserModel:(UserModel *)userModel callBack:(BusinessOperationCallback)callBack;
//我加入的竞技挑战
- (void)studentMatchJoinMineListUserModel:(UserModel *)userModel callBack:(BusinessOperationCallback)callBack;
//退出挑战
- (void)studentMatchQuitUserModel:(UserModel *)userModel callBack:(BusinessOperationCallback)callBack;
//根据日期获取团课排期列表
- (void)studentGroupCourseListUserModel:(UserModel *)userModel callBack:(BusinessOperationCallback)callBack;

@end
