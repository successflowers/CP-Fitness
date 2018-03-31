//
//  TainingDetailFourViewController.m
//  CP-Fitness
//
//  Created by 张敬 on 2017/11/29.
//  Copyright © 2017年 Jing Zhang. All rights reserved.
//

#import "TainingDetailFourViewController.h"
#import "RuleControls.h"

@interface TainingDetailFourViewController ()
@property (nonatomic, strong) RuleControls *rulerControls;
@property (nonatomic, strong) NSMutableArray *rulerValueArr;
@property (nonatomic, strong) CATextLayer *weightLayer;
@property (nonatomic, strong) CALayer *weightLogoLayer;
@property (nonatomic, strong) UIButton *nextButton;

@end

@implementation TainingDetailFourViewController

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
    self.navTitleLabel.text = @"Taining Detail(4/5)";

    [self.view.layer addSublayer:self.weightLayer];
    [self.view.layer addSublayer:self.weightLogoLayer];
    [self.view addSubview:self.nextButton];
    [self.view addSubview:self.rulerControls];
}

#pragma mark - autolayout
- (void)setupAutoLayout
{

}

#pragma mark - event response
- (void)didNextBtnClicked:(id)sender
{
    

}

#pragma mark - setter and getter
- (CATextLayer *)weightLayer
{
    if (!_weightLayer) {
        _weightLayer = [CATextLayer layer];
        _weightLayer.fontSize = 32;
        _weightLayer.foregroundColor = KWhiteColor.CGColor;
        _weightLayer.alignmentMode = kCAAlignmentCenter;
        _weightLayer.frame = CGRectMake(0, 80, KScreenWidth, 44);
        _weightLayer.string = @"200 kg";
       // _weightLayer.backgroundColor = KRedColor.CGColor;
    }
    return _weightLayer;
}

- (CALayer *)weightLogoLayer
{
    if (!_weightLogoLayer) {
        
        UIImage *image = IMAGE_NAMED(@"wiget.png");
        _weightLogoLayer = [CALayer layer];
        _weightLogoLayer.contents = (__bridge id)image.CGImage;
        
        NSLog(@"%@",NSStringFromCGSize(image.size));
       // _weightLogoLayer.backgroundColor = KBlueColor.CGColor;
        _weightLogoLayer.frame = CGRectMake(KScreenWidth/3, 140, KScreenWidth/3, 220);
    }
    return _weightLogoLayer;
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
    __weak TainingDetailFourViewController *wekSelf = self;
    if (!_rulerControls) {
        _rulerControls = [[RuleControls alloc] init];
        _rulerControls.type = RuleControlsType_Horizontal;
        _rulerControls.valueArr = self.rulerValueArr;
        _rulerControls.rulerHeight= 70;
        _rulerControls.rulerWidth = 100;
        _rulerControls.callback = ^(NSInteger selectedValue) {
            
            wekSelf.weightLayer.string = [NSString stringWithFormat:@"%@ kg",@(selectedValue)];
            NSLog(@"Good Luck! You selsected is %@ kg",@(selectedValue));
        };
    }
    return _rulerControls;
}

- (NSMutableArray *)rulerValueArr
{
    NSInteger maxWeight = 200;
    NSInteger minWeight = 50;
    
    if (!_rulerValueArr) {
        _rulerValueArr = @[].mutableCopy;
        
        for (NSInteger i = maxWeight; i>= minWeight; i--) {
            
            [_rulerValueArr addObject:@(i)];
        }
    }
    return _rulerValueArr;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
