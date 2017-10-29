//
//  ProfileViewController.m
//  CP-Fitness
//
//  Created by 张敬 on 2017/10/29.
//  Copyright © 2017年 Jing Zhang. All rights reserved.
//

#import "ProfileViewController.h"
#import "SettingViewController.h"
#import "StateViewController.h"

@interface ProfileViewController ()

@property (nonatomic, retain) UIButton *chageProfileButton;
@property (nonatomic, retain) UIButton *settingButton;

@property (nonatomic, retain) ProfileViewControls *profileControls;

@end

@implementation ProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initInterface];
}

#pragma mark - initInterface
- (void)initInterface
{
    [self setBackgroundWithImage:@"ac_perfectinfo_bg.png"];
    [self.view addSubview:self.gobackBtn];
    [self.view addSubview:self.navTitleLabel];
    self.navTitleLabel.text = @"Profile";
    
    [self.view addSubview:self.profileControls];
    [self.view addSubview:self.chageProfileButton];
    [self.view addSubview:self.settingButton];
    
    [self setupAutoLayout];
}

#pragma mark - autoLayout
- (void)setupAutoLayout
{
    [self.profileControls mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.view.mas_top).offset(ProfileToTopHeight);
        make.left.right.equalTo(self.view);
        make.height.mas_equalTo(200.f);
        
    }];
    
    [self.chageProfileButton mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.view.mas_top).offset(ProfileButtonToTopHeight);
        make.left.equalTo(self.view.mas_left).offset(kScreenToButtonGap);
        make.right.equalTo(self.view.mas_right).offset(-kScreenToButtonGap);
        make.height.mas_equalTo(labelOrButtonSize);
    }];
    
    [self.settingButton mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.chageProfileButton.mas_bottom).offset(ProfileButtonGap);
        make.left.right.height.equalTo(self.chageProfileButton);
    }];
}

#pragma mark - event response
- (void)didChageProfileBtnClicked:(id)sender
{
    StateViewController *settingVC = [[StateViewController alloc] init];
    [self.navigationController pushViewController:settingVC animated:YES];
}

- (void)didSettingBtnClicked:(id)sender
{
    SettingViewController *settingVC = [[SettingViewController alloc] init];
    [self.navigationController pushViewController:settingVC animated:YES];
}

#pragma mark - setter and getter
- (ProfileViewControls *)profileControls
{
    if (!_profileControls){
        
        ProfileModel *model = [[ProfileModel alloc] init];
        model.headIcon = @"main_portrait.png";
        model.headName = @"Matt Skythor";
        model.font = SYSTEMFONT(23);
        
        _profileControls = [[ProfileViewControls alloc] init];
        _profileControls.model = model;
    }
    return _profileControls;
}

- (UIButton *)chageProfileButton
{
    if (!_chageProfileButton) {
        
        _chageProfileButton = [self setButtonWithNomalImage:@"ac_profile_tvbg1.png" highlightImage:nil title:@"Chage Profile"];
        [_chageProfileButton addTarget:self action:@selector(didChageProfileBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _chageProfileButton;
}

- (UIButton *)settingButton
{
    if (!_settingButton) {
        
        _settingButton = [self setButtonWithNomalImage:@"ac_profile_tvbg2.png" highlightImage:nil title:@"Setting"];
        [_settingButton addTarget:self action:@selector(didSettingBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _settingButton;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   
}

@end
