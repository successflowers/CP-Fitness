//
//  SignUpViewController.m
//  CP-Fitness
//
//  Created by 张敬 on 2017/11/19.
//  Copyright © 2017年 Jing Zhang. All rights reserved.
//

#import "SignUpViewController.h"
#import "HomeViewController.h"

#define titleLabelToTopLineGap  kIOS5? 110.f :120.f
#define userFeildToTitleLabelGop kIOS5? 50.f :80.f
#define createAccountBtnToCheckLabelGap kIOS5 ?70.f :100.f

@interface SignUpViewController ()

@property (nonatomic, retain) UILabel *signUpLabel;
@property (nonatomic, retain) UILabel *checkingLabel;

@property (nonatomic, retain) InputFieldViewControls *userNameInputControls;
@property (nonatomic, retain) InputFieldViewControls *passwordInputControls;
@property (nonatomic, retain) InputFieldViewControls *emailInputControls;
@property (nonatomic, retain) UIButton *createAccountButton;


@end

@implementation SignUpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initInterface];
}

#pragma mark - initInterface
- (void)initInterface
{
    [self setBackgroundWithImage:@"ac_login_bg.png"];
    [self.view addSubview:self.gobackBtn];
    
    [self.view addSubview:self.signUpLabel];
    [self.view addSubview:self.checkingLabel];
    [self.view addSubview:self.userNameInputControls];
    [self.view addSubview:self.passwordInputControls];
    [self.view addSubview:self.emailInputControls];
    [self.view addSubview:self.createAccountButton];

    [self setupAutoLayout];
}

#pragma mark - autolayout
- (void) setupAutoLayout
{
    [self.signUpLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.view.mas_top).with.offset(titleLabelToTopLineGap);
        make.left.equalTo(self.view.mas_left).with.offset(KScreenWidth/2.f);
        make.right.equalTo(self.view);
        make.height.mas_equalTo(60.f);
    }];
    
    [self.userNameInputControls mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.signUpLabel.mas_bottom).with.offset(userFeildToTitleLabelGop);
        make.left.right.equalTo(self.view);
        make.height.mas_equalTo(labelOrButtonSize);
        
    }];
    
    [self.emailInputControls mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.userNameInputControls.mas_bottom);
        make.left.right.height.equalTo(self.userNameInputControls);
    }];
    
    [self.passwordInputControls mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.emailInputControls.mas_bottom);
        make.left.right.height.equalTo(self.userNameInputControls);
    }];
    [self.checkingLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.passwordInputControls.mas_bottom);
        make.left.equalTo(self.view.mas_left).offset(kScreenToButtonGap);
        make.right.equalTo(self.view.mas_right).offset(-kScreenToButtonGap);
        
        make.height.mas_equalTo(44.f);
    }];

    [self.createAccountButton mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.checkingLabel.mas_bottom).with.offset(createAccountBtnToCheckLabelGap);
        make.left.equalTo(self.view.mas_left).with.offset(loginButtonTopScreenSideGap);
        make.right.equalTo(self.view.mas_right).with.offset(-loginButtonTopScreenSideGap);
        make.height.mas_equalTo(labelOrButtonSize);
    }];
}

#pragma mark - event response
- (void)didCreateAccountBtnClicked:(id)sender
{
    __weak SignUpViewController *weakSelf = self;
    [[ZJNetWorking sharedInstance] userRegistWithUserModel:self.userModel callBack:^(BOOL isSucessed, id outParam, NSString *eMsg) {
        
        if (isSucessed) {
            DDLog(@"good luck! %@",outParam);
            self.userModel.token = outParam[@"token"];
            self.userModel.myGym = outParam[@"myGym"];
            self.userModel.character = outParam[@"character"];
            [UserModel writeUserDefaultswithUserModel:self.userModel];
            
            HomeViewController *homeVC = [[HomeViewController alloc] init];
            [weakSelf.navigationController pushViewController:homeVC animated:YES];
        }else
        {
            DDLog(@"bad luck");
        }
    }];
   
}

#pragma mark - setter and getter
- (UILabel *)signUpLabel
{
    if (!_signUpLabel) {
        
        _signUpLabel = [self setTitleWithString:@"Sign in" font:SYSTEMFONT(50)];
        _signUpLabel.textAlignment = NSTextAlignmentLeft;
    }
    return _signUpLabel;
}

- (UILabel *)checkingLabel
{
    if (!_checkingLabel) {
        
        _checkingLabel = [self setTitleWithString:@"Sign in" font:SYSTEMFONT(15)];
        _checkingLabel.textColor = RGB(243, 58, 105);
        _checkingLabel.numberOfLines = 0;
        _checkingLabel.text = @"Password cannot be shorter than 3 or longer than 20 characters";
        _checkingLabel.textAlignment = NSTextAlignmentLeft;
    }
    return _checkingLabel;
}

- (UIButton *)createAccountButton
{
    if (!_createAccountButton) {
        
        _createAccountButton = [self setButtonWithNomalImage:@"ac_statusselect_tvbg.png" highlightImage:@"ac_login_tvbg.png" title:@"Create Account"];
        [_createAccountButton addTarget:self action:@selector(didCreateAccountBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _createAccountButton;
}

- (InputFieldViewControls *)userNameInputControls
{
    __weak SignUpViewController *weakSelf = self;
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

- (InputFieldViewControls *)emailInputControls
{
    __weak SignUpViewController *weakSelf = self;
    if (!_emailInputControls){
        
        InputFieldModel *model = [[InputFieldModel alloc] init];
        model.endImage = @"yes.png";
        model.headImage = @"ac_login_email.png";
        model.placeholder = @"email";
        model.screenWidth = KScreenWidth;
        _emailInputControls = [[InputFieldViewControls alloc] initWithModel:model];
        _emailInputControls.callback = ^(BOOL isSucessed, NSString *textFiledStr){
            weakSelf.userModel.email = textFiledStr;
        };
    }
    
    return _emailInputControls;
}

- (InputFieldViewControls *)passwordInputControls
{
    __weak SignUpViewController *weakSelf = self;
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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
