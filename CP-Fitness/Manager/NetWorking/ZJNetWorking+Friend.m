//
//  ZJNetWorking+Friend.m
//  CP-Fitness
//
//  Created by 张敬 on 2017/11/18.
//  Copyright © 2017年 Jing Zhang. All rights reserved.
//

#import "ZJNetWorking+Friend.h"

@implementation ZJNetWorking (Friend)
#pragma mark ------- 获取推荐添加的好友 -------
- (void)friendRecommendWithUserModel:(UserModel *)userModel callBack:(BusinessOperationCallback)callBack
{
    NSString *urlStr = NSStringFormat(URL_Server, URL_Friend_Recommend);
    
    NSMutableDictionary *parameters = @{}.mutableCopy;
    [parameters setValue:APP_Channel forKey:@"channel"];
    [parameters setValue:userModel.characterId forKey:@"characterId"];
    [parameters setValue:userModel.nickname forKey:@"nickname"];
    [parameters setValue:userModel.request forKey:@"request"];
    
    [self getResponseDateWithUrl:urlStr parameter:parameters callBack:callBack];
}

#pragma mark ------- 添加好友 -------
- (void)friendAddWithUserModel:(UserModel *)userModel callBack:(BusinessOperationCallback)callBack
{
    NSString *urlStr = NSStringFormat(URL_Server, URL_Friend_Add);
    
    NSMutableDictionary *parameters = @{}.mutableCopy;
    [parameters setValue:APP_Channel forKey:@"channel"];
    [parameters setValue:userModel.friendId forKey:@"friendId"];
    
    [self getResponseDateWithUrl:urlStr parameter:parameters callBack:callBack];
}

#pragma mark ------- 删除好友 -------
- (void)friendDeleteWithUserModel:(UserModel *)userModel callBack:(BusinessOperationCallback)callBack
{
    NSString *urlStr = NSStringFormat(URL_Server, URL_Friend_Delete);
    
    NSMutableDictionary *parameters = @{}.mutableCopy;
    [parameters setValue:APP_Channel forKey:@"channel"];
    [parameters setValue:userModel.friendId forKey:@"friendId"];
    
    [self getResponseDateWithUrl:urlStr parameter:parameters callBack:callBack];
}

#pragma mark ------- 处理好友申请 -------
- (void)friendAppleManageWithUserModel:(UserModel *)userModel callBack:(BusinessOperationCallback)callBack
{
    NSString *urlStr = NSStringFormat(URL_Server, URL_Friend_Apply_Manage);
    
    NSMutableDictionary *parameters = @{}.mutableCopy;
    [parameters setValue:APP_Channel forKey:@"channel"];
    [parameters setValue:userModel.friendId forKey:@"friendId"];
    [parameters setValue:userModel.accept forKey:@"accept"];
    
    [self getResponseDateWithUrl:urlStr parameter:parameters callBack:callBack];
}

#pragma mark ------- 获取好友列表 -------
- (void)friendGetListWithUserModel:(UserModel *)userModel callBack:(BusinessOperationCallback)callBack
{
    NSString *urlStr = NSStringFormat(URL_Server, URL_Friend_List);
    
    NSMutableDictionary *parameters = @{}.mutableCopy;
    [parameters setValue:APP_Channel forKey:@"channel"];
   
    [self getResponseDateWithUrl:urlStr parameter:parameters callBack:callBack];
}

#pragma mark ------- 创建好友组 -------
- (void)friendCreateGroupWithUserModel:(UserModel *)userModel callBack:(BusinessOperationCallback)callBack
{
    NSString *urlStr = NSStringFormat(URL_Server, URL_Friend_Group);
    
    NSMutableDictionary *parameters = @{}.mutableCopy;
    [parameters setValue:APP_Channel forKey:@"channel"];
    [parameters setValue:userModel.name forKey:@"name"];
    [parameters setValue:userModel.friends forKey:@"friends"];
    
    [self getResponseDateWithUrl:urlStr parameter:parameters callBack:callBack];
}

#pragma mark ------- 我的好友组 -------
- (void)friendListMineWithUserModel:(UserModel *)userModel callBack:(BusinessOperationCallback)callBack
{
    NSString *urlStr = NSStringFormat(URL_Server, URL_Friend_List_Mine);
    
    NSMutableDictionary *parameters = @{}.mutableCopy;
    [parameters setValue:APP_Channel forKey:@"channel"];
    
    [self getResponseDateWithUrl:urlStr parameter:parameters callBack:callBack];
}

#pragma mark ------- 好友组用户 -------
- (void)friendGroupWithUserModel:(UserModel *)userModel callBack:(BusinessOperationCallback)callBack
{
    NSString *urlStr = NSStringFormat(URL_Server, URL_Friend_Group_Users);
    
    NSMutableDictionary *parameters = @{}.mutableCopy;
    [parameters setValue:APP_Channel forKey:@"channel"];
    [parameters setValue:userModel.gid forKey:@"gid"];
    
    [self getResponseDateWithUrl:urlStr parameter:parameters callBack:callBack];
}

#pragma mark ------- 添加好友进组 -------
- (void)friendGroupAddWithUserModel:(UserModel *)userModel callBack:(BusinessOperationCallback)callBack
{
    NSString *urlStr = NSStringFormat(URL_Server, URL_Friend_Group_Add);
    
    NSMutableDictionary *parameters = @{}.mutableCopy;
    [parameters setValue:APP_Channel forKey:@"channel"];
    [parameters setValue:userModel.gid forKey:@"gid"];
    [parameters setValue:userModel.friends forKey:@"friends"];
    
    [self getResponseDateWithUrl:urlStr parameter:parameters callBack:callBack];
}

#pragma mark ------- 把组里的好友移出去 -------
- (void)friendGroupDeleteWithUserModel:(UserModel *)userModel callBack:(BusinessOperationCallback)callBack
{
    NSString *urlStr = NSStringFormat(URL_Server, URL_Friend_Group_Delete);
    
    NSMutableDictionary *parameters = @{}.mutableCopy;
    [parameters setValue:APP_Channel forKey:@"channel"];
    [parameters setValue:userModel.gid forKey:@"gid"];
    [parameters setValue:userModel.friends forKey:@"friends"];
    
    [self getResponseDateWithUrl:urlStr parameter:parameters callBack:callBack];
}

#pragma mark ------- 可获取所有或某个好友动态 -------
- (void)friendNewsWithUserModel:(UserModel *)userModel callBack:(BusinessOperationCallback)callBack
{
    NSString *urlStr = NSStringFormat(URL_Server, URL_Friend_News_Get);
    
    NSMutableDictionary *parameters = @{}.mutableCopy;
    [parameters setValue:APP_Channel forKey:@"channel"];
    [parameters setValue:userModel.start forKey:@"start"];
    [parameters setValue:userModel.length forKey:@"length"];
    
    [self getResponseDateWithUrl:urlStr parameter:parameters callBack:callBack];
}

#pragma mark ------- 查看运动详细情况 -------
- (void)friendSportDetailWithUserModel:(UserModel *)userModel callBack:(BusinessOperationCallback)callBack
{
    NSString *urlStr = NSStringFormat(URL_Server, URL_Friend_Sport_Detail_Get);
    
    NSMutableDictionary *parameters = @{}.mutableCopy;
    [parameters setValue:APP_Channel forKey:@"channel"];
    [parameters setValue:userModel.sportId forKey:@"sportId"];

    [self getResponseDateWithUrl:urlStr parameter:parameters callBack:callBack];
}

#pragma mark ------- 给某条动态点赞 -------
- (void)friendLikeClickWithUserModel:(UserModel *)userModel callBack:(BusinessOperationCallback)callBack
{
    NSString *urlStr = NSStringFormat(URL_Server, URL_Friend_Like_Chick);
    
    NSMutableDictionary *parameters = @{}.mutableCopy;
    [parameters setValue:APP_Channel forKey:@"channel"];
    [parameters setValue:userModel.sportId forKey:@"sportId"];
    
    [self getResponseDateWithUrl:urlStr parameter:parameters callBack:callBack];
}

#pragma mark ------- 获取动态点赞用户列表 -------
- (void)friendLikeListWithUserModel:(UserModel *)userModel callBack:(BusinessOperationCallback)callBack
{
    NSString *urlStr = NSStringFormat(URL_Server, URL_Friend_Like_List);
    
    NSMutableDictionary *parameters = @{}.mutableCopy;
    [parameters setValue:APP_Channel forKey:@"channel"];
    [parameters setValue:userModel.sportId forKey:@"sportId"];
    
    [self getResponseDateWithUrl:urlStr parameter:parameters callBack:callBack];
}

#pragma mark ------- 给某条动态评论 -------
- (void)friendCommentWithUserModel:(UserModel *)userModel callBack:(BusinessOperationCallback)callBack
{
    NSString *urlStr = NSStringFormat(URL_Server, URL_Friend_Comment_Add);
    
    NSMutableDictionary *parameters = @{}.mutableCopy;
    [parameters setValue:APP_Channel forKey:@"channel"];
    [parameters setValue:userModel.sportId forKey:@"sportId"];
    [parameters setValue:userModel.comment forKey:@"comment"];
    
    [self getResponseDateWithUrl:urlStr parameter:parameters callBack:callBack];
}

#pragma mark ------- 获取动态评论列表 -------
- (void)friendCommentlistWithUserModel:(UserModel *)userModel callBack:(BusinessOperationCallback)callBack
{
    NSString *urlStr = NSStringFormat(URL_Server, URL_Friend_Comment_List);
    
    NSMutableDictionary *parameters = @{}.mutableCopy;
    [parameters setValue:APP_Channel forKey:@"channel"];
    [parameters setValue:userModel.sportId forKey:@"sportId"];
    [parameters setValue:userModel.start forKey:@"start"];
    [parameters setValue:userModel.length forKey:@"length"];
    
    [self getResponseDateWithUrl:urlStr parameter:parameters callBack:callBack];
}

#pragma mark ------- 获取某用户的运动日历 -------
- (void)friendSportCalendarWithUserModel:(UserModel *)userModel callBack:(BusinessOperationCallback)callBack
{
    NSString *urlStr = NSStringFormat(URL_Server, URL_Friend_SportCalendar_Get);
    
    NSMutableDictionary *parameters = @{}.mutableCopy;
    [parameters setValue:APP_Channel forKey:@"channel"];
    [parameters setValue:userModel.characterId forKey:@"characterId"];
    [parameters setValue:userModel.date forKey:@"date"];
    
    [self getResponseDateWithUrl:urlStr parameter:parameters callBack:callBack];
}

#pragma mark ------- 对好友权限开关项设置，可单项修改 -------
- (void)friendSettingUpdateWithUserModel:(UserModel *)userModel callBack:(BusinessOperationCallback)callBack
{
    NSString *urlStr = NSStringFormat(URL_Server, URL_Friend_Setting_Update);
    
    NSMutableDictionary *parameters = @{}.mutableCopy;
    [parameters setValue:APP_Channel forKey:@"channel"];
    [parameters setValue:userModel.friendId forKey:@"friendId"];
    
    [self getResponseDateWithUrl:urlStr parameter:parameters callBack:callBack];
}

#pragma mark ------- 获取好友权限开关项设置 -------
- (void)friendSettingGetWithUserModel:(UserModel *)userModel callBack:(BusinessOperationCallback)callBack
{
    NSString *urlStr = NSStringFormat(URL_Server, URL_Friend_Setting_Get);
    
    NSMutableDictionary *parameters = @{}.mutableCopy;
    [parameters setValue:APP_Channel forKey:@"channel"];
    [parameters setValue:userModel.friendId forKey:@"friendId"];
    
    [self getResponseDateWithUrl:urlStr parameter:parameters callBack:callBack];
}

@end
