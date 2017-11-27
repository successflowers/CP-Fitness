//
//  UIButton+ZJ_FixMultiClick.h
//  CP-Fitness
//
//  Created by 张敬 on 2017/11/27.
//  Copyright © 2017年 Jing Zhang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (ZJ_FixMultiClick)
@property (nonatomic, assign) NSTimeInterval zj_acceptEventInterval; // 重复点击的间隔

@property (nonatomic, assign) NSTimeInterval zj_acceptEventTime;

@end
