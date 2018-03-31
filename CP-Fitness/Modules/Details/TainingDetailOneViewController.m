//
//  TainingDetailOneViewController.m
//  CP-Fitness
//
//  Created by 张敬 on 2017/11/30.
//  Copyright © 2017年 Jing Zhang. All rights reserved.
//

#import "TainingDetailOneViewController.h"

@interface TainingDetailOneViewController ()
@property (nonatomic, strong) UIButton *nextButton;
@property (nonatomic, strong) CALayer *personalLogoLayer;
@property (nonatomic, retain) SettingViewControls *gymControls;
@property (nonatomic, retain) SettingViewControls *FristNameControls;
@property (nonatomic, retain) SettingViewControls *lastNameControls;
@property (nonatomic, retain) SettingViewControls *cellPhoneControls;

@end

@implementation TainingDetailOneViewController

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
    self.navTitleLabel.text = @"Taining Detail(1/5)";
    
    [self.view addSubview:self.nextButton];
    [self.view.layer addSublayer:self.personalLogoLayer];
    [self.view addSubview:self.gymControls];
    [self.view addSubview:self.FristNameControls];
    [self.view addSubview:self.lastNameControls];
    [self.view addSubview:self.cellPhoneControls];
    
    
    [self setupAutoLayout];
}

#pragma mark - autolayout
- (void)setupAutoLayout
{
    [self.gymControls mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.view.mas_top).offset(220);
        make.left.right.equalTo(self.view);
        make.height.mas_equalTo(50.f);
    }];
    
    [self.FristNameControls mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.gymControls.mas_bottom);
        make.right.height.left.equalTo(self.gymControls);
    }];
    [self.lastNameControls mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.FristNameControls.mas_bottom);
        make.right.height.left.equalTo(self.gymControls);
    }];
    
    [self.cellPhoneControls mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.lastNameControls.mas_bottom);
        make.right.height.left.equalTo(self.gymControls);
    }];
}

#pragma mark - event response
- (void)didNextBtnClicked:(id)sender
{
}

#pragma mark - setter and getter
- (CALayer *)personalLogoLayer
{
    if (!_personalLogoLayer) {
        
        UIImage *image = IMAGE_NAMED(@"ac_perfectinfo_compile.png");
        _personalLogoLayer = [CALayer layer];
        _personalLogoLayer.contents = (__bridge id)image.CGImage;
        
        NSLog(@"%@",NSStringFromCGSize(image.size));
        // _weightLogoLayer.backgroundColor = KBlueColor.CGColor;
        _personalLogoLayer.frame = CGRectMake(KScreenWidth/3, 100, 80, 90);
    }
    return _personalLogoLayer;
}

- (SettingViewControls *)gymControls
{
    if (!_gymControls) {
        
        _gymControls = [[SettingViewControls alloc] init];
        _gymControls.headString = @"Gym ID";
    }
    return _gymControls;
}

- (SettingViewControls *)FristNameControls
{
    if (!_FristNameControls) {
        
        _FristNameControls = [[SettingViewControls alloc] init];
        _FristNameControls.headString = @"Frist Name";
    }
    return _FristNameControls;
}

- (SettingViewControls *)lastNameControls
{
    if (!_lastNameControls) {
        
        _lastNameControls = [[SettingViewControls alloc] init];
        _lastNameControls.headString = @"Last Name";
    }
    return _lastNameControls;
}

- (SettingViewControls *)cellPhoneControls
{
    if (!_cellPhoneControls) {
        
        _cellPhoneControls = [[SettingViewControls alloc] init];
        _cellPhoneControls.headString = @"Cell phone";
    }
    return _cellPhoneControls;
}



- (UIButton *)nextButton
{
    if (!_nextButton) {
        _nextButton = [self setButtonWithNomalImage:@"ac_perfectinfo_btbg.png" highlightImage:nil title:@"Next"];
        _nextButton.frame = CGRectMake(30, KScreenHeight -80, KScreenWidth-60, 44);
        [_nextButton addTarget:self action:@selector(didNextBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _nextButton;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

@end
