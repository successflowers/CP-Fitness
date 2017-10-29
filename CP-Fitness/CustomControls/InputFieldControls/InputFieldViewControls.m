//
//  InputFieldViewControls.m
//  CP-Fitness
//
//  Created by 张敬 on 2017/10/28.
//  Copyright © 2017年 Jing Zhang. All rights reserved.
//

#import "InputFieldViewControls.h"

#define headIconSize 20.f   //头图标大小
#define endIconSize 16.f    //尾图标大小
#define iconToLineGap 10.f   //图标／下滑线间距
#define iconToTextFieldGap 15.f //图标／输入框间距
#define kScreenToIconGap 35.f   //屏幕／图标间距

@interface InputFieldViewControls()<UITextFieldDelegate>

@property (nonatomic, retain) UIImageView *headIcon;
@property (nonatomic, retain) UITextField *textField;
@property (nonatomic, retain) UIImageView *endIcon;

@property (nonatomic, retain) CAShapeLayer *buttomLineLayer;

@property (nonatomic, retain) InputFieldModel *model;

@end

@implementation InputFieldViewControls

- (instancetype) initWithModel:(InputFieldModel *)model
{
    self = [super init];
    if (self) {
        _model = model;
        self.backgroundColor = KClearColor;
        [self addSubview:self.headIcon];
        [self addSubview:self.endIcon];
        [self addSubview:self.textField];
        [self.layer addSublayer:self.buttomLineLayer];
        [self setupAutoLayout];
    }
    return self;
}

#pragma mark - 布局
- (void) setupAutoLayout
{
    [self.headIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.mas_left).with.offset(kScreenToIconGap);
        make.top.equalTo(self.mas_top).with.offset(iconToLineGap);
        make.width.height.mas_equalTo(headIconSize);
    }];
    
    [self.textField mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.headIcon.mas_right).with.offset(iconToTextFieldGap);
        make.top.bottom.equalTo(self.headIcon);
        make.right.equalTo(self.endIcon.mas_left).with.offset(-iconToTextFieldGap);
    }];
    
    [self.endIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.right.equalTo(self.mas_right).with.offset(-kScreenToIconGap);
        make.bottom.equalTo(self.headIcon.mas_bottom);
        make.width.height.mas_equalTo(endIconSize);
    }];
}

#pragma mark - setter and getter
- (UIImageView *)headIcon
{
    if (!_headIcon) {
        _headIcon = [[UIImageView alloc] init];
        _headIcon.image = IMAGE_NAMED(_model.headImage);
    }
    return _headIcon;
}

- (UIImageView *)endIcon
{
    if (!_endIcon) {
        _endIcon = [[UIImageView alloc] init];
        _endIcon.image = IMAGE_NAMED(_model.endImage);
    }
    return _endIcon;
}

- (UITextField *)textField
{
    if (!_textField) {
        _textField = [[UITextField alloc] init];
        _textField.borderStyle = UITextBorderStyleNone;
        _textField.secureTextEntry = YES; //密码
        _textField.delegate = self;
        _textField.autocorrectionType = UITextAutocorrectionTypeNo;
        _textField.autocapitalizationType = UITextAutocapitalizationTypeNone;
        _textField.returnKeyType = UIReturnKeyDone;
        _textField.clearButtonMode = UITextFieldViewModeWhileEditing;
        _textField.placeholder = _model.placeholder;
        _textField.textColor = underLineColor;
        _textField.font = SYSTEMFONT(18);
        [_textField setValue:underLineColor forKeyPath:@"_placeholderLabel.textColor"];
    }
    return _textField;
}

- (CAShapeLayer *)buttomLineLayer
{
    if (!_buttomLineLayer) {
        _buttomLineLayer = [CAShapeLayer layer];
        _buttomLineLayer.fillColor = underLineColor.CGColor;
        
        UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(kScreenToIconGap, 44, _model.screenWidth -kScreenToIconGap*2, underLineHeight)];
        _buttomLineLayer.path = path.CGPath;
    }
    return _buttomLineLayer;
}

@end
