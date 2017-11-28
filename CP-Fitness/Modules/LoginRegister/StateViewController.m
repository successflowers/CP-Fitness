//
//  StateViewController.m
//  CP-Fitness
//
//  Created by 张敬 on 2017/10/29.
//  Copyright © 2017年 Jing Zhang. All rights reserved.
//

#import "StateViewController.h"
#import "FindPassWordViewController.h"

@interface StateViewController ()

@property (nonatomic, retain) UIButton *instructorBtn;
@property (nonatomic, retain) UIButton *traineeBtn;
@property (nonatomic, retain) UIButton *nextBtn;
@property (nonatomic, retain) UILabel *signLab;
@property (nonatomic, assign) NSInteger isChoosedNum;

@end

@implementation StateViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.isChoosedNum = 0;
    
    [self initInterface];
}

#pragma mark - initInterface
- (void)initInterface
{
    [self setBackgroundWithImage:@"ac_perfectinfo_bg.png"];
    [self.view addSubview:self.gobackBtn];
    [self.view addSubview:self.navTitleLabel];
    self.navTitleLabel.text = @"What is your status?";
    
    [self.view addSubview:self.instructorBtn];
    [self.view addSubview:self.traineeBtn];
    [self.view addSubview:self.nextBtn];
    [self.view addSubview:self.signLab];

    [self setupAutoLayout];
}

#pragma mark - autolayout
- (void)setupAutoLayout
{
    int gap = kScreenToButtonGap;
    [self.instructorBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.view.mas_top).with.offset(UserNameToTopHeight);
        make.left.equalTo(self.view.mas_left).with.offset(gap);
        make.right.equalTo(self.view.mas_right).with.offset(-gap);
        make.height.mas_equalTo(labelOrButtonSize);
    }];
    
    [self.traineeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.instructorBtn.mas_bottom).with.offset(ProfileButtonGap);
        make.left.right.height.equalTo(self.instructorBtn);
    }];
    
    [self.nextBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.view.mas_top).with.offset(loginButtonToTopHeight);
        make.left.equalTo(self.view.mas_left).with.offset(loginButtonTopScreenSideGap);
        make.right.equalTo(self.view.mas_right).with.offset(-loginButtonTopScreenSideGap);
        make.height.mas_equalTo(labelOrButtonSize);
    }];
    
    [self.signLab mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.nextBtn.mas_bottom).offset(50);
        make.left.right.equalTo(self.view);
        make.height.mas_equalTo(labelOrButtonSize);
    }];
}

#pragma mark - event response
- (void)didInstructorBtnCllicked:(id)sender
{
    int gap = kScreenToButtonGap;
    if (_isChoosedNum != 1) {
        _isChoosedNum = 1;
        [_instructorBtn setImage:IMAGE_NAMED(@"ac_statusselect_checked.png") forState:UIControlStateNormal];
        [_traineeBtn setImage:IMAGE_NAMED(@"") forState:UIControlStateNormal];
        _instructorBtn.imageEdgeInsets = UIEdgeInsetsMake(25, KScreenWidth - gap*2-40, 25, 20);
        _instructorBtn.titleEdgeInsets = UIEdgeInsetsMake(0,-100,0,0);
        _traineeBtn.titleEdgeInsets = UIEdgeInsetsMake(0,0,0,0);

       [_instructorBtn setBackgroundImage:IMAGE_NAMED(@"ac_statusselect_checked1.png") forState:UIControlStateNormal];
        [_traineeBtn setBackgroundImage:IMAGE_NAMED(@"ac_statusselect_unchecked2.png") forState:UIControlStateNormal];
        [_nextBtn setBackgroundImage:IMAGE_NAMED(@"ac_statusselect_tvbg.png") forState:UIControlStateNormal];
    }
}

- (void)didTraineeBtnClicked:(id)sender
{
    int gap = kScreenToButtonGap;
    if (_isChoosedNum != 2) {
        _isChoosedNum = 2;
        [_instructorBtn setImage:IMAGE_NAMED(@"") forState:UIControlStateNormal];
        [_traineeBtn setImage:IMAGE_NAMED(@"ac_statusselect_checked.png") forState:UIControlStateNormal];
        _traineeBtn.imageEdgeInsets = UIEdgeInsetsMake(25, KScreenWidth - gap*2-40, 25, 20);
        _traineeBtn.titleEdgeInsets = UIEdgeInsetsMake(0,-100,0,0);
        _instructorBtn.titleEdgeInsets = UIEdgeInsetsMake(0,0,0,0);
        [_instructorBtn setBackgroundImage:IMAGE_NAMED(@"ac_statusselect_unchecked1.png") forState:UIControlStateNormal];
        [_traineeBtn setBackgroundImage:IMAGE_NAMED(@"ac_statusselect_checked2.png") forState:UIControlStateNormal];
        [_nextBtn setBackgroundImage:IMAGE_NAMED(@"ac_statusselect_tvbg.png") forState:UIControlStateNormal];
    }
}

- (void)didNextBtnClicked:(id)sender
{
    if (_isChoosedNum != 0) {
        NSLog(@"next can chick");
    }
}

#pragma mark - setter and getter
- (UIButton *)instructorBtn
{
    if (!_instructorBtn) {
        
        _instructorBtn = [self setButtonWithNomalImage:@"ac_statusselect_unchecked1.png" highlightImage:nil title:@"Instructor"];
        [_instructorBtn addTarget:self action:@selector(didInstructorBtnCllicked:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _instructorBtn;
}

- (UIButton *)traineeBtn
{
    if (!_traineeBtn) {
        
         _traineeBtn = [self setButtonWithNomalImage:@"ac_statusselect_unchecked2.png" highlightImage:nil title:@"Trainee"];
        [_traineeBtn addTarget:self action:@selector(didTraineeBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _traineeBtn;
}

- (UIButton *)nextBtn
{
    if (!_nextBtn) {
        
        _nextBtn = [self setButtonWithNomalImage:@"huisignup.png" highlightImage:nil title:@"next"];
        [_nextBtn addTarget:self action:@selector(didNextBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _nextBtn;
}

- (UILabel *)signLab
{
    if (!_signLab) {
        
        _signLab = [self setTitleWithString:@"You can only have one status in your account" font:SYSTEMFONT(18)];
        _signLab.textAlignment = NSTextAlignmentCenter;
    }
    return _signLab;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
