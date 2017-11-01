//
//  CalendarViewControls.h
//  CP-Fitness
//
//  Created by 张敬 on 2017/10/29.
//  Copyright © 2017年 Jing Zhang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CalendarViewControls : UIView

@property (nonatomic, strong) NSDate *date;
@property (nonatomic, strong) NSDate *today;
@property (nonatomic, copy) void(^calendarBlock)(NSInteger day, NSInteger month, NSInteger year);

@end
