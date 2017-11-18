//
//  ZJNetWorking+Teacher.m
//  CP-Fitness
//
//  Created by 张敬 on 2017/11/18.
//  Copyright © 2017年 Jing Zhang. All rights reserved.
//

#import "ZJNetWorking+Teacher.h"

@implementation ZJNetWorking (Teacher)
#pragma mark ------- 获取事件 -------
- (void)teacherEventListWithUserModel:(UserModel *)userModel callBack:(BusinessOperationCallback)callBack
{
    NSString *urlStr = NSStringFormat(URL_Server, URL_Teacher_Event_List);
    
    NSMutableDictionary *parameters = @{}.mutableCopy;
    [parameters setValue:APP_Channel forKey:@"channel"];
    [parameters setValue:userModel.mac forKey:@"mac"];
    
    [self getResponseDateWithUrl:urlStr parameter:parameters callBack:callBack];
}

#pragma mark ------- 获取健身馆可使用的盒子列表 -------
- (void)teacherCourseListWithUserModel:(UserModel *)userModel callBack:(BusinessOperationCallback)callBack
{
    NSString *urlStr = NSStringFormat(URL_Server, URL_Teacher_Course_List);
    
    NSMutableDictionary *parameters = @{}.mutableCopy;
    [parameters setValue:APP_Channel forKey:@"channel"];
    [parameters setValue:userModel.gymCode forKey:@"gymCode"];
    
    [self getResponseDateWithUrl:urlStr parameter:parameters callBack:callBack];
}

#pragma mark ------- 获取健身馆未绑定的会员列表 -------
- (void)teacherCourseStudentNoBlindedWithUserModel:(UserModel *)userModel callBack:(BusinessOperationCallback)callBack
{
    NSString *urlStr = NSStringFormat(URL_Server, URL_Teacher_Course_Student_NoBlinded);
    
    NSMutableDictionary *parameters = @{}.mutableCopy;
    [parameters setValue:APP_Channel forKey:@"channel"];
    [parameters setValue:userModel.gymCode forKey:@"gymCode"];
    
    [self getResponseDateWithUrl:urlStr parameter:parameters callBack:callBack];
}

#pragma mark ------- 根据课程获取绑定的学员 -------
- (void)teacherCourseStudentBlindedWithUserModel:(UserModel *)userModel callBack:(BusinessOperationCallback)callBack
{
    NSString *urlStr = NSStringFormat(URL_Server, URL_Teacher_Course_Student_Blinded);
    
    NSMutableDictionary *parameters = @{}.mutableCopy;
    [parameters setValue:APP_Channel forKey:@"channel"];
    [parameters setValue:userModel.gymCode forKey:@"gymCode"];
    [parameters setValue:userModel.courseId forKey:@"courseId"];
    
    [self getResponseDateWithUrl:urlStr parameter:parameters callBack:callBack];
}


#pragma mark ------- 获取健身馆指定会员基本信息 -------
- (void)teacherCourseStudentInformationWithUserModel:(UserModel *)userModel callBack:(BusinessOperationCallback)callBack
{
    NSString *urlStr = NSStringFormat(URL_Server, URL_Teacher_Course_Student_Information);
    
    NSMutableDictionary *parameters = @{}.mutableCopy;
    [parameters setValue:APP_Channel forKey:@"channel"];
    [parameters setValue:userModel.gymCode forKey:@"gymCode"];
    [parameters setValue:userModel.characterId forKey:@"characterId"];
    
    [self getResponseDateWithUrl:urlStr parameter:parameters callBack:callBack];
}

#pragma mark ------- 新建课程 -------
- (void)teacherCourseCreateWithUserModel:(UserModel *)userModel callBack:(BusinessOperationCallback)callBack
{
    NSString *urlStr = NSStringFormat(URL_Server, URL_Teacher_Course_Create);
    
    NSMutableDictionary *parameters = @{}.mutableCopy;
    [parameters setValue:APP_Channel forKey:@"channel"];
    
    [self getResponseDateWithUrl:urlStr parameter:parameters callBack:callBack];
}

#pragma mark ------- 获取正在进行的课程 -------
- (void)teacherCourseTeachingWithUserModel:(UserModel *)userModel callBack:(BusinessOperationCallback)callBack
{
    NSString *urlStr = NSStringFormat(URL_Server, URL_Teacher_Course_Teaching);
    
    NSMutableDictionary *parameters = @{}.mutableCopy;
    [parameters setValue:APP_Channel forKey:@"channel"];
    [parameters setValue:userModel.gymCode forKey:@"gymCode"];
    
    [self getResponseDateWithUrl:urlStr parameter:parameters callBack:callBack];
}

#pragma mark ------- 停止正在进行的课程 -------
- (void)teacherCourseStopWithUserModel:(UserModel *)userModel callBack:(BusinessOperationCallback)callBack
{
    NSString *urlStr = NSStringFormat(URL_Server, URL_Teacher_Course_Stop);
    
    NSMutableDictionary *parameters = @{}.mutableCopy;
    [parameters setValue:APP_Channel forKey:@"channel"];
    [parameters setValue:userModel.courseId forKey:@"courseId"];
    
    [self getResponseDateWithUrl:urlStr parameter:parameters callBack:callBack];
}

#pragma mark ------- 获取健身馆未绑定的心率带列表 -------
- (void)teacherHeartRateNoBlindedWithUserModel:(UserModel *)userModel callBack:(BusinessOperationCallback)callBack
{
    NSString *urlStr = NSStringFormat(URL_Server, URL_Teacher_HeartRate_NoBlinded);
    
    NSMutableDictionary *parameters = @{}.mutableCopy;
    [parameters setValue:APP_Channel forKey:@"channel"];
    [parameters setValue:userModel.gymCode forKey:@"gymCode"];
    
    [self getResponseDateWithUrl:urlStr parameter:parameters callBack:callBack];
}

#pragma mark ------- 绑定心率带 -------
- (void)teacherHeartBlindingWithUserModel:(UserModel *)userModel callBack:(BusinessOperationCallback)callBack
{
    NSString *urlStr = NSStringFormat(URL_Server, URL_Teacher_HeartRate_Blinding);
    
    NSMutableDictionary *parameters = @{}.mutableCopy;
    [parameters setValue:APP_Channel forKey:@"channel"];
    [parameters setValue:userModel.courseId forKey:@"courseId"];
    [parameters setValue:userModel.characterId forKey:@"characterId"];
    [parameters setValue:userModel.deviceSn forKey:@"deviceSn"];
    
    [self getResponseDateWithUrl:urlStr parameter:parameters callBack:callBack];
}

#pragma mark ------- 解绑心率带 -------
- (void)teacherHeartBlindedDeleteWithUserModel:(UserModel *)userModel callBack:(BusinessOperationCallback)callBack
{
    NSString *urlStr = NSStringFormat(URL_Server, Url_Teacher_HeartRate_Blinded_Delete);
    
    NSMutableDictionary *parameters = @{}.mutableCopy;
    [parameters setValue:APP_Channel forKey:@"channel"];
    [parameters setValue:userModel.courseId forKey:@"courseId"];
    [parameters setValue:userModel.characterId forKey:@"characterId"];
    
    [self getResponseDateWithUrl:urlStr parameter:parameters callBack:callBack];
}

@end
