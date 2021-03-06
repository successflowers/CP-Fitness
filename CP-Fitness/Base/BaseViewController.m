//
//  BaseViewController.m
//  CP-Fitness
//
//  Created by 张敬 on 2017/10/26.
//  Copyright © 2017年 Jing Zhang. All rights reserved.
//

#import "BaseViewController.h"
#import "sys/utsname.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

#pragma mark - UserModel
- (UserModel *)userModel
{
    if (!_userModel) {
        _userModel = [[UserModel alloc] init];
    }
    return _userModel;
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
    newButton.zj_acceptEventInterval = 1;
    [newButton setTitle:title forState:UIControlStateNormal];
    [newButton setTitleColor:KWhiteColor forState:UIControlStateNormal];
    newButton.titleLabel.font = SYSTEMFONT(22);
    newButton.titleLabel.textAlignment = NSTextAlignmentCenter;
    [newButton setBackgroundImage:IMAGE_NAMED(nomalImage) forState:UIControlStateNormal];
    [newButton setBackgroundImage:IMAGE_NAMED(highlightImage) forState:UIControlStateHighlighted];
    return newButton;
}

- (UIButton *)setWhiteButtonWithTitle:(NSString *)title
{
    int circleWidth = kScreenToButtonGap/2;
    UIButton *whiteButton = [UIButton buttonWithType:UIButtonTypeCustom];
    whiteButton.zj_acceptEventInterval = 1;
    [whiteButton setTitle:title forState:UIControlStateNormal];
    [whiteButton setTitleColor:KWhiteColor forState:UIControlStateNormal];
    whiteButton.titleLabel.font = SYSTEMFONT(22);
    [whiteButton.layer setMasksToBounds:YES];
    [whiteButton.layer setCornerRadius:circleWidth]; //设置矩形四个圆角半径
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

#pragma mark - 导航栏标题
- (UILabel *)navTitleLabel
{
    int isGap = kIOS5 ?18 :22;
    int font = kIOS5 ?21 :25;
    if (!_navTitleLabel) {
        
        _navTitleLabel = [self setTitleWithString:nil font:SYSTEMFONT(font)];
        _navTitleLabel.textAlignment = NSTextAlignmentCenter;
        _navTitleLabel.frame = CGRectMake(44, isGap, KScreenWidth - 88, 44);
    }
    return _navTitleLabel;
}

#pragma mark - goback按钮
- (UIButton *)gobackBtn
{
    int isGap = kIOS5? 15: 20;
    if (!_gobackBtn){
        _gobackBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _gobackBtn.frame = CGRectMake(5, isGap, 50, 40);
        _gobackBtn.zj_acceptEventInterval = 1;
        [_gobackBtn setImage:IMAGE_NAMED(@"main_back.png") forState:UIControlStateNormal];
        _gobackBtn.imageEdgeInsets = UIEdgeInsetsMake(10,15,9, 23);
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
