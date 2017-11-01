//
//  NSData+ZJNSData.h
//  CP-Fitness
//
//  Created by 张敬 on 2017/10/30.
//  Copyright © 2017年 Jing Zhang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (ZJNSData)

+ (NSInteger)day:(NSDate *)date;

+ (NSInteger)month:(NSDate *)date;

+ (NSInteger)year:(NSDate *)date;

+ (NSInteger)firstWeekdayInThisMonth:(NSDate *)date;

+ (NSInteger)totaldaysInThisMonth:(NSDate *)date;

+ (NSInteger)totaldaysInMonth:(NSDate *)date;

+ (NSDate *)lastMonth:(NSDate *)date;

+ (NSDate*)nextMonth:(NSDate *)date;



@end
