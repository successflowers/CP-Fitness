//
//  RegisterViewController.m
//  CP-Fitness
//
//  Created by 张敬 on 2017/10/26.
//  Copyright © 2017年 Jing Zhang. All rights reserved.
//

#import "RegisterViewController.h"

@interface RegisterViewController ()

@property (nonatomic, retain) UIButton *LoginButton;
@property (nonatomic, retain) UIButton *SignButton;


@end

@implementation RegisterViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self initParam];
    [self initUILayout];
}

#pragma mark - initParam
- (void)initParam
{
   
}

#pragma mark - initUILayout
- (void)initUILayout
{
    [self setBackgroundWithImage:@"ac_main_bg.png"];
    
    [self.view addSubview:self.LoginButton];
    [self.view addSubview:self.SignButton];
    
    [self setupLoginAndSignButtonAutoLayout];
}

#pragma mark - 布局
- (void)setupLoginAndSignButtonAutoLayout
{
    [self.LoginButton mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.view.mas_top).with.offset(BUTTON_WHITE_HEIGHT);
        make.left.equalTo(self.view.mas_left).with.offset(BUTTION_SIDE);
        make.height.mas_equalTo(BUTTON_WIDTH);
        make.width.equalTo(self.SignButton);
        make.right.equalTo(self.SignButton.mas_left).with.offset(-BUTTON_MIDDLE);
    }];
    
    [self.SignButton mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.height.equalTo(self.LoginButton);
        make.right.equalTo(self.view.mas_right).with.offset(-BUTTION_SIDE);
    }];
}

#pragma mark - setter and getter
- (UIButton *)LoginButton
{
    if (!_LoginButton) {
        _LoginButton = [self setWhiteButtonWithTitle:@"Login"];
    }
    return _LoginButton;
}

- (UIButton *)SignButton
{
    if (!_SignButton) {
        _SignButton = [self setWhiteButtonWithTitle:@"Sign up"];
    }
    return _SignButton;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
