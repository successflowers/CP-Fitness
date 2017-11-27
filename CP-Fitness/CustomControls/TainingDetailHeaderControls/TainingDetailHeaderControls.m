//
//  TainingDetailHeaderControls.m
//  CP-Fitness
//
//  Created by 张敬 on 2017/11/19.
//  Copyright © 2017年 Jing Zhang. All rights reserved.
//

#import "TainingDetailHeaderControls.h"

#define RedLineToScreenSideGap 20.0f
#define RedLineToScreenTopGap  30.0f
#define RedLineHeight  50.0f
#define lineToRedLineGap 10.0f
#define userIconWidth 60.0f
#define endIconWidth 20.0f
#define sideGap 10.0f

@interface TainingDetailHeaderControls()

@property (nonatomic, retain) UILabel *userNameLabel;
@property (nonatomic, retain) UIImageView *userIcon;
@property (nonatomic, retain) UIImageView *logoIcon;
@property (nonatomic, retain) UIButton *sendButton;

@property (nonatomic, retain) UILabel *titleLabel;
@property (nonatomic, retain) UILabel *titleDetailLabel;

@property (nonatomic, retain) CAShapeLayer *redLineLayer;
@property (nonatomic, retain) CAShapeLayer *lineLayer;

@end

@implementation TainingDetailHeaderControls
- (instancetype) init
{
    self = [super init];
    if (self) {
        self.backgroundColor = KClearColor;
        [self addSubview:self.userNameLabel];
        [self addSubview:self.userIcon];
        [self addSubview:self.logoIcon];
        [self addSubview:self.sendButton];
        [self addSubview:self.titleLabel];
        [self addSubview:self.titleDetailLabel];
        [self.layer addSublayer:self.redLineLayer];
        [self.layer addSublayer:self.lineLayer];
        [self setupAutoLayout];
    }
    return self;
}

#pragma mark - autolayout
- (void) setupAutoLayout
{
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.mas_left).with.offset(RedLineToScreenSideGap + sideGap);
        make.top.equalTo(self.mas_top).with.offset(RedLineToScreenTopGap);
        make.right.equalTo(self);
        make.height.mas_equalTo(30);
    }];
    
    [self.titleDetailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.titleLabel.mas_bottom);
        make.left.right.equalTo(self.titleLabel);
        make.height.mas_equalTo(20);
    }];
    
    [self.logoIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.right.equalTo(self.mas_right).with.offset(-sideGap);
        make.top.equalTo(self.titleLabel);
        make.height.mas_equalTo(RedLineHeight);
        make.width.mas_equalTo(RedLineHeight*2.5);
    }];
    
    [self.userIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.titleDetailLabel.mas_bottom).with.offset(lineToRedLineGap+sideGap*2);
        make.left.equalTo(self.mas_left).offset(RedLineToScreenSideGap);
        make.width.height.mas_equalTo(userIconWidth);
    }];
    
    [self.userNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.userIcon.mas_right).with.offset(sideGap);
        make.top.bottom.equalTo(self.userIcon);
        make.right.equalTo(self.titleDetailLabel);
    }];
    
    [self.sendButton mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.right.equalTo(self.mas_right).with.offset(-sideGap);
        make.top.equalTo(self.userIcon);
        make.width.height.mas_equalTo(endIconWidth);
    }];
}

#pragma mark - event response
- (void)didSendBtnClicked:(id)sender
{
}

#pragma mark - setter and getter
- (void)setModel:(TainingDetailModel *)model
{
    _model = model;
    self.userIcon.image = IMAGE_NAMED(model.userImage);
    self.userNameLabel.text = model.userName;
    self.titleLabel.text = model.titleStr;
    self.titleDetailLabel.text = model.date;
}

- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.textAlignment = NSTextAlignmentLeft;
        _titleLabel.font = SYSTEMFONT(22);
        _titleLabel.textColor = KWhiteColor;
    }
    return _titleLabel;
}

- (UILabel *)titleDetailLabel
{
    if (!_titleDetailLabel) {
        
        _titleDetailLabel = [[UILabel alloc] init];
        _titleDetailLabel.textAlignment = NSTextAlignmentLeft;
        _titleLabel.font = SYSTEMFONT(20);
        _titleDetailLabel.textColor = RGB(186, 154, 180);
    }
    return _titleDetailLabel;
}

- (UILabel *)userNameLabel
{
    if (!_userNameLabel) {
        
        _userNameLabel = [[UILabel alloc] init];
        _userNameLabel.textAlignment = NSTextAlignmentLeft;
        _userNameLabel.font = SYSTEMFONT(22);
        _userNameLabel.textColor = KWhiteColor;
    }
    return _userNameLabel;
}

- (UIButton *)sendButton
{
    if (!_sendButton) {
        
        _sendButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _sendButton.zj_acceptEventInterval = 1;
        [_sendButton setImage:IMAGE_NAMED(@"send.png") forState:UIControlStateNormal];
        [_sendButton addTarget:self action:@selector(didSendBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _sendButton;
}

- (UIImageView *)userIcon
{
    if (!_userIcon) {
        _userIcon = [[UIImageView alloc] init];
    }
    return _userIcon;
}

- (UIImageView *)logoIcon
{
    if (!_logoIcon) {
        
        _logoIcon = [[UIImageView alloc] init];
        _logoIcon.image = IMAGE_NAMED(@"main_logo.png");
    }
    return _logoIcon;
}

- (CAShapeLayer *)redLineLayer
{
    if (!_redLineLayer) {
        
        _redLineLayer = [CAShapeLayer layer];
        _redLineLayer.fillColor = RGB(246, 154, 155).CGColor;
        
        UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(RedLineToScreenSideGap,RedLineToScreenTopGap,2.5,RedLineHeight)];
        _redLineLayer.path = path.CGPath;
    }
    return _redLineLayer;
}

- (CAShapeLayer *)lineLayer
{
    if (!_lineLayer) {
        
        _lineLayer = [CAShapeLayer layer];
        _lineLayer.fillColor = RGB(186, 154, 180).CGColor;
        
        UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(sideGap,RedLineHeight+RedLineToScreenTopGap+sideGap,KScreenWidth - 2*sideGap, underLineHeight)];
        _lineLayer.path = path.CGPath;
    }
    return _lineLayer;
}

@end
