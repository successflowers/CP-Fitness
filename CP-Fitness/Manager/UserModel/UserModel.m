//
//  UserModel.m
//  CP-Fitness
//
//  Created by 张敬 on 2017/11/17.
//  Copyright © 2017年 Jing Zhang. All rights reserved.
//

#import "UserModel.h"

@implementation UserModel
- (instancetype) initWithDict:(NSDictionary *) dict
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+ (instancetype) userWithDict:(NSDictionary *)dict
{
    return [[self alloc] initWithDict:dict];
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.username forKey:@"username"];
    [aCoder encodeObject:self.password forKey:@"password"];
    [aCoder encodeObject:self.token forKey:@"token"];
    [aCoder encodeObject:self.email forKey:@"email"];
    [aCoder encodeObject:self.characterId forKey:@"characterId"];
    [aCoder encodeObject:self.sex forKey:@"sex"];
    [aCoder encodeObject:self.myGym forKey:@"myGym"];
    [aCoder encodeObject:self.weight forKey:@"weight"];
    [aCoder encodeObject:self.birthday forKey:@"birthday"];
    [aCoder encodeObject:self.createTime forKey:@"createTime"];
    [aCoder encodeObject:self.isTraining forKey:@"isTraining"];
    [aCoder encodeObject:self.isHbp forKey:@"isHbp"];
    [aCoder encodeObject:self.heartRate forKey:@"heartRate"];
    [aCoder encodeObject:self.deviceCode forKey:@"deviceCode"];
    [aCoder encodeObject:self.headUrl forKey:@"headUrl"];
    [aCoder encodeObject:self.mobile forKey:@"mobile"];
    [aCoder encodeObject:self.phone forKey:@"phone"];
    [aCoder encodeObject:self.monthPoint forKey:@"monthPoint"];
    [aCoder encodeObject:self.character forKey:@"character"];
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super init]) {
        self.username = [aDecoder decodeObjectForKey:@"username"];
        self.password = [aDecoder decodeObjectForKey:@"password"];
        self.token = [aDecoder decodeObjectForKey:@"token"];
        self.email = [aDecoder decodeObjectForKey:@"email"];
        self.characterId = [aDecoder decodeObjectForKey:@"characterId"];
        self.sex = [aDecoder decodeObjectForKey:@"sex"];
        self.myGym = [aDecoder decodeObjectForKey:@"myGym"];
        self.weight = [aDecoder decodeObjectForKey:@"weight"];
        self.birthday = [aDecoder decodeObjectForKey:@"birthday"];
        self.createTime = [aDecoder decodeObjectForKey:@"maxHeartRate"];
        self.isTraining = [aDecoder decodeObjectForKey:@"isTraining"];
        self.nickname = [aDecoder decodeObjectForKey:@"nickname"];
        self.isHbp = [aDecoder decodeObjectForKey:@"isHbp"];
        self.heartRate = [aDecoder decodeObjectForKey:@"heartRate"];
        self.deviceCode = [aDecoder decodeObjectForKey:@"deviceCode"];
        self.headUrl = [aDecoder decodeObjectForKey:@"headUrl"];
        self.mobile = [aDecoder decodeObjectForKey:@"mobile"];
        self.monthPoint = [aDecoder decodeObjectForKey:@"monthPoint"];
        self.phone = [aDecoder decodeObjectForKey:@"phone"];
        self.character = [aDecoder decodeObjectForKey:@"character"];
    }
    return self;
}

- (NSString *)description
{
    NSString *t = @"";
    //[NSString stringWithFormat:@"name= %@\tbalance=%lf\n option= %d\tincome= %d\n typename=%@\ttypeId=%@" ,self.name,self.balance,self.option,self.income,self.typeName,self.typeId
     //              ];
    return t;
}

+ (UserModel *)readUserDefaults
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSData *userModelData = [userDefaults objectForKey:@"userModelData"];
    UserModel *userModel = [NSKeyedUnarchiver unarchiveObjectWithData:userModelData];
    return userModel;
}
+ (void)writeUserDefaultswithUserModel:(UserModel *)userModel
{
    NSData *userModelData = [NSKeyedArchiver archivedDataWithRootObject:userModel];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:userModelData forKey:@"userModelData"];
    [defaults synchronize];
}



@end
