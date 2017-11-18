//
//  UserModel.h
//  CP-Fitness
//
//  Created by 张敬 on 2017/11/17.
//  Copyright © 2017年 Jing Zhang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserModel : NSObject
@property (nonatomic, copy) NSString *channel; //渠道号
@property (nonatomic, copy) NSString *username; //用户
@property (nonatomic, copy) NSString *password; //密码
@property (nonatomic, copy) NSString *email; //邮箱
@property (nonatomic, copy) NSString *sex; //性别，1=男，2=女
@property (nonatomic, copy) NSString *birthday; //出生日期（1980-11-09）
@property (nonatomic, copy) NSString *headUrl; //头像url
@property (nonatomic, copy) NSString *gymCode; //健身馆编号
@property (nonatomic, copy) NSString *token;
@property (nonatomic, copy) NSString *characterId; //用户id
@property (nonatomic, copy) NSString *code; //验证码
@property (nonatomic, copy) NSString *templet; //手机
@property (nonatomic, copy) NSString *source; //source 1=android,2=iphone
@property (nonatomic, copy) NSString *clubCode; //俱乐部代码
@property (nonatomic, copy) NSString *deviceCode; //心率带号码
@property (nonatomic, copy) NSString *bmi; //身体素质指数
@property (nonatomic, copy) NSString *targetBmi; //目标BMI
@property (nonatomic, copy) NSString *waist; //腰围（cm）
@property (nonatomic, copy) NSString *targetWaist; //目标腰围
@property (nonatomic, copy) NSString *waistHip; //臀腰比
@property (nonatomic, copy) NSString *targetWaistHip; //目标臀腰比
@property (nonatomic, copy) NSString *heartRate; //静息心率
@property (nonatomic, copy) NSString *maxHeartRate; //最大心率
@property (nonatomic, copy) NSString *weight; //体重(KG)
@property (nonatomic, copy) NSString *targetWeight; //目标体重
@property (nonatomic, copy) NSString *height; //身高(CM)
@property (nonatomic, copy) NSString *targetHeight; //目标身高
@property (nonatomic, copy) NSString *muscle; //source 1=android,2=iphone
@property (nonatomic, copy) NSString *targetMuscle; //目标肌肉比率
@property (nonatomic, copy) NSString *bone; //骨骼比率
@property (nonatomic, copy) NSString *targetBone; //目标骨骼比率
@property (nonatomic, copy) NSString *fat; //脂肪比率
@property (nonatomic, copy) NSString *water; //水分比率
@property (nonatomic, copy) NSString *targetWater; //目标水分比率
@property (nonatomic, copy) NSString *visceralFat; //内脏脂肪比率
@property (nonatomic, copy) NSString *targetVisceral; //目标内脏脂肪比率
@property (nonatomic, copy) NSString *baseMetabolic; //基础新陈代谢
@property (nonatomic, copy) NSString *targetBm; //目标基础新陈代谢
@property (nonatomic, copy) NSString *metabolicAge; //基本代谢年龄
@property (nonatomic, copy) NSString *targetFs; //目标健康评分
@property (nonatomic, copy) NSString *monthPoint; //月目标成长点
@property (nonatomic, copy) NSString *nickname; //昵称
@property (nonatomic, copy) NSString *request; //0=未申请，1=已申请
@property (nonatomic, copy) NSString *friendId; //好友用户id
@property (nonatomic, copy) NSString *accept; //1=同意
@property (nonatomic, copy) NSString *search; //模糊查询
@property (nonatomic, copy) NSString *sorting; //排序，0=昵称，1=成长值
@property (nonatomic, copy) NSString *start; //从0开始
@property (nonatomic, copy) NSString *length; //获取数量，默认10
@property (nonatomic, copy) NSString *point; //成长值
@property (nonatomic, copy) NSString *calorie; //消耗
@property (nonatomic, copy) NSString *name; //组名称
@property (nonatomic, copy) NSString *gid; //组id
@property (nonatomic, copy) NSString *date; //日期 （2017-06-12）
@property (nonatomic, copy) NSString *title; //标题
@property (nonatomic, copy) NSString *image; //背景图片
@property (nonatomic, copy) NSString *sportTime; //运动时间(2017-06-09 11:08:30)
@property (nonatomic, copy) NSString *totalTime; //运动时长（秒）
@property (nonatomic, copy) NSString *avgHeartRate; //平均心率
@property (nonatomic, copy) NSString *like; //点赞数
@property (nonatomic, copy) NSString *comment; //评论内容
@property (nonatomic, copy) NSString *honor; //称号
@property (nonatomic, copy) NSString *heartRateData; //心率数据
@property (nonatomic, copy) NSString *maxPercent; //强度（最大占比）
@property (nonatomic, copy) NSString *sportId; //数据id
@property (nonatomic, copy) NSString *level; //级别
@property (nonatomic, copy) NSString *month; //月数
@property (nonatomic, copy) NSString *timeZones; //心率区间
@property (nonatomic, copy) NSString *logo; //logo地址
@property (nonatomic, copy) NSString *logoBig; //大logo
@property (nonatomic, copy) NSString *bg; //背景地址
@property (nonatomic, copy) NSString *address; //健身馆地址
@property (nonatomic, copy) NSString *likeNum; //点赞数
@property (nonatomic, copy) NSString *commentNum; //评论数
@property (nonatomic, copy) NSString *addTime; //评论时间
@property (nonatomic, copy) NSString *type; //目标类型：1=成长点数、2=calories
@property (nonatomic, copy) NSString *startTime; //开始时间
@property (nonatomic, copy) NSString *endTime; //结束时间
@property (nonatomic, copy) NSString *reachData; //
@property (nonatomic, copy) NSString *finished; //
@property (nonatomic, copy) NSString *week; //本周
@property (nonatomic, copy) NSString *year; //当年
@property (nonatomic, copy) NSString *total; //总计
@property (nonatomic, copy) NSString *times; //运动次数
@property (nonatomic, copy) NSString *indexid; //
@property (nonatomic, copy) NSString *videourl; //视频地址
@property (nonatomic, copy) NSString *mac; //盒子mac地址
@property (nonatomic, copy) NSString *introImage; //介绍大图
@property (nonatomic, copy) NSString *coachImage; //教练大圈
@property (nonatomic, copy) NSString *courseImage; //课程大图
@property (nonatomic, copy) NSString *province; //地区，逗号分隔
@property (nonatomic, copy) NSString *versionCode; //当前版本号
@property (nonatomic, copy) NSString *courseId; //课程id
@property (nonatomic, copy) NSString *deviceSn; //心率带编号
@property (nonatomic, copy) NSString *teachYears; //
@property (nonatomic, copy) NSString *coachId; //教练id
@property (nonatomic, copy) NSString *joinNum;//joinNum
@property (nonatomic, copy) NSString *challengeId;//challengeId
@property (nonatomic, copy) NSString *status;//status

@property (nonatomic, retain) NSArray *friends; //好友用户id

//@property (nonatomic, assign) NSInteger height; //身高CM
//@property (nonatomic, assign) NSInteger accept; //1=同意
@property (nonatomic, assign) NSInteger isHbp; //是否有高血压，0，1
@property (nonatomic, assign) NSInteger isTraining; //是否训练有素人群，0，1
@property (nonatomic, assign) NSInteger gymUserType; //用户类型，0=会员，1=教练
//@property (nonatomic, assign) NSInteger teachYears; //教龄



@end
