//
//  ChoiceControls.m
//  CP-Fitness
//
//  Created by 张敬 on 2017/11/30.
//  Copyright © 2017年 Jing Zhang. All rights reserved.
//

#import "ChoiceControls.h"

@interface ChoiceControls()
{
    BOOL _isDraw;
}


@end

@implementation ChoiceControls
#pragma mark  ---- init ----
- (instancetype)init{
    self = [super init];
    if (self) {
        [self initParam];
        [self.layer addSublayer:self.warningLayer];
        [self addSubview:self.choiceButton];
    }
    return self;
}

- (void)initParam{
    _isDraw = YES;
    //self.backgroundColor = KRedColor;
}

- (void)layoutSubviews {
    
    [super layoutSubviews];
    if (_isDraw) {
        _isDraw = NO;
        [self drawRuler];
    }
}

#pragma mark  ---- 绘制界面  ----
- (void)drawRuler{
    
    [self reLoadUIRect];
}

- (void)reLoadUIRect
{
    self.choiceButton.frame = CGRectMake(15, 15, 20, 20);
    self.warningLayer.frame = CGRectMake(50, 0, self.bounds.size.width - 60, 44);
}

#pragma mark ---- event reponse ----
- (void)didChoiceButtonClicked:(id)sender
{
    
}
#pragma mark ---- setter ----
#pragma mark ---- getter ----
- (CATextLayer *)warningLayer
{
    if (!_warningLayer) {
        _warningLayer = [CATextLayer layer];
        _warningLayer.fontSize = 14;
        _warningLayer.foregroundColor = KWhiteColor.CGColor;
        _warningLayer.alignmentMode = kCAAlignmentLeft;
        _warningLayer.wrapped = YES;
         //_warningLayer.backgroundColor = KRedColor.CGColor;
    }
    return _warningLayer;
}

- (UIButton *)choiceButton
{
    if (!_choiceButton) {
        _choiceButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _choiceButton.zj_acceptEventInterval = 1;
        [_choiceButton setImage:IMAGE_NAMED(@"unselected_white.png") forState:UIControlStateNormal];
//        [_choiceButton addTarget:self action:@selector(didChoiceButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _choiceButton;
}

@end
