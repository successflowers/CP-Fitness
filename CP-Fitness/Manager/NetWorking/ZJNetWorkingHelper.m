//
//  ZJNetWorkingHelper.m
//  CP-Fitness
//
//  Created by 张敬 on 2017/11/17.
//  Copyright © 2017年 Jing Zhang. All rights reserved.
//

#import "ZJNetWorkingHelper.h"
#import "NSString+Signature.h"
#import "NSString+TimeConvert.h"

@implementation ZJNetWorkingHelper

+ (AFHTTPSessionManager *)sharedSessionManager
{
    static AFHTTPSessionManager *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [AFHTTPSessionManager manager];
        manager.requestSerializer = [AFJSONRequestSerializer serializer];
        manager.requestSerializer.timeoutInterval = 10.0;
        manager.responseSerializer = [AFHTTPResponseSerializer serializer];
        manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/html",@"text/plain",nil];
    });
    return manager;
}

+ (void)postJsonWithUrl:(NSString *)urlStr
              parameter:(NSDictionary *)parameters
                success:(void (^)(NSDictionary*responseObject))success
                   fail:(void(^)(NSError *error))fail
{
    AFHTTPSessionManager *manager = [ZJNetWorkingHelper sharedSessionManager];
    
    NSString *token = @"242861cd6cf6474ca3d6df1ad9a81361953c4124f7a519c4";
    /*
    UserModel *userModel = [[UserModel alloc] init];
    if (userModel) {
        token = userModel.token;
    }
     */
    NSString *signatureStr = [[NSString signatureWithAppKey:App_Key secret:APP_Secret parameter:parameters token:token] lowercaseString];
   
    NSString *timestamp = [NSString obtainCurrentDateUTCTimeString];
    
    NSString *authStr = [NSString stringWithFormat:@"%@/%@/%@/%@",
                         APP_Authorization,App_Key,timestamp,signatureStr];
    [manager.requestSerializer setValue:authStr forHTTPHeaderField:@"Authorization"];
    [manager.requestSerializer setValue:token forHTTPHeaderField:@"token"];
    
    [manager POST:urlStr parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        if (responseObject) {
            NSDictionary *resultDic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableLeaves error:nil];
            success(resultDic);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (error) {
            fail(error);
        }
    }];
}

@end
