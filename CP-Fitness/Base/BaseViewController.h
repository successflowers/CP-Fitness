//
//  BaseViewController.h
//  CP-Fitness
//
//  Created by 张敬 on 2017/10/26.
//  Copyright © 2017年 Jing Zhang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController

@property (nonatomic, retain) UIButton *gobackBtn; //返回按钮

#pragma mark - 设置背景
- (void)setBackgroundWithImage:(NSString *)image;

#pragma mark - 按钮
- (UIButton *)setButtonWithNomalImage:(NSString *)nomalImage
                       highlightImage:(NSString *)highlightImage
                                title:(NSString *)title;
- (UIButton *)setWhiteButtonWithTitle:(NSString *)title;

#pragma mark - 标题
- (UILabel *)setTitleWithString:(NSString *)title font:(UIFont *)font;




@end
