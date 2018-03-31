//
//  TainingDetailTwoViewController.m
//  CP-Fitness
//
//  Created by 张敬 on 2017/11/30.
//  Copyright © 2017年 Jing Zhang. All rights reserved.
//

#import "TainingDetailTwoViewController.h"
#import "RuleControls.h"
#define yearLayerToMiddleGap 40

@interface TainingDetailTwoViewController ()
@property (nonatomic, retain) ProfileViewControls *maleControls;
@property (nonatomic, retain) ProfileViewControls *femaleControls;
@property (nonatomic, strong) RuleControls *rulerControls;
@property (nonatomic, strong) NSMutableArray *rulerValueArr;
@property (nonatomic, strong) CATextLayer *yearLayer;
@property (nonatomic, strong) CATextLayer *yearSignLayer;
@property (nonatomic, strong) UIButton *nextButton;

@end

@implementation TainingDetailTwoViewController

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
    self.navTitleLabel.text = @"Taining Detail(2/5)";
    
    [self.view addSubview:self.maleControls];
    [self.view addSubview:self.femaleControls];
    [self.view.layer addSublayer:self.yearLayer];
    [self.view.layer addSublayer:self.yearSignLayer];
    [self.view addSubview:self.nextButton];
    [self.view addSubview:self.rulerControls];
}

#pragma mark - autolayout
- (void)setupAutoLayout
{
}

#pragma mark - event response
- (void)didNextBtnClicked:(id)sender{
}

#pragma mark - setter and getter
- (ProfileViewControls *)maleControls
{
    if (!_maleControls) {
        
        ProfileModel *model = [[ProfileModel alloc] init];
        model.headIcon = @"ac_perfectinfo_men.png";
        model.headName = @"Male";
        model.font = SYSTEMFONT(18);
        
        _maleControls = [[ProfileViewControls alloc] init];
        _maleControls.frame = CGRectMake(KScreenWidth/5, 80, KScreenWidth/5, KScreenWidth/5);
        _maleControls.model = model;
    }
    return _maleControls;
}

- (ProfileViewControls *)femaleControls
{
    if (!_femaleControls) {
        ProfileModel *model = [[ProfileModel alloc] init];
        model.headIcon = @"ac_perfectinfo_woman.png";
        model.headName = @"Female";
        model.font = SYSTEMFONT(18);
        
        _femaleControls = [[ProfileViewControls alloc] init];
        _femaleControls.frame = CGRectMake(KScreenWidth/5*3, 80, KScreenWidth/5, KScreenWidth/5);
        _femaleControls.model = model;
    }
    return _femaleControls;
}

- (CATextLayer *)yearSignLayer
{
    if (!_yearSignLayer) {
        
        _yearSignLayer = [CATextLayer layer];
        _yearSignLayer.fontSize = 22;
        _yearSignLayer.foregroundColor = KWhiteColor.CGColor;
        _yearSignLayer.alignmentMode = kCAAlignmentCenter;
        _yearSignLayer.frame = CGRectMake(0, KScreenHeight/2-yearLayerToMiddleGap, KScreenWidth, 35);
        _yearSignLayer.string = @"Date of Birth";
        // _weightLayer.backgroundColor = KRedColor.CGColor;
    }
    return _yearSignLayer;
}

- (CATextLayer *)yearLayer
{
    if (!_yearLayer) {
        _yearLayer = [CATextLayer layer];
        _yearLayer.fontSize = 32;
        _yearLayer.foregroundColor = KWhiteColor.CGColor;
        _yearLayer.alignmentMode = kCAAlignmentCenter;
        _yearLayer.frame = CGRectMake(0, KScreenHeight/2-yearLayerToMiddleGap +35, KScreenWidth, 44);
        _yearLayer.string = @"2017";
        // _weightLayer.backgroundColor = KRedColor.CGColor;
    }
    return _yearLayer;
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

- (RuleControls *)rulerControls
{
    __weak TainingDetailTwoViewController *wekSelf = self;
    if (!_rulerControls) {
        _rulerControls = [[RuleControls alloc] init];
        _rulerControls.type = RuleControlsType_Horizontal;
        _rulerControls.valueArr = self.rulerValueArr;
        _rulerControls.rulerHeight= 70;
        _rulerControls.rulerWidth = 100;
        _rulerControls.callback = ^(NSInteger selectedValue) {
            
            wekSelf.yearLayer.string = [NSString stringWithFormat:@"%@",@(selectedValue)];
            NSLog(@"Good Luck! You selsected is %@ year",@(selectedValue));
        };
    }
    return _rulerControls;
}

- (NSMutableArray *)rulerValueArr
{
     NSInteger thisYear = [NSDate year:[NSDate date]];
     NSInteger startYear = thisYear - 120;
     
     if (!_rulerValueArr) {
     _rulerValueArr = @[].mutableCopy;
     
     for (NSInteger i = thisYear; i>= startYear; i--) {
     
     [_rulerValueArr addObject:@(i)];
        }
    }
    return _rulerValueArr;
}

@end
