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
@property (nonatomic, copy) NSString *name; //昵称/姓名
@property (nonatomic, copy) NSString *sex; //性别，1=男，2=女
@property (nonatomic, copy) NSString *birthday; //出生日期（1980-11-09）
@property (nonatomic, copy) NSString *headUrl; //头像url
@property (nonatomic, copy) NSString *gymCode; //健身馆编号
@property (nonatomic, copy) NSString *token;

@property (nonatomic, assign) NSInteger height; //身高CM
@property (nonatomic, assign) NSInteger weight; //体重KG
@property (nonatomic, assign) NSInteger isHbp; //是否有高血压，0，1
@property (nonatomic, assign) NSInteger isTraining; //是否训练有素人群，0，1
@property (nonatomic, assign) NSInteger gymUserType; //用户类型，0=会员，1=教练
@property (nonatomic, assign) NSInteger teachYears; //教龄



@end
