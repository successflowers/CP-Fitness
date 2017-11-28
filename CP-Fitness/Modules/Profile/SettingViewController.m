//
//  SettingViewController.m
//  CP-Fitness
//
//  Created by 张敬 on 2017/10/29.
//  Copyright © 2017年 Jing Zhang. All rights reserved.
//

#import "SettingViewController.h"
#define titleLabelToTopGap  kIOS5 ?150 :200
#define webSiteFeildToTitleGap  kIOS5 ?60 :150

@interface SettingViewController ()

@property (nonatomic, retain) UILabel *cpFitnessLabel;
@property (nonatomic, retain) SettingViewControls *webSiteControls;
@property (nonatomic, retain) SettingViewControls *phoneControls;

@end

@implementation SettingViewController

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
    self.navTitleLabel.text = @"Setting";
    
    [self.view addSubview:self.cpFitnessLabel];
    [self.view addSubview:self.webSiteControls];
    [self.view addSubview:self.phoneControls];
    
    [self setupAutoLayout];
}

#pragma mark - autolayout
- (void)setupAutoLayout
{
    [self.cpFitnessLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.view.mas_top).offset(titleLabelToTopGap);
        make.left.right.equalTo(self.view);
        make.height.mas_equalTo(labelOrButtonSize);
    }];
    
    [self.webSiteControls mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.cpFitnessLabel.mas_bottom).offset(webSiteFeildToTitleGap);
        make.left.right.equalTo(self.view);
        make.height.mas_equalTo(50.f);
        
    }];
    
    [self.phoneControls mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.top.equalTo(self.webSiteControls.mas_bottom);
        make.right.height.left.equalTo(self.webSiteControls);
    }];
    
}

#pragma mark - event response
#pragma mark - setter and getter
- (UILabel *)cpFitnessLabel
{
    if (!_cpFitnessLabel) {
        
        _cpFitnessLabel = [self setTitleWithString:@"CP Fitness" font:SYSTEMFONT(30)];
        _cpFitnessLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _cpFitnessLabel;
}

- (SettingViewControls *)webSiteControls
{
    if (!_webSiteControls) {
       
        _webSiteControls = [[SettingViewControls alloc] init];
        _webSiteControls.headString = @"Website:";
    }
    return _webSiteControls;
}

- (SettingViewControls *)phoneControls
{
    if (!_phoneControls) {
        
        _phoneControls = [[SettingViewControls alloc] init];
        _phoneControls.headString = @"Phone:";
    }
    return _phoneControls;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

@end
