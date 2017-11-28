//
//  SettingViewControls.m
//  CP-Fitness
//
//  Created by 张敬 on 2017/10/29.
//  Copyright © 2017年 Jing Zhang. All rights reserved.
//

#import "SettingViewControls.h"

#define lineLayerToScreenGap 25.f
#define headLabToLineGap 15.f
#define headLabToTextFieldGap 10.f
#define headLadWidth 80.f

@interface SettingViewControls()<UITextFieldDelegate>

@property (nonatomic, retain) UILabel *headLabel;
@property (nonatomic, retain) UITextField *textField;
@property (nonatomic, retain) CAShapeLayer *lineLayer;
@end

@implementation SettingViewControls

- (instancetype) init
{
    self = [super init];
    if (self) {
        
        [self addSubview:self.headLabel];
        [self addSubview:self.textField];
        [self.layer addSublayer:self.lineLayer];
        
        [self setupAutoLayout];
    }
    return self;
}

#pragma mark - autolayout
- (void)setupAutoLayout
{
    [self.headLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self);
        make.left.equalTo(self.mas_left).offset(lineLayerToScreenGap);
        make.height.mas_equalTo(labelOrButtonSize);
        make.width.mas_equalTo(headLadWidth);
        
    }];
    
    [self.textField mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.height.equalTo(self.headLabel);
        make.left.equalTo(self.headLabel.mas_right).offset(-headLabToTextFieldGap);
        make.right.equalTo(self.mas_right).offset(-lineLayerToScreenGap);
    }];
}
#pragma mark  - textField.delegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}
- (void)textFieldDidEndEditing:(UITextField *)textField
{
    if (self.callback) {
        self.callback(YES, _textField.text);
    }
}
#pragma mark - event response
#pragma mark - setter and getter

- (void)setHeadString:(NSString *)headString
{
    self.headLabel.text = headString;
}

- (UILabel *)headLabel
{
    if (!_headLabel) {
        
        _headLabel = [[UILabel alloc] init];
        _headLabel.textColor = KWhiteColor;
        _headLabel.font = SYSTEMFONT(18);
    }
    return _headLabel;
}

- (UITextField *)textField
{
    if (!_textField) {
        
        _textField = [[UITextField alloc] init];
        _textField.borderStyle = UITextBorderStyleNone;
        _textField.secureTextEntry = NO; //密码
        _textField.delegate = self;
        _textField.autocorrectionType = UITextAutocorrectionTypeNo;
        _textField.autocapitalizationType = UITextAutocapitalizationTypeNone;
        _textField.returnKeyType = UIReturnKeyDone;
        _textField.clearButtonMode = UITextFieldViewModeWhileEditing;
        _textField.textAlignment = NSTextAlignmentRight;
        _textField.textColor = underLineColor;
        _textField.font = SYSTEMFONT(18);
        [_textField setValue:underLineColor forKeyPath:@"_placeholderLabel.textColor"];
    }
    return _textField;
}

- (CAShapeLayer *)lineLayer
{
    if (!_lineLayer) {
        
        _lineLayer = [CAShapeLayer layer];
        _lineLayer.fillColor = underLineColor.CGColor;
        
        UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(lineLayerToScreenGap, 50, KScreenWidth -lineLayerToScreenGap*2, underLineHeight)];
        _lineLayer.path = path.CGPath;
    }
    return _lineLayer;
}
@end
