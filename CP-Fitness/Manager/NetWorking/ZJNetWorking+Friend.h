//
//  ZJNetWorking+Friend.h
//  CP-Fitness
//
//  Created by 张敬 on 2017/11/18.
//  Copyright © 2017年 Jing Zhang. All rights reserved.
//

#import "ZJNetWorking.h"

@interface ZJNetWorking (Friend)

//获取推荐添加的好友
- (void)friendRecommendWithUserModel:(UserModel *)userModel callBack:(BusinessOperationCallback)callBack;
//添加好友
- (void)friendAddWithUserModel:(UserModel *)userModel callBack:(BusinessOperationCallback)callBack;
//删除好友
- (void)friendDeleteWithUserModel:(UserModel *)userModel callBack:(BusinessOperationCallback)callBack;
//处理好友申请
- (void)friendAppleManageWithUserModel:(UserModel *)userModel callBack:(BusinessOperationCallback)callBack;
//获取好友列表
- (void)friendGetListWithUserModel:(UserModel *)userModel callBack:(BusinessOperationCallback)callBack;
//创建好友组
- (void)friendCreateGroupWithUserModel:(UserModel *)userModel callBack:(BusinessOperationCallback)callBack;
//我的好友组
- (void)friendListMineWithUserModel:(UserModel *)userModel callBack:(BusinessOperationCallback)callBack;
//好友组用户
- (void)friendGroupWithUserModel:(UserModel *)userModel callBack:(BusinessOperationCallback)callBack;
//添加好友进组
- (void)friendGroupAddWithUserModel:(UserModel *)userModel callBack:(BusinessOperationCallback)callBack;
//把组里的好友移出去
- (void)friendGroupDeleteWithUserModel:(UserModel *)userModel callBack:(BusinessOperationCallback)callBack;
//可获取所有或某个好友动态
- (void)friendNewsWithUserModel:(UserModel *)userModel callBack:(BusinessOperationCallback)callBack;
//查看运动详细情况
- (void)friendSportDetailWithUserModel:(UserModel *)userModel callBack:(BusinessOperationCallback)callBack;
//给某条动态点赞
- (void)friendLikeClickWithUserModel:(UserModel *)userModel callBack:(BusinessOperationCallback)callBack;
//获取动态点赞用户列表
- (void)friendLikeListWithUserModel:(UserModel *)userModel callBack:(BusinessOperationCallback)callBack;
//给某条动态评论
- (void)friendCommentWithUserModel:(UserModel *)userModel callBack:(BusinessOperationCallback)callBack;
//获取动态评论列表
- (void)friendCommentlistWithUserModel:(UserModel *)userModel callBack:(BusinessOperationCallback)callBack;
//获取某用户的运动日历
- (void)friendSportCalendarWithUserModel:(UserModel *)userModel callBack:(BusinessOperationCallback)callBack;
//对好友权限开关项设置，可单项修改
- (void)friendSettingWithUserModel:(UserModel *)userModel callBack:(BusinessOperationCallback)callBack;
//获取好友权限开关项设置
- (void)friendSettingGetWithUserModel:(UserModel *)userModel callBack:(BusinessOperationCallback)callBack;

@end
