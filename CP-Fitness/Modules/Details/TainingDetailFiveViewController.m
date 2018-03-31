//
//  TainingDetailFiveViewController.m
//  CP-Fitness
//
//  Created by 张敬 on 2017/11/30.
//  Copyright © 2017年 Jing Zhang. All rights reserved.
//

#import "TainingDetailFiveViewController.h"
#import "ChoiceControls.h"

@interface TainingDetailFiveViewController ()
@property (nonatomic, strong) CATextLayer *heartTilteLayer;
@property (nonatomic, strong) CALayer *heartLogoLayer;
@property (nonatomic, strong) CATextLayer *heartRateValueLayer;
@property (nonatomic, strong) CALayer *lineLayer;
@property (nonatomic, strong) CATextLayer *bpmValueLayer;

@property (nonatomic, strong) CALayer *heartLineLogoLayer;
@property (nonatomic, strong) UIButton *enterButton;
@property (nonatomic, strong) ChoiceControls *choiceOneControls;
@property (nonatomic, strong) ChoiceControls *choiceTwoControls;

@end

@implementation TainingDetailFiveViewController

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
     self.navTitleLabel.text = @"Taining Detail(5/5)";
    
    [self.view.layer addSublayer:self.heartTilteLayer];
    [self.view.layer addSublayer:self.heartLogoLayer];
    [self.view.layer addSublayer:self.heartRateValueLayer];
    [self.view.layer addSublayer:self.bpmValueLayer];
    [self.view.layer addSublayer:self.lineLayer];
    [self.view.layer addSublayer:self.heartLineLogoLayer];
    [self.view addSubview:self.choiceOneControls];
    [self.view addSubview:self.choiceTwoControls];
    [self.view addSubview:self.enterButton];
    
    [self setupAutoLayout];
}

#pragma mark - autolayout
- (void)setupAutoLayout
{
    
}

#pragma mark - event response
- (void)didEnterBtnClicked:(id)sender
{
    
    
}

#pragma mark - setter and getter
- (CATextLayer *)heartTilteLayer
{
    if (!_heartTilteLayer) {
        _heartTilteLayer = [CATextLayer layer];
        _heartTilteLayer.fontSize = 20;
        _heartTilteLayer.foregroundColor = KWhiteColor.CGColor;
        _heartTilteLayer.alignmentMode = kCAAlignmentCenter;
        _heartTilteLayer.frame = CGRectMake(0, 80, KScreenWidth, 44);
        _heartTilteLayer.string = @"Resting Heart Rate";
        //_heartTilteLayer.backgroundColor = KRedColor.CGColor;
    }
    return _heartTilteLayer;
}

- (CALayer *)heartLogoLayer
{
    if (!_heartLogoLayer) {
        
        UIImage *image = IMAGE_NAMED(@"fpc5h.png");
        _heartLogoLayer = [CALayer layer];
        _heartLogoLayer.contents = (__bridge id)image.CGImage;
        _heartLogoLayer.frame = CGRectMake(KScreenWidth/2 -20, 140, 40, 40);
    }
    return _heartLogoLayer;
}

- (CATextLayer *)heartRateValueLayer
{
    if (!_heartRateValueLayer)
    {
        _heartRateValueLayer = [CATextLayer layer];
        _heartRateValueLayer.fontSize = 32;
        _heartRateValueLayer.foregroundColor = KWhiteColor.CGColor;
        _heartRateValueLayer.alignmentMode = kCAAlignmentCenter;
        _heartRateValueLayer.frame = CGRectMake(0, 200, KScreenWidth, 44);
        _heartRateValueLayer.string = @"150";
    }
    return _heartRateValueLayer;
}

- (CATextLayer *)bpmValueLayer
{
    if (!_bpmValueLayer) {
        _bpmValueLayer = [CATextLayer layer];
        _bpmValueLayer.fontSize = 20;
        _bpmValueLayer.foregroundColor = KWhiteColor.CGColor;
        _bpmValueLayer.alignmentMode = kCAAlignmentCenter;
        //_bpmValueLayer.backgroundColor = KRedColor.CGColor;
        _bpmValueLayer.frame = CGRectMake(220, 220, 40, 30);
        _bpmValueLayer.string = @"bpm";
    }
    return _bpmValueLayer;
}

- (CALayer *)lineLayer
{
    if (!_lineLayer) {
        _lineLayer = [CALayer layer];
        _lineLayer.backgroundColor = underLineColor.CGColor;
        _lineLayer.frame = CGRectMake(KScreenWidth/2 -35, 235, 70, 2);
    }
    return _lineLayer;
}

- (CALayer *)heartLineLogoLayer
{
    if (!_heartLineLogoLayer) {
        
        UIImage *image = IMAGE_NAMED(@"fpc5l.png");
        _heartLineLogoLayer = [CALayer layer];
        _heartLineLogoLayer.contents = (__bridge id)image.CGImage;
        _heartLineLogoLayer.frame = CGRectMake(0, 260,KScreenWidth, 50);
    }
    return _heartLineLogoLayer;
}

- (ChoiceControls *)choiceOneControls
{
    if (!_choiceOneControls) {
        _choiceOneControls = [[ChoiceControls alloc] init];
        _choiceOneControls.frame = CGRectMake(0, KScreenHeight/3*2, KScreenWidth, 44);
        _choiceOneControls.warningLayer.string = @"I have the history of hypertension.heart disease or asthma";
        _choiceOneControls.warningLayer.foregroundColor = KRedColor.CGColor;
    }
    return _choiceOneControls;
}

- (ChoiceControls *)choiceTwoControls
{
    if (!_choiceTwoControls) {
        
        _choiceTwoControls = [[ChoiceControls alloc] init];
        _choiceTwoControls.frame = CGRectMake(0, KScreenHeight/3*2+44, KScreenWidth, 44);
        _choiceTwoControls.warningLayer.string = @"I am a work lover with 3-4 times workout per week";
        _choiceTwoControls.warningLayer.foregroundColor = KWhiteColor.CGColor;
    }
    return _choiceTwoControls;
}

- (UIButton *)enterButton
{
    if (!_enterButton) {
        _enterButton = [self setButtonWithNomalImage:@"ac_perfectinfo_btbg.png" highlightImage:nil title:@"Enter"];
        _enterButton.frame = CGRectMake(30, KScreenHeight -80, KScreenWidth-60, 44);
        [_enterButton addTarget:self action:@selector(didEnterBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _enterButton;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
