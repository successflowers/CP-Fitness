//
//  LoginViewController.m
//  CP-Fitness
//
//  Created by 张敬 on 2017/10/28.
//  Copyright © 2017年 Jing Zhang. All rights reserved.
//

#import "LoginViewController.h"
#import "FindPassWordViewController.h"
#import "HomeViewController.h"


@interface LoginViewController ()

@property (nonatomic, retain) UILabel *loginLabel;

@property (nonatomic, retain) InputFieldViewControls *userNameInputControls;
@property (nonatomic, retain) InputFieldViewControls *passwordInputControls;

@property (nonatomic, retain) UILabel *remindLabel;
@property (nonatomic, retain) UIButton *remindButton;
@property (nonatomic, retain) UIButton *loginButton;


@property (nonatomic, retain) ButtomLoginControls *buttomLoginControls;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
    [self initInterface];
}

#pragma mark - initInterface
- (void)initInterface
{
    [self setBackgroundWithImage:@"ac_login_bg.png"];
    [self.view addSubview:self.gobackBtn];
    
    [self.view addSubview:self.loginLabel];
    [self.view addSubview:self.userNameInputControls];
    [self.view addSubview:self.passwordInputControls];
    [self.view addSubview:self.remindLabel];
    [self.view addSubview:self.remindButton];
    [self.view addSubview:self.loginButton];
    [self.view addSubview:self.buttomLoginControls];
    
    [self setupAutoLayout];
}

#pragma mark - autolayout
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
    
    [self.remindButton mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.left.right.height.equalTo(self.remindLabel);
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

#pragma mark - event response
- (void)didLoginBtnClicked:(id)sender
{
    NSLog(@"self.userModel.username = %@ self.userModel.password =%@ ",self.userModel.username ,self.userModel.password);
    __weak LoginViewController *weakSelf = self;
    [[ZJNetWorking sharedInstance] userLoginWithUserModel:self.userModel callBack:^(BOOL isSucessed, id outParam, NSString *eMsg) {
        if (isSucessed) {
            DDLog(@"good luck! %@",outParam);
            self.userModel.token = outParam[@"token"];
            DDLog(@"self.userModel.token =  %@", self.userModel.token);
            //存usermodel
            self.userModel.token = outParam[@"token"];
            self.userModel.myGym = outParam[@"myGym"];
            self.userModel.character = outParam[@"character"];
            
            [UserModel writeUserDefaultswithUserModel:self.userModel];
            
            HomeViewController *homeVC = [[HomeViewController alloc] init];
            [weakSelf.navigationController pushViewController:homeVC animated:YES];
        }
        else
        {
            DDLog(@"bad luck");
        }
    }];
}

- (void)didRemindBtnClicked:(id)sender
{
    FindPassWordViewController *findPasswordVC = [[FindPassWordViewController alloc] init];
    [self.navigationController pushViewController:findPasswordVC animated:YES];
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
        
        _remindLabel = [self setTitleWithString:@"Forget PassWord?" font:SYSTEMFONT(18)];
        _remindLabel.textAlignment = NSTextAlignmentRight;
        _remindLabel.textColor = remindLabelColor;
    }
    return _remindLabel;
}

- (UIButton *)remindButton
{
    if (!_remindButton) {
        
        _remindButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _remindButton.zj_acceptEventInterval = 1;
        [_remindButton addTarget:self action:@selector(didRemindBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _remindButton;
}


- (UIButton *)loginButton
{
    if (!_loginButton) {
        
        _loginButton = [self setButtonWithNomalImage:@"ac_statusselect_tvbg.png" highlightImage:@"ac_login_tvbg.png" title:@"Login"];
        [_loginButton addTarget:self action:@selector(didLoginBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _loginButton;
}

- (InputFieldViewControls *)userNameInputControls
{
    __weak LoginViewController *weakSelf = self;
    /*
     self.userModel.username = @"success123";
     self.userModel.password = @"123456";
     */
    if (!_userNameInputControls) {
        
        InputFieldModel *model = [[InputFieldModel alloc] init];
        model.endImage = @"yes.png";
        model.headImage = @"ac_login_username.png";
        model.placeholder = @"username";
        model.screenWidth = KScreenWidth;
        _userNameInputControls = [[InputFieldViewControls alloc] initWithModel:model];
        _userNameInputControls.callback = ^(BOOL isSucessed, NSString *textFiledStr) {
            
            weakSelf.userModel.username = textFiledStr;
        };
    }
    return _userNameInputControls;
}

- (InputFieldViewControls *)passwordInputControls
{
    __weak LoginViewController *weakSelf = self;
    if (!_passwordInputControls){
        
        InputFieldModel *model = [[InputFieldModel alloc] init];
        model.endImage = @"yes.png";
        model.headImage = @"ac_login_password.png";
        model.placeholder = @"password";
        model.screenWidth = KScreenWidth;
        _passwordInputControls = [[InputFieldViewControls alloc] initWithModel:model];
        _passwordInputControls.callback = ^(BOOL isSucessed, NSString *textFiledStr) {
            
            weakSelf.userModel.password = textFiledStr;
        };
    }
    
    return _passwordInputControls;
}

- (ButtomLoginControls *)buttomLoginControls
{
    if (!_buttomLoginControls) {
        
        ButtomLoginModel *model = [[ButtomLoginModel alloc] init];
        model.text = @"or sign with";
        model.font = SYSTEMFONT(20);
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
