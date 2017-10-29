//
//  InputFieldModel.h
//  CP-Fitness
//
//  Created by 张敬 on 2017/10/28.
//  Copyright © 2017年 Jing Zhang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface InputFieldModel : NSObject

@property (nonatomic, retain) UITextField *textField;
@property (nonatomic, copy) NSString *placeholder;

@property (nonatomic, copy) NSString *headImage;
@property (nonatomic, copy) NSString *endImage;

@property (nonatomic, assign) CGFloat screenWidth;


@end
