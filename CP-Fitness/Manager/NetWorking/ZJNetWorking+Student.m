//
//  ZJNetWorking+Student.m
//  CP-Fitness
//
//  Created by 张敬 on 2017/11/18.
//  Copyright © 2017年 Jing Zhang. All rights reserved.
//

#import "ZJNetWorking+Student.h"

@implementation ZJNetWorking (Student)
#pragma mark ------- 获取教练列表 -------
- (void)studentTeacherListWithUserModel:(UserModel *)userModel callBack:(BusinessOperationCallback)callBack
{
    NSString *urlStr = NSStringFormat(URL_Server, URL_Student_TeacherMumber_List);
    
    NSMutableDictionary *parameters = @{}.mutableCopy;
    [parameters setValue:APP_Channel forKey:@"channel"];
    [parameters setValue:userModel.gymCode forKey:@"gymCode"];
    
    [self getResponseDateWithUrl:urlStr parameter:parameters callBack:callBack];
}

#pragma mark ------- 学员临时绑定教练 -------
- (void)studentTeacherBlindingWithUserModel:(UserModel *)userModel callBack:(BusinessOperationCallback)callBack
{
    NSString *urlStr = NSStringFormat(URL_Server, URL_Student_Teacher_Blinding);
    
    NSMutableDictionary *parameters = @{}.mutableCopy;
    [parameters setValue:APP_Channel forKey:@"channel"];
    [parameters setValue:userModel.gymCode forKey:@"gymCode"];
    [parameters setValue:userModel.coachId forKey:@"coachId"];
    
    [self getResponseDateWithUrl:urlStr parameter:parameters callBack:callBack];
}

#pragma mark ------- 获取学员临时绑定的教练 -------
- (void)studentTeacherBlindedListWithUserModel:(UserModel *)userModel callBack:(BusinessOperationCallback)callBack
{
    NSString *urlStr = NSStringFormat(URL_Server, URL_Student_TeacherNumber_Blinded_List);
    
    NSMutableDictionary *parameters = @{}.mutableCopy;
    [parameters setValue:APP_Channel forKey:@"channel"];
    [parameters setValue:userModel.gymCode forKey:@"gymCode"];
    
    [self getResponseDateWithUrl:urlStr parameter:parameters callBack:callBack];
}

#pragma mark ------- 学员解除与教练的绑定 -------
- (void)studentTeacherBlindedDeleteWithUserModel:(UserModel *)userModel callBack:(BusinessOperationCallback)callBack
{
    NSString *urlStr = NSStringFormat(URL_Server, URL_Student_Teacher_Blinded_Delete);
    
    NSMutableDictionary *parameters = @{}.mutableCopy;
    [parameters setValue:APP_Channel forKey:@"channel"];
    [parameters setValue:userModel.gymCode forKey:@"gymCode"];
    
    [self getResponseDateWithUrl:urlStr parameter:parameters callBack:callBack];
}

#pragma mark ------- 注册心率带（查询训练数据）-------
- (void)studentRegistHeartRateWithUserModel:(UserModel *)userModel callBack:(BusinessOperationCallback)callBack
{
    NSString *urlStr = NSStringFormat(URL_Server, URL_Student_HeartRate_Regist);
    
    NSMutableDictionary *parameters = @{}.mutableCopy;
    [parameters setValue:APP_Channel forKey:@"channel"];
    [parameters setValue:userModel.clubCode forKey:@"clubCode"];
    [parameters setValue:userModel.deviceCode forKey:@"deviceCode"];
    
    [self getResponseDateWithUrl:urlStr parameter:parameters callBack:callBack];
}

#pragma mark ------- 更新用户测量数值 -------
- (void)studentUpdateMeasureNumberWithUserModel:(UserModel *)userModel callBack:(BusinessOperationCallback)callBack
{
    NSString *urlStr = NSStringFormat(URL_Server, URL_Student_MeasureNumber_Update);
    
    NSMutableDictionary *parameters = @{}.mutableCopy;
    [parameters setValue:APP_Channel forKey:@"channel"];
    
    [self getResponseDateWithUrl:urlStr parameter:parameters callBack:callBack];
}

#pragma mark ------- 获取用户测量数据 -------
- (void)studentGetMeasureNumberWithUserModel:(UserModel *)userModel callBack:(BusinessOperationCallback)callBack
{
    NSString *urlStr = NSStringFormat(URL_Server, URL_Student_MeasureNumber_Get);
    
    NSMutableDictionary *parameters = @{}.mutableCopy;
    [parameters setValue:APP_Channel forKey:@"channel"];
    
    [self getResponseDateWithUrl:urlStr parameter:parameters callBack:callBack];
}

#pragma mark ------- 创建目标 -------
- (void)studentCreateAimWithUserModel:(UserModel *)userModel callBack:(BusinessOperationCallback)callBack
{
    NSString *urlStr = NSStringFormat(URL_Server, URL_Student_Aim_Create);
    
    NSMutableDictionary *parameters = @{}.mutableCopy;
    [parameters setValue:APP_Channel forKey:@"channel"];
    [parameters setValue:userModel.name forKey:@"name"];
    [parameters setValue:userModel.type forKey:@"type"];
    [parameters setValue:userModel.startTime forKey:@"startTime"];
    [parameters setValue:userModel.endTime forKey:@"endTime"];
    [parameters setValue:userModel.date forKey:@"date"];
    
    [self getResponseDateWithUrl:urlStr parameter:parameters callBack:callBack];
}

#pragma mark ------- 用户目标列表 -------
- (void)studentAimListWithUserModel:(UserModel *)userModel callBack:(BusinessOperationCallback)callBack
{
    NSString *urlStr = NSStringFormat(URL_Server, URL_Student_Aim_Mine);
    
    NSMutableDictionary *parameters = @{}.mutableCopy;
    [parameters setValue:APP_Channel forKey:@"channel"];
    [parameters setValue:userModel.start forKey:@"start"];
    [parameters setValue:userModel.length forKey:@"length"];
    
    [self getResponseDateWithUrl:urlStr parameter:parameters callBack:callBack];
}

#pragma mark ------- 创建挑战 -------
- (void)studentCreateChallengeChWithUserModel:(UserModel *)userModel callBack:(BusinessOperationCallback)callBack
{
    NSString *urlStr = NSStringFormat(URL_Server, URL_Student_Challenge_Create);
    
    NSMutableDictionary *parameters = @{}.mutableCopy;
    [parameters setValue:APP_Channel forKey:@"channel"];
    [parameters setValue:userModel.name forKey:@"name"];
    [parameters setValue:userModel.image forKey:@"image"];
    [parameters setValue:userModel.type forKey:@"type"];
    [parameters setValue:userModel.startTime forKey:@"startTime"];
    
    [self getResponseDateWithUrl:urlStr parameter:parameters callBack:callBack];
}

#pragma mark ------- 我的挑战列表 -------
- (void)studentChallengeListChWithUserModel:(UserModel *)userModel callBack:(BusinessOperationCallback)callBack
{
    NSString *urlStr = NSStringFormat(URL_Server, URL_Student_Challenge_Mine);
    
    NSMutableDictionary *parameters = @{}.mutableCopy;
    [parameters setValue:APP_Channel forKey:@"channel"];
    [parameters setValue:userModel.start forKey:@"start"];
    [parameters setValue:userModel.length forKey:@"length"];
    
    [self getResponseDateWithUrl:urlStr parameter:parameters callBack:callBack];
}

#pragma mark ------- 获取挑战的用户数据排行 -------
- (void)studentChallengeRankChWithUserModel:(UserModel *)userModel callBack:(BusinessOperationCallback)callBack
{
    NSString *urlStr = NSStringFormat(URL_Server, URL_Student_Challenge_Rank);
    
    NSMutableDictionary *parameters = @{}.mutableCopy;
    [parameters setValue:APP_Channel forKey:@"channel"];
    
    [self getResponseDateWithUrl:urlStr parameter:parameters callBack:callBack];
}

#pragma mark ------- 退出挑战 -------
- (void)studentChallengeQuitChWithUserModel:(UserModel *)userModel callBack:(BusinessOperationCallback)callBack
{
    NSString *urlStr = NSStringFormat(URL_Server, URL_Student_Challenge_Quit);
    
    NSMutableDictionary *parameters = @{}.mutableCopy;
    [parameters setValue:APP_Channel forKey:@"channel"];
    
    [self getResponseDateWithUrl:urlStr parameter:parameters callBack:callBack];
}

#pragma mark ------- 获取用户的统计数据 -------
- (void)studentSportStateWithUserModel:(UserModel *)userModel callBack:(BusinessOperationCallback)callBack
{
    NSString *urlStr = NSStringFormat(URL_Server, URL_Student_SportState_Mine);
    
    NSMutableDictionary *parameters = @{}.mutableCopy;
    [parameters setValue:APP_Channel forKey:@"channel"];
    
    [self getResponseDateWithUrl:urlStr parameter:parameters callBack:callBack];
}

#pragma mark ------- 通过盒子mac获取绑定的HUB蓝牙路由器信息 -------
- (void)studentHeartRateNumberUserModel:(UserModel *)userModel callBack:(BusinessOperationCallback)callBack
{
    NSString *urlStr = NSStringFormat(URL_Server, URL_Student_HeartRate_Number_Get);
    
    NSMutableDictionary *parameters = @{}.mutableCopy;
    [parameters setValue:APP_Channel forKey:@"channel"];
    [parameters setValue:userModel.mac forKey:@"mac"];
    
    [self getResponseDateWithUrl:urlStr parameter:parameters callBack:callBack];
}

#pragma mark ------- 获取全部用户、运动时间、健身馆等信息 -------
- (void)studentSportStateListUserModel:(UserModel *)userModel callBack:(BusinessOperationCallback)callBack
{
    NSString *urlStr = NSStringFormat(URL_Server, URL_Student_SportState_All_List);
    
    NSMutableDictionary *parameters = @{}.mutableCopy;
    [parameters setValue:APP_Channel forKey:@"channel"];
    [parameters setValue:userModel.mac forKey:@"mac"];
    
    [self getResponseDateWithUrl:urlStr parameter:parameters callBack:callBack];
}

#pragma mark ------- 获取用户未参与的挑战 -------
- (void)studentMatchJoinListUserModel:(UserModel *)userModel callBack:(BusinessOperationCallback)callBack
{
    NSString *urlStr = NSStringFormat(URL_Server, URL_Student_Match_NoJion);
    
    NSMutableDictionary *parameters = @{}.mutableCopy;
    [parameters setValue:APP_Channel forKey:@"channel"];
    
    [self getResponseDateWithUrl:urlStr parameter:parameters callBack:callBack];
}

#pragma mark ------- 加入挑战 -------
- (void)studentMatchJoinUserModel:(UserModel *)userModel callBack:(BusinessOperationCallback)callBack
{
    NSString *urlStr = NSStringFormat(URL_Server, URL_Student_Match_Jion);
    
    NSMutableDictionary *parameters = @{}.mutableCopy;
    [parameters setValue:APP_Channel forKey:@"channel"];
    [parameters setValue:userModel.gymCode forKey:@"gymCode"];
    [parameters setValue:userModel.challengeId forKey:@"challengeId"];
    
    [self getResponseDateWithUrl:urlStr parameter:parameters callBack:callBack];
}

#pragma mark ------- 我加入的竞技挑战 -------
- (void)studentMatchJoinMineListUserModel:(UserModel *)userModel callBack:(BusinessOperationCallback)callBack
{
    NSString *urlStr = NSStringFormat(URL_Server, URL_Studnet_Match_Mine);
    
    NSMutableDictionary *parameters = @{}.mutableCopy;
    [parameters setValue:APP_Channel forKey:@"channel"];
    [parameters setValue:userModel.gymCode forKey:@"gymCode"];
    [parameters setValue:userModel.status forKey:@"status"];
    
    [self getResponseDateWithUrl:urlStr parameter:parameters callBack:callBack];
}

#pragma mark ------- 退出挑战 -------
- (void)studentMatchQuitUserModel:(UserModel *)userModel callBack:(BusinessOperationCallback)callBack
{
    NSString *urlStr = NSStringFormat(URL_Server, URL_Student_Match_Quit);
    
    NSMutableDictionary *parameters = @{}.mutableCopy;
    [parameters setValue:APP_Channel forKey:@"channel"];
    [parameters setValue:userModel.gymCode forKey:@"gymCode"];
    [parameters setValue:userModel.challengeId forKey:@"challengeId"];
    
    [self getResponseDateWithUrl:urlStr parameter:parameters callBack:callBack];
}

#pragma mark ------- 根据日期获取团课排期列表 -------
- (void)studentGroupCourseListUserModel:(UserModel *)userModel callBack:(BusinessOperationCallback)callBack
{
    NSString *urlStr = NSStringFormat(URL_Server, URL_Student_GroupCourse_List);
    
    NSMutableDictionary *parameters = @{}.mutableCopy;
    [parameters setValue:APP_Channel forKey:@"channel"];
    [parameters setValue:userModel.gymCode forKey:@"gymCode"];
    [parameters setValue:userModel.startTime forKey:@"startTime"];
    [parameters setValue:userModel.endTime forKey:@"endTime"];
    
    [self getResponseDateWithUrl:urlStr parameter:parameters callBack:callBack];
}

@end
