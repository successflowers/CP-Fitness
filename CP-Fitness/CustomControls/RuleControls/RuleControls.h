//
//  RuleControls.h
//  CP-Fitness
//
//  Created by 张敬 on 2017/11/29.
//  Copyright © 2017年 Jing Zhang. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SignleRule;
typedef NS_ENUM(NSInteger, RuleControlsType)
{
   RuleControlsType_Horizontal = 0, //横向
   RuleControlsType_Vertical,       //竖向
};

typedef void (^RuleControlsCallBack)(NSInteger selectedValue);

@interface RuleControls : UIView

@property (nonatomic, copy) RuleControlsCallBack callback;
@property (nonatomic, strong) NSMutableArray *valueArr;
@property (nonatomic, assign) RuleControlsType type;
@property (nonatomic, assign) CGFloat rulerWidth;
@property (nonatomic, assign) CGFloat rulerHeight;



@end
