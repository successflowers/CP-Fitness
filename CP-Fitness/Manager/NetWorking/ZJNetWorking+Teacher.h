//
//  ZJNetWorking+Teacher.h
//  CP-Fitness
//
//  Created by 张敬 on 2017/11/18.
//  Copyright © 2017年 Jing Zhang. All rights reserved.
//

#import "ZJNetWorking.h"

@interface ZJNetWorking (Teacher)
//获取事件
- (void)teacherEventListWithUserModel:(UserModel *)userModel callBack:(BusinessOperationCallback)callBack;
//获取健身馆可使用的盒子列表
- (void)teacherCourseListWithUserModel:(UserModel *)userModel callBack:(BusinessOperationCallback)callBack;
//获取健身馆未绑定的会员列表
- (void)teacherCourseStudentNoBlindedWithUserModel:(UserModel *)userModel callBack:(BusinessOperationCallback)callBack;
//获取健身馆指定会员基本信息
- (void)teacherCourseStudentInformationWithUserModel:(UserModel *)userModel callBack:(BusinessOperationCallback)callBack;
//根据课程获取绑定的学员
- (void)teacherCourseStudentBlindedWithUserModel:(UserModel *)userModel callBack:(BusinessOperationCallback)callBack;
//新建课程
- (void)teacherCourseCreateWithUserModel:(UserModel *)userModel callBack:(BusinessOperationCallback)callBack;
//获取正在进行的课程
- (void)teacherCourseTeachingWithUserModel:(UserModel *)userModel callBack:(BusinessOperationCallback)callBack;
//停止正在进行的课程
- (void)teacherCourseStopWithUserModel:(UserModel *)userModel callBack:(BusinessOperationCallback)callBack;
//获取健身馆未绑定的心率带列表
- (void)teacherHeartRateNoBlindedWithUserModel:(UserModel *)userModel callBack:(BusinessOperationCallback)callBack;
//绑定心率带
- (void)teacherHeartBlindingWithUserModel:(UserModel *)userModel callBack:(BusinessOperationCallback)callBack;
//解绑心率带
- (void)teacherHeartBlindedDeleteWithUserModel:(UserModel *)userModel callBack:(BusinessOperationCallback)callBack;

@end
