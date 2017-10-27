//
//  RegisterViewController.m
//  CP-Fitness
//
//  Created by 张敬 on 2017/10/26.
//  Copyright © 2017年 Jing Zhang. All rights reserved.
//

#import "RegisterViewController.h"

@interface RegisterViewController ()

@property (nonatomic, retain) UILabel *titleLabel;

@property (nonatomic, retain) UIButton *LoginButton;
@property (nonatomic, retain) UIButton *SignButton;
@property (nonatomic, retain) UIButton *faceBookButton;
@property (nonatomic, retain) UIButton *googleButton;

@property (nonatomic, retain) UIView *boundaryLayer;

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
    
    [self.view addSubview:self.titleLabel];
    
    [self.view addSubview:self.LoginButton];
    [self.view addSubview:self.SignButton];
    
    [self.view addSubview:self.boundaryLayer];
    
    [self.view addSubview:self.faceBookButton];
    [self.view addSubview:self.googleButton];
    
    [self setupAutoLayout];
}

#pragma mark - 自动布局
- (void)setupAutoLayout
{
    [self setupTitleLabelAutoLayout];
    [self setupLoginAndSignButtonAutoLayout];
    [self setupBounderLayerAutoLayout];
    [self setupFaceBookAndGoogleBttonAutoLayout];
}

//标题
- (void)setupTitleLabelAutoLayout
{
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.right.equalTo(self.view);
        make.top.equalTo(self.view.mas_top).with.offset(TITLE_HEIGHT);
        make.height.mas_equalTo(BUTTON_WIDTH);
    }];
}
//注册/登陆按钮
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

//标签布局
- (void) setupBounderLayerAutoLayout
{
    [self.boundaryLayer mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.right.equalTo(self.view);
        make.top.equalTo(self.view.mas_top).with.offset(BOUNDARYLAYER_HEIGHT);
        make.height.mas_equalTo(BUTTON_WIDTH);
    }];
}

//facebook和google布局
- (void)setupFaceBookAndGoogleBttonAutoLayout
{
    [self.faceBookButton mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.bottom.equalTo(self.view.mas_bottom).with.offset(-BUTTION_SIDE);
        make.height.width.mas_equalTo(FACEBOOK_WIDTH);
        make.left.equalTo(self.view.mas_left).with.offset(KScreenWidth/2.f-FACEBOOK_WIDTH-BUTTION_SIDE/2.f);
    }];
    
    [self.googleButton mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.height.width.equalTo(self.faceBookButton);
        make.left.equalTo(self.faceBookButton.mas_right).with.offset(BUTTION_SIDE);
    }];
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

- (UIView *)boundaryLayer
{
    if (!_boundaryLayer) {
        _boundaryLayer = [self setBoundaryLayerWithString:@"or sign in" font:SYSTEMFONT(20)];
    }
    return _boundaryLayer;
}

- (UIButton *)faceBookButton
{
    if (!_faceBookButton) {
      _faceBookButton = [self setButtonWithNomalImage:@"ac_login_facebook.png" highlightImage:nil title:nil];
    }
    return _faceBookButton;
}

- (UIButton *)googleButton
{
    if (!_googleButton) {
       _googleButton = [self setButtonWithNomalImage:@"ac_login_google.png" highlightImage:nil title:nil];
    }
    return _googleButton;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
