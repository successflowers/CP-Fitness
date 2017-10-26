//
//  BaseViewController.h
//  CP-Fitness
//
//  Created by 张敬 on 2017/10/26.
//  Copyright © 2017年 Jing Zhang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController

#pragma mark - 设置背景
- (void)setBackgroundWithImage:(NSString *)image;

#pragma mark - 按钮
- (UIButton *)setButtonWithNomalImage:(NSString *)nomalImage
                       highlightImage:(NSString *)highlightImage
                                title:(NSString *)title;
- (UIButton *)setWhiteButtonWithTitle:(NSString *)title;


@end
