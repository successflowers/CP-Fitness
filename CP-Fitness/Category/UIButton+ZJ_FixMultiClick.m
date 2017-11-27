//
//  UIButton+ZJ_FixMultiClick.m
//  CP-Fitness
//
//  Created by 张敬 on 2017/11/27.
//  Copyright © 2017年 Jing Zhang. All rights reserved.
//

#import "UIButton+ZJ_FixMultiClick.h"
#import <objc/runtime.h>

// 因category不能添加属性，只能通过关联对象的方式。
static const char *UIControl_acceptEventInterval_ZJ = "UIControl_acceptEventInterval_ZJ";

@implementation UIButton (ZJ_FixMultiClick)

- (NSTimeInterval)zj_acceptEventInterval
{
    return  [objc_getAssociatedObject(self, UIControl_acceptEventInterval_ZJ) doubleValue];
}

- (void)setZj_acceptEventInterval:(NSTimeInterval)zj_acceptEventInterval
{
   objc_setAssociatedObject(self, UIControl_acceptEventInterval_ZJ, @(zj_acceptEventInterval), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

static const char *UIControl_acceptEventTime_ZJ = "UIControl_acceptEventTime";

- (NSTimeInterval)zj_acceptEventTime
{
    return  [objc_getAssociatedObject(self, UIControl_acceptEventTime_ZJ) doubleValue];

}

- (void)setZj_acceptEventTime:(NSTimeInterval)zj_acceptEventTime
{
    objc_setAssociatedObject(self, UIControl_acceptEventTime_ZJ, @(zj_acceptEventTime), OBJC_ASSOCIATION_RETAIN_NONATOMIC);

}

// 在load时执行hook
+ (void)load {
    Method before   = class_getInstanceMethod(self, @selector(sendAction:to:forEvent:));
    Method after    = class_getInstanceMethod(self, @selector(zj_sendAction:to:forEvent:));
    method_exchangeImplementations(before, after);
}

- (void)zj_sendAction:(SEL)action to:(id)target forEvent:(UIEvent *)event {
    if ([NSDate date].timeIntervalSince1970 - self.zj_acceptEventTime < self.zj_acceptEventInterval) {
        return;
    }
    
    if (self.zj_acceptEventInterval > 0) {
        self.zj_acceptEventTime = [NSDate date].timeIntervalSince1970;
    }
    
    [self zj_sendAction:action to:target forEvent:event];
  
}
/*
+ (instancetype)buttonWithType:(UIButtonType)buttonType
{
    UIButton *button = [self buttonWithType:buttonType];
    if (button) {
        button.zj_acceptEventInterval = 1;
    }
    return button;
}
*/

@end
