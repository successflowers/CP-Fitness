//
//  SettingViewControls.h
//  CP-Fitness
//
//  Created by 张敬 on 2017/10/29.
//  Copyright © 2017年 Jing Zhang. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^TextFiledCallback)(BOOL isSucessed,NSString *textFiledStr);
@interface SettingViewControls : UIView

@property (nonatomic, copy) NSString *headString;
@property (nonatomic, copy) TextFiledCallback callback;

@end
