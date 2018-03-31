//
//  ChoiceControls.h
//  CP-Fitness
//
//  Created by 张敬 on 2017/11/30.
//  Copyright © 2017年 Jing Zhang. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^ChoiceControlsCallBack)(NSInteger selectedValue);

@interface ChoiceControls : UIView
@property (nonatomic, strong) CATextLayer *warningLayer;
@property (nonatomic, strong) UIButton *choiceButton;

@property (nonatomic, copy) ChoiceControlsCallBack callback;

@end
