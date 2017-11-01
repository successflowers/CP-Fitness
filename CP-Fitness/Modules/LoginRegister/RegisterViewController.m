//
//  RegisterViewController.m
//  CP-Fitness
//
//  Created by 张敬 on 2017/10/26.
//  Copyright © 2017年 Jing Zhang. All rights reserved.
//

#import "RegisterViewController.h"
#import "LoginViewController.h"


@interface RegisterViewController ()

@property (nonatomic, retain) UILabel *titleLabel;

@property (nonatomic, retain) UIButton *loginButton;
@property (nonatomic, retain) UIButton *signButton;

@property (nonatomic, retain) ButtomLoginControls *buttomLoginControls;


@end

@implementation RegisterViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self initParam];
    [self initInterface];
}

#pragma mark - initParam
- (void)initParam
{
   
}

#pragma mark - initInterface
- (void)initInterface
{
    [self setBackgroundWithImage:@"ac_main_bg.png"];
    
    [self.view addSubview:self.titleLabel];
    [self.view addSubview:self.loginButton];
    [self.view addSubview:self.signButton];
    [self.view addSubview:self.buttomLoginControls];
    
    [self setupAutoLayout];
}

#pragma mark - autolayout
- (void)setupAutoLayout
{
    [self setupTitleLabelAutoLayout];
    [self setupLoginAndSignButtonAutoLayout];
    [self setupButtomLoginControlsAutoLayout];
}

//标题
- (void)setupTitleLabelAutoLayout
{
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.right.equalTo(self.view);
        make.top.equalTo(self.view.mas_top).with.offset(CP_FitnessToTopHeight);
        make.height.mas_equalTo(labelOrButtonSize);
    }];
}
//注册/登陆按钮
- (void)setupLoginAndSignButtonAutoLayout
{
    [self.loginButton mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.view.mas_top).with.offset(loginButtonToTopHeight);
        make.left.equalTo(self.view.mas_left).with.offset(kScreenToButtonGap);
        make.height.mas_equalTo(labelOrButtonSize);
        make.width.equalTo(self.signButton);
        make.right.equalTo(self.signButton.mas_left).with.offset(-loginToSignButtonGap);
    }];
    
    [self.signButton mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.height.equalTo(self.loginButton);
        make.right.equalTo(self.view.mas_right).with.offset(-kScreenToButtonGap);
    }];
}

- (void) setupButtomLoginControlsAutoLayout
{
    [self.buttomLoginControls mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.bottom.left.right.equalTo(self.view);
        make.height.mas_equalTo(114);
    }];
}

#pragma mark - event response
- (void)didLoginBtnClicked:(id)sender
{
    LoginViewController *loginVC = [[LoginViewController alloc] init];
    [self.navigationController pushViewController:loginVC animated:YES];
}
- (void)didSignBtnClicked:(id)sender
{
    
}

#pragma mark - setter and getter
- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        
        _titleLabel = [self setTitleWithString:@"CP Fitness" font:BOLDSYSTEMFONT(35)];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _titleLabel;
}

- (UIButton *)loginButton
{
    if (!_loginButton) {
        
        _loginButton = [self setWhiteButtonWithTitle:@"Login"];
        [_loginButton addTarget:self action:@selector(didLoginBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _loginButton;
}

- (UIButton *)signButton
{
    if (!_signButton) {
        
        _signButton = [self setWhiteButtonWithTitle:@"Sign up"];
         [_signButton addTarget:self action:@selector(didSignBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
       
    }
    return _signButton;
}

- (ButtomLoginControls *)buttomLoginControls
{
    if (!_buttomLoginControls) {
        
        ButtomLoginModel *model = [[ButtomLoginModel alloc] init];
        model.text = @"or sign up";
        model.font = SYSTEMFONT(20);
        model.faceBookIcon = @"ac_login_facebook.png";
        model.googleIcon = @"ac_login_google.png";
        model.screenWidth = KScreenWidth;
        
        _buttomLoginControls = [[ButtomLoginControls alloc] initWithModel:model];
    }
    return _buttomLoginControls;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
