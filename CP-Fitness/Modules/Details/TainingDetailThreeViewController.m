//
//  TainingDetailThreeViewController.m
//  CP-Fitness
//
//  Created by 张敬 on 2017/11/30.
//  Copyright © 2017年 Jing Zhang. All rights reserved.
//

#import "TainingDetailThreeViewController.h"
#import "RuleControls.h"

@interface TainingDetailThreeViewController ()
@property (nonatomic, strong) RuleControls *rulerControls;
@property (nonatomic, strong) NSMutableArray *rulerValueArr;
@property (nonatomic, strong) CATextLayer *heightLayer;
@property (nonatomic, strong) CALayer *heightLogoLayer;
@property (nonatomic, strong) UIButton *nextButton;

@end

@implementation TainingDetailThreeViewController
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
    self.navTitleLabel.text = @"Taining Detail(3/5)";
    
    [self.view.layer addSublayer:self.heightLayer];
    [self.view.layer addSublayer:self.heightLogoLayer];
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
- (CATextLayer *)heightLayer
{
    if (!_heightLayer) {
        _heightLayer = [CATextLayer layer];
        _heightLayer.fontSize = 32;
        _heightLayer.foregroundColor = KWhiteColor.CGColor;
        _heightLayer.alignmentMode = kCAAlignmentCenter;
        _heightLayer.frame = CGRectMake(0, 80, KScreenWidth, 44);
        _heightLayer.string = @"190 cm";
        // _weightLayer.backgroundColor = KRedColor.CGColor;
    }
    return _heightLayer;
}

- (CALayer *)heightLogoLayer
{
    if (!_heightLogoLayer) {
        
        UIImage *image = IMAGE_NAMED(@"sg.png");
        _heightLogoLayer = [CALayer layer];
        _heightLogoLayer.contents = (__bridge id)image.CGImage;
        
        NSLog(@"%@",NSStringFromCGSize(image.size));
        // _weightLogoLayer.backgroundColor = KBlueColor.CGColor;
        _heightLogoLayer.frame = CGRectMake(50, 450 - KScreenWidth/3*2.5, KScreenWidth/3, KScreenWidth/3*2.5);
    }
    return _heightLogoLayer;
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
    __weak TainingDetailThreeViewController *wekSelf = self;
    if (!_rulerControls) {
        _rulerControls = [[RuleControls alloc] init];
        _rulerControls.type = RuleControlsType_Vertical;
        _rulerControls.valueArr = self.rulerValueArr;
        _rulerControls.rulerHeight= 70;
        _rulerControls.rulerWidth = 100;
        _rulerControls.callback = ^(NSInteger selectedValue) {
            
            wekSelf.heightLayer.string = [NSString stringWithFormat:@"%@ cm",@(selectedValue)];
            NSLog(@"Good Luck! You selsected is %@ cm",@(selectedValue));
        };
    }
    return _rulerControls;
}

- (NSMutableArray *)rulerValueArr
{
    NSInteger maxHeight = 190;
    NSInteger minHeight = 110;
    
    if (!_rulerValueArr) {
        _rulerValueArr = @[].mutableCopy;
        
        for (NSInteger i = maxHeight; i>= minHeight; i--) {
            
            [_rulerValueArr addObject:@(i)];
        }
    }
    return _rulerValueArr;
}
@end
