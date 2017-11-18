//
//  ZJNetWorking.m
//  CP-Fitness
//
//  Created by 张敬 on 2017/11/17.
//  Copyright © 2017年 Jing Zhang. All rights reserved.
//

#import "ZJNetWorking.h"

@implementation ZJNetWorking

+ (instancetype)sharedInstance
{
    static dispatch_once_t onceToken;
    static ZJNetWorking *sharedInstance = nil;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

@end
