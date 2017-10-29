//
//  BaseViewController.m
//  CP-Fitness
//
//  Created by 张敬 on 2017/10/26.
//  Copyright © 2017年 Jing Zhang. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

#pragma mark - 设置背景
- (void)setBackgroundWithImage:(NSString *)image
{
    UIImageView *imgView = [[UIImageView alloc] initWithImage:IMAGE_NAMED(image)];
    imgView.frame = self.view.bounds;
    imgView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    [self.view insertSubview:imgView atIndex:0];
}

#pragma mark - 按钮
- (UIButton *)setButtonWithNomalImage:(NSString *)nomalImage
                       highlightImage:(NSString *)highlightImage
                                title:(NSString *)title
{
    UIButton *newButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [newButton setTitle:title forState:UIControlStateNormal];
    [newButton setTitleColor:KWhiteColor forState:UIControlStateNormal];
    newButton.titleLabel.font = SYSTEMFONT(20);
    [newButton setBackgroundImage:IMAGE_NAMED(nomalImage) forState:UIControlStateNormal];
    [newButton setBackgroundImage:IMAGE_NAMED(highlightImage) forState:UIControlStateHighlighted];
    return newButton;
}

- (UIButton *)setWhiteButtonWithTitle:(NSString *)title
{
    UIButton *whiteButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [whiteButton setTitle:title forState:UIControlStateNormal];
    [whiteButton setTitleColor:KWhiteColor forState:UIControlStateNormal];
    whiteButton.titleLabel.font = SYSTEMFONT(20);
    [whiteButton.layer setMasksToBounds:YES];
    [whiteButton.layer setCornerRadius:22.0]; //设置矩形四个圆角半径
    [whiteButton.layer setBorderWidth:2.0];
    whiteButton.layer.borderColor = KWhiteColor.CGColor;
    return whiteButton;
}

#pragma mark - 标题
- (UILabel *)setTitleWithString:(NSString *)title font:(UIFont *)font
{
    UILabel *titleLab = [[UILabel alloc] init];
    titleLab.text = title;
    titleLab.textColor = KWhiteColor;
    titleLab.font = font;
    return titleLab;
}

#pragma mark - goback按钮
- (UIButton *)gobackBtn
{
    if (!_gobackBtn){
        _gobackBtn = [self setButtonWithNomalImage:@"main_back.png" highlightImage:nil title:nil];
        _gobackBtn.frame = CGRectMake(20, 44, 12, 21);
        [_gobackBtn addTarget:self action:@selector(goback:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _gobackBtn;
}

- (void)goback:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
