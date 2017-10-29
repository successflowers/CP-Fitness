//
//  FindPassWordViewController.m
//  CP-Fitness
//
//  Created by 张敬 on 2017/10/29.
//  Copyright © 2017年 Jing Zhang. All rights reserved.
//

#import "FindPassWordViewController.h"

@interface FindPassWordViewController ()

@property (nonatomic, retain) InputFieldViewControls *emailControls;
@property (nonatomic, retain) UIButton *findPasswordBtn;

@end

@implementation FindPassWordViewController

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
    self.navTitleLabel.text = @"Find password";
    
    [self.view addSubview:self.emailControls];
    [self.view addSubview:self.findPasswordBtn];
    
    
    [self setupAutoLayout];
}

#pragma mark - autolayout
- (void)setupAutoLayout
{
    [self.emailControls mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.top.equalTo(self.view.mas_top).with.offset(UserNameToTopHeight);
        make.left.right.equalTo(self.view);
        make.height.mas_equalTo(labelOrButtonSize);
    }];
    
    [self.findPasswordBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.view.mas_top).with.offset(loginButtonToTopHeight);
        make.left.equalTo(self.view.mas_left).with.offset(loginButtonTopScreenSideGap);
        make.right.equalTo(self.view.mas_right).with.offset(-loginButtonTopScreenSideGap);
        make.height.mas_equalTo(labelOrButtonSize);
    }];
}

#pragma mark - event response

#pragma mark - setter and getter
- (InputFieldViewControls *)emailControls
{
    if (!_emailControls) {
        
        InputFieldModel *model = [[InputFieldModel alloc] init];
        model.endImage = nil;
        model.headImage = @"ac_login_password.png";
        model.placeholder = @"email";
        model.screenWidth = KScreenWidth;
        _emailControls = [[InputFieldViewControls alloc] initWithModel:model];
    }
    return _emailControls;
}

- (UIButton *)findPasswordBtn
{
    if (!_findPasswordBtn) {
        _findPasswordBtn = [self setButtonWithNomalImage:@"ac_statusselect_tvbg.png" highlightImage:@"ac_login_tvbg.png" title:@"Find password"];
    }
    return _findPasswordBtn;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
