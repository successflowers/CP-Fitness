//
//  ButtomLoginControls.m
//  CP-Fitness
//
//  Created by 张敬 on 2017/10/28.
//  Copyright © 2017年 Jing Zhang. All rights reserved.
//

#import "ButtomLoginControls.h"

#define lineToMiddleLabelGap 10.f   //下划线／标签间距
#define kScreenSideTolineGap 35.f   //屏幕到下划线间距
#define middleLabelHeight 44.f      //标签高度
#define lineHeight 1.5f             //下划线高度
#define loginButtonToScreenButtomGap 15.f  //按钮／屏幕底部间距
#define faceBookToGoogleGap 20.f    //facebook/google按钮间距
#define loginButtonWidth 40.f       //按钮宽度

@interface ButtomLoginControls()

@property (nonatomic, retain) CAShapeLayer *leftLine;
@property (nonatomic, retain) CAShapeLayer *rightLine;

@property (nonatomic, retain) UILabel *middleLabel;

@property (nonatomic, retain) UIButton *faceBookButton;
@property (nonatomic, retain) UIButton *googleButton;

@property (nonatomic, assign) CGFloat middleLabelWidth;
@property (nonatomic, assign) CGFloat lineWidth;

@property (nonatomic, retain) ButtomLoginModel *model;

@end

@implementation ButtomLoginControls

- (instancetype)initWithModel:(ButtomLoginModel *)model
{
    self = [super init];
    if (self) {
        
        _model = model;
        self.backgroundColor = KClearColor;
        //计算文字的长度
        CGSize maxSize = CGSizeMake(MAXFLOAT, middleLabelHeight);
        CGSize newSize = [self sizeWithText:model.text font:model.font maxSize:maxSize];
        self.middleLabelWidth = newSize.width;
        self.lineWidth = (model.screenWidth -(_middleLabelWidth+2*kScreenSideTolineGap+lineToMiddleLabelGap*2))/2.f;
        
        [self.layer addSublayer:self.leftLine];
        [self.layer addSublayer:self.rightLine];
        
        [self addSubview:self.middleLabel];
        [self addSubview:self.faceBookButton];
        [self addSubview:self.googleButton];
        
        [self setupAutoLayout];
    }
    return self;
}

- (void) setupAutoLayout
{
    [self.middleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.right.left.equalTo(self);
        make.height.mas_equalTo(middleLabelHeight);
    }];
    
    [self.faceBookButton mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.bottom.equalTo(self.mas_bottom).with.offset(-loginButtonToScreenButtomGap);
        
        make.width.height.mas_equalTo(loginButtonWidth);
        
        make.left.equalTo(self.mas_left).with.offset(_model.screenWidth/2.f-loginButtonWidth-faceBookToGoogleGap/2.f);
    }];
    
    [self.googleButton mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.width.height.equalTo(self.faceBookButton);
        make.left.equalTo(self.faceBookButton.mas_right).with.offset(faceBookToGoogleGap);
    }];
}

#pragma mark - setter and getter
- (void)setModel:(ButtomLoginModel *)model
{
    _model = model;
    
    self.middleLabel.text = model.text;
    self.middleLabel.font = model.font;
    
    [self.faceBookButton setBackgroundImage:[UIImage imageNamed:model.faceBookIcon] forState:UIControlStateNormal];
    [self.googleButton setBackgroundImage:[UIImage imageNamed:model.googleIcon] forState:UIControlStateNormal];
}

- (CAShapeLayer *)leftLine
{
    if (!_leftLine) {
        
        _leftLine = [CAShapeLayer layer];
        _leftLine.fillColor = underLineColor.CGColor;
        
        CGRect rect = CGRectMake(kScreenSideTolineGap, middleLabelHeight/2.f, _lineWidth, lineHeight);
        UIBezierPath *path = [UIBezierPath bezierPathWithRect:rect];
        _leftLine.path = path.CGPath;
        
    }
    return _leftLine;
}

- (CAShapeLayer *)rightLine
{
    if (!_rightLine) {
        
        _rightLine = [CAShapeLayer layer];
        _rightLine.fillColor = underLineColor.CGColor;
        
        CGRect rect = CGRectMake(_model.screenWidth - (_lineWidth+kScreenSideTolineGap), middleLabelHeight/2.f, _lineWidth, lineHeight);
        UIBezierPath *path = [UIBezierPath bezierPathWithRect:rect];
        _rightLine.path = path.CGPath;
        
    }
    return _rightLine;
}

- (UILabel *)middleLabel
{
    if (!_middleLabel) {
        
        _middleLabel = [[UILabel alloc] init];
        _middleLabel.backgroundColor = KClearColor;
        _middleLabel.textAlignment = NSTextAlignmentCenter;
        _middleLabel.textColor = KWhiteColor;
        _middleLabel.text = _model.text;
        _middleLabel.font = _model.font;
    }
    return _middleLabel;
}

- (UIButton *)faceBookButton
{
    if (!_faceBookButton) {
        
        _faceBookButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_faceBookButton setImage:IMAGE_NAMED(_model.faceBookIcon) forState:UIControlStateNormal];
    }
    return _faceBookButton;
}

- (UIButton *)googleButton
{
    if (!_googleButton) {
        
        _googleButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_googleButton setImage:IMAGE_NAMED(_model.googleIcon) forState:UIControlStateNormal];
    }
    return _googleButton;
}

#pragma mark - other methods
- (CGSize)sizeWithText:(NSString *)text font:(UIFont *)font maxSize:(CGSize)maxSize{
    NSDictionary *attrs = @{NSFontAttributeName:font};
    return [text boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
}

@end
