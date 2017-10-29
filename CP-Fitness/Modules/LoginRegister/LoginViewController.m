//
//  LoginViewController.m
//  CP-Fitness
//
//  Created by 张敬 on 2017/10/28.
//  Copyright © 2017年 Jing Zhang. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@property (nonatomic, retain) UILabel *loginLabel;

@property (nonatomic, retain) InputFieldViewControls *userNameInputControls;
@property (nonatomic, retain) InputFieldViewControls *passwordInputControls;

@property (nonatomic, retain) UILabel *remindLabel;
@property (nonatomic, retain) UIButton *loginButton;

@property (nonatomic, retain) ButtomLoginControls *buttomLoginControls;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
    [self initUILayout];
}

#pragma mark - initUILayout
- (void)initUILayout
{
    [self setBackgroundWithImage:@"ac_login_bg.png"];
    
    [self.view addSubview:self.loginLabel];
    [self.view addSubview:self.userNameInputControls];
    [self.view addSubview:self.passwordInputControls];
    [self.view addSubview:self.remindLabel];
    [self.view addSubview:self.loginButton];
    [self.view addSubview:self.buttomLoginControls];
    
    [self setupAutoLayout];
}

#pragma mark - 自动布局
- (void) setupAutoLayout
{
    [self.loginLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.view.mas_top).with.offset(LoginLabelToTopHeight);
        make.left.equalTo(self.view.mas_left).with.offset(KScreenWidth/2.f);
        make.right.equalTo(self.view);
        make.height.mas_equalTo(60.f);
    }];
    
    [self.userNameInputControls mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.view.mas_top).with.offset(UserNameToTopHeight);
        make.left.right.equalTo(self.view);
        make.height.mas_equalTo(labelOrButtonSize);
        
    }];
    
    [self.passwordInputControls mas_makeConstraints:^(MASConstraintMaker *make) {

        make.top.equalTo(self.userNameInputControls.mas_bottom);
        make.left.right.height.equalTo(self.userNameInputControls);
    }];
    
    [self.remindLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.passwordInputControls.mas_bottom);
        make.left.equalTo(self.view).with.offset(kScreenToButtonGap);
        make.right.equalTo(self.view.mas_right).with.offset(-kScreenToButtonGap);
        make.height.mas_equalTo(labelOrButtonSize);
    }];
    
    [self.loginButton mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.view.mas_top).with.offset(loginButtonToTopHeight);
        make.left.equalTo(self.view.mas_left).with.offset(loginButtonTopScreenSideGap);
        make.right.equalTo(self.view.mas_right).with.offset(-loginButtonTopScreenSideGap);
        make.height.mas_equalTo(labelOrButtonSize);
    }];

    [self.buttomLoginControls mas_makeConstraints:^(MASConstraintMaker *make) {

        make.bottom.left.right.equalTo(self.view);
        make.height.mas_equalTo(114);
    }];
}

#pragma mark - reponse
- (void)didClicked:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - setter and getter
- (UILabel *)loginLabel
{
    if (!_loginLabel) {
        _loginLabel = [self setTitleWithString:@"Login" font:SYSTEMFONT(50)];
        _loginLabel.textAlignment = NSTextAlignmentLeft;
    }
    return _loginLabel;
}

- (UILabel *)remindLabel
{
    if (!_remindLabel) {
        _remindLabel = [self setTitleWithString:@"Forget PassWord?" font:SYSTEMFONT(20)];
        _remindLabel.textAlignment = NSTextAlignmentRight;
        _remindLabel.textColor = KBlueColor;
    }
    return _remindLabel;
}

- (UIButton *)loginButton
{
    if (!_loginButton) {
        _loginButton = [self setButtonWithNomalImage:@"ac_statusselect_tvbg.png" highlightImage:@"ac_login_tvbg.png" title:@"Login"];
        [_loginButton addTarget:self action:@selector(didClicked:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _loginButton;
}

- (InputFieldViewControls *)userNameInputControls
{
    if (!_userNameInputControls) {
        InputFieldModel *model = [[InputFieldModel alloc] init];
        model.endImage = @"yes.png";
        model.headImage = @"ac_login_username.png";
        model.placeholder = @"username";
        model.screenWidth = KScreenWidth;

        _userNameInputControls = [[InputFieldViewControls alloc] initWithModel:model];
    }
    return _userNameInputControls;
}

- (InputFieldViewControls *)passwordInputControls
{
    if (!_passwordInputControls){
        
        InputFieldModel *model = [[InputFieldModel alloc] init];
        
        model.endImage = @"yes.png";
        model.headImage = @"ac_login_password.png";
        model.placeholder = @"password";
        model.screenWidth = KScreenWidth;
        
        _passwordInputControls = [[InputFieldViewControls alloc] initWithModel:model];
    }
    
    return _passwordInputControls;
}

- (ButtomLoginControls *)buttomLoginControls
{
    if (!_buttomLoginControls) {
        
        ButtomLoginModel *model = [[ButtomLoginModel alloc] init];
        model.text = @"or sign with";
        model.font = SYSTEMFONT(18);
        model.faceBookIcon = @"ac_login_facebook.png";
        model.googleIcon = @"ac_login_google.png";
        model.screenWidth = KScreenWidth;
    
        _buttomLoginControls = [[ButtomLoginControls alloc] initWithModel:model];
    }
    return _buttomLoginControls;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

@end
