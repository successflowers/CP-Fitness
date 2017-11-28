//
//  InputFieldViewControls.h
//  CP-Fitness
//
//  Created by 张敬 on 2017/10/28.
//  Copyright © 2017年 Jing Zhang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "InputFieldModel.h"

typedef void (^TextFiledCallback)(BOOL isSucessed,NSString *textFiledStr);

@interface InputFieldViewControls : UIView

@property (nonatomic, copy) TextFiledCallback callback;

- (instancetype) initWithModel:(InputFieldModel *)model;

@end
