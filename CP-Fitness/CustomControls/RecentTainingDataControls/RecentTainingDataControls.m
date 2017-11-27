//
//  RecentTainingDataControls.m
//  CP-Fitness
//
//  Created by 张敬 on 2017/11/19.
//  Copyright © 2017年 Jing Zhang. All rights reserved.
//

#import "RecentTainingDataControls.h"

#define maskViewHeight 44.0f
#define sideGap 10.0f
#define colorBarLayerToTopGap 80.0f
#define lineToScreenSideGap 20.0f
#define lineToScreenTopGap 250.0f
#define separateLineHeight 44.0f
#define circleWidth 100.0f

@interface RecentTainingDataControls()

@property (nonatomic, retain) UIView *circleView;
@property (nonatomic, retain) UIImageView *colorBarIcon;
@property (nonatomic, retain) UIImageView *maxHeartRateIcon;

@property (nonatomic, retain) UILabel *timeLabel;
@property (nonatomic, retain) UILabel *heartLabel;
@property (nonatomic, retain) UILabel *cocahLabel;
@property (nonatomic, retain) UILabel *unkownLabel;

@property (nonatomic, retain) UIImageView *separateLineIcon1;
@property (nonatomic, retain) UIImageView *separateLineIcon2;

@property (nonatomic, retain) CAShapeLayer *maskLayer;
@property (nonatomic, retain) UILabel *titleLabel;
@property (nonatomic, retain) UILabel *dataLabel;

@property (nonatomic, retain) CAShapeLayer *lineLayer;

@end

@implementation RecentTainingDataControls

- (instancetype) init
{
    self = [super init];
    if (self) {
        self.layer.cornerRadius = 4.0f;
        self.layer.masksToBounds = true;
        self.backgroundColor = RGB(63, 52, 63);
        
        [self.layer addSublayer:self.maskLayer];
        [self addSubview:self.titleLabel];
        [self addSubview:self.dataLabel];
        
        
        [self addSubview:self.colorBarIcon];
        [self addSubview:self.maxHeartRateIcon];
        
        [self addSubview:self.timeLabel];
        [self addSubview:self.heartLabel];
        [self addSubview:self.cocahLabel];
        [self addSubview:self.unkownLabel];

        
        [self addSubview:self.separateLineIcon1];
        [self addSubview:self.separateLineIcon2];
        
        
        [self.layer addSublayer:self.lineLayer];
        [self setupAutoLayout];
    }
    return self;
}

#pragma mark - autolayout
- (void) setupAutoLayout
{
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.mas_left).with.offset(sideGap);
        make.top.equalTo(self);
        make.width.mas_equalTo(170.0f);
        make.height.mas_equalTo(maskViewHeight);
    }];
    
    [self.dataLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.titleLabel.mas_right).offset(sideGap);
        make.top.right.equalTo(self);
        make.height.equalTo(self.titleLabel);
    }];
    
    [self.colorBarIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.right.left.equalTo(self);
        make.top.equalTo(self.mas_top).offset(colorBarLayerToTopGap);
        make.height.mas_equalTo(circleWidth - 20);
    }];
    [self.maxHeartRateIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.mas_left).offset(KScreenWidth/2+12);
        make.top.equalTo(self.colorBarIcon.mas_top).offset(-7);
        make.height.width.mas_equalTo(50);
    }];
    
   
    [self.separateLineIcon1 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.mas_centerX).offset(.5f);
        make.top.equalTo(self.mas_top).offset(lineToScreenTopGap -separateLineHeight);
        make.width.mas_equalTo(underLineHeight);
        make.height.mas_equalTo(separateLineHeight);
    }];
    
    
    [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {

        make.top.bottom.equalTo(self.separateLineIcon1);
        make.left.equalTo(self.mas_left).offset(lineToScreenSideGap);
        make.right.equalTo(self.separateLineIcon1.mas_left).offset(-2);
    }];

    [self.heartLabel mas_makeConstraints:^(MASConstraintMaker *make) {

        make.left.right.height.equalTo(self.timeLabel);
        make.top.equalTo(self.timeLabel.mas_bottom);
    }];

    [self.unkownLabel mas_makeConstraints:^(MASConstraintMaker *make) {

        make.left.equalTo(self.separateLineIcon1.mas_right).offset(35);
        make.top.width.height.equalTo(self.timeLabel);
    }];

    [self.cocahLabel mas_makeConstraints:^(MASConstraintMaker *make) {

        make.top.equalTo(self.unkownLabel.mas_bottom);
        make.left.right.height.equalTo(self.unkownLabel);
    }];
    
    [self.separateLineIcon2 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.separateLineIcon1.mas_bottom);
        make.left.right.height.equalTo(self.separateLineIcon1);
    }];
    
   
}

#pragma mark private methods
- (UILabel *)setLabelWithImage:(NSString *)image text:(NSString *)text
{
    UILabel *label = [[UILabel alloc] init];
    label.font = SYSTEMFONT(20);
    label.textColor = KWhiteColor;

    NSTextAttachment *attachment = [[NSTextAttachment alloc] init];
    attachment.image = IMAGE_NAMED(image);
    attachment.bounds = CGRectMake(0, -5, 20, 20);
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:text];
    // 创建带有图片的富文本
    NSAttributedString *iconStr = [NSAttributedString attributedStringWithAttachment:attachment];
    [attributedString insertAttributedString:iconStr atIndex:0];
    label.attributedText = attributedString;
    return label;
}

- (CATextLayer *)setTextLayerWithString:(NSString *)string font:(UIFont *)font textColor:(UIColor *)textColor
{
    CATextLayer *textLayer = [CATextLayer layer];
    CFStringRef fontCFString = (__bridge CFStringRef)font.fontName;
    CGFontRef fontRef = CGFontCreateWithFontName(fontCFString);
    textLayer.font = fontRef;
    textLayer.fontSize = font.pointSize;
    CGFontRelease(fontRef);
    textLayer.wrapped = YES;//默认为No.  当Yes时，字符串自动适应layer的bounds大小
    textLayer.alignmentMode = kCAAlignmentCenter;//字体的对齐方式
    textLayer.foregroundColor = textColor.CGColor;
    textLayer.string = string;
    
    return textLayer;
}

- (UIImageView *)CreateImageViewWithFrame:(CGRect)rect
                            andBackground:(CGColorRef)color
                                andRadius:(CGFloat)radius{
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    UIGraphicsBeginImageContext(imageView.frame.size);
    CGContextRef context = UIGraphicsGetCurrentContext();   // 设置上下文
    CGContextSetLineWidth(context, 1);                  // 边框大小
    CGContextSetStrokeColorWithColor(context, color);   // 边框颜色
    CGContextSetFillColorWithColor(context, color);     // 填充颜色
    
    CGFloat x = rect.origin.x;
    CGFloat y = rect.origin.y;
    CGFloat width = rect.size.width;
    CGFloat height = rect.size.height;
    CGContextMoveToPoint(context, x+width, y+radius/2);
    CGContextAddArcToPoint(context, x+width, y+height, x+width-radius/2, y+height, radius);
    CGContextAddArcToPoint(context, x, y+height, x, y+height-radius/2, radius);
    CGContextAddArcToPoint(context, x, y, x+radius/2, y, radius);
    CGContextAddArcToPoint(context, x+width, y, x+width, y+radius/2, radius);
    CGContextDrawPath(context, kCGPathFillStroke);
    imageView.image = UIGraphicsGetImageFromCurrentImageContext();
    
    return imageView;
}


#pragma mark - event response
#pragma mark - setter and getter
- (void)setModel:(RecentTainingDataModel *)model
{
    _model = model;
//    self.userIcon.image = IMAGE_NAMED(model.userImage);
//    self.userNameLabel.text = model.userName;
//    self.titleLabel.text = model.titleStr;
//    self.titleDetailLabel.text = model.date;
}

- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.textAlignment = NSTextAlignmentLeft;
        _titleLabel.font = SYSTEMFONT(18);
        _titleLabel.text = @"Recent Training Data";
        _timeLabel.backgroundColor = KRedColor;
        _titleLabel.textColor = KWhiteColor;
    }
    return _titleLabel;
}

- (UILabel *)dataLabel
{
    if (!_dataLabel) {
        
        _dataLabel = [[UILabel alloc] init];
        _dataLabel.textAlignment = NSTextAlignmentLeft;
        _dataLabel.font = SYSTEMFONT(16);
        _dataLabel.text = @"2017-03-20 11:23-12:23";
        _dataLabel.textColor = underLineColor;
    }
    return _dataLabel;
}

- (UILabel *)timeLabel
{
    if (!_timeLabel) {
        _timeLabel = [self setLabelWithImage:@"time.png" text:@"    01:01:01"];
    }
    return _timeLabel;
}

- (UILabel *)heartLabel
{
    if (!_heartLabel) {
        _heartLabel = [self setLabelWithImage:@"heartrate.png" text:@"  100 bpm"];
    }
    return _heartLabel;
}

- (UILabel *)unkownLabel
{
    if (!_unkownLabel) {
        _unkownLabel = [self setLabelWithImage:@"HRPs.png" text:@"  100 kcal"];
    }
    return _unkownLabel;
}

- (UILabel *)cocahLabel
{
    if (!_cocahLabel) {
        _cocahLabel = [self setLabelWithImage:@"fpc30j.png" text:@"  178"];

    }
    return _cocahLabel;
}

- (UIImageView *)colorBarIcon
{
    if (!_colorBarIcon) {
        _colorBarIcon = [[UIImageView alloc] init];
        _colorBarIcon.image = IMAGE_NAMED(@"fpc5l.png");
        
        UIImageView *circle = [self CreateImageViewWithFrame:CGRectMake(0,0 , circleWidth, circleWidth) andBackground:KWhiteColor.CGColor andRadius:circleWidth/2];
        circle.centerX = KScreenWidth/2+circleWidth;
      
        CATextLayer *tainingLayer = [self setTextLayerWithString:@"150" font:BOLDSYSTEMFONT(40) textColor:RGB(243, 58, 105)];
        tainingLayer.frame = CGRectMake(0, circleWidth/2 - 30, circleWidth, 38);
        [circle.layer addSublayer:tainingLayer];
        
        CATextLayer *bpmLayer = [self setTextLayerWithString:@"bpm" font:SYSTEMFONT(16) textColor:RGB(244, 82, 124)];
        bpmLayer.frame = CGRectMake(0, circleWidth/4*3 - 15, circleWidth, 30);
        [circle.layer addSublayer:bpmLayer];
        
        [_colorBarIcon addSubview:circle];
    }
    return _colorBarIcon;
}

- (UIImageView *)maxHeartRateIcon
{
    if (!_maxHeartRateIcon) {
        _maxHeartRateIcon= [[UIImageView alloc] init];
        _maxHeartRateIcon.image = IMAGE_NAMED(@"fpc5h.png");
        UILabel *maxHeartRateLabel = [[UILabel alloc] init];
        maxHeartRateLabel.frame = CGRectMake(0, 0, 50, 40);
        maxHeartRateLabel.backgroundColor = KClearColor;
        maxHeartRateLabel.textColor = KWhiteColor;
        maxHeartRateLabel.text = @"MAX";
        maxHeartRateLabel.textAlignment = NSTextAlignmentCenter;
        maxHeartRateLabel.font = BOLDSYSTEMFONT(11);
        [_maxHeartRateIcon insertSubview:maxHeartRateLabel atIndex:0];
    }
    return _maxHeartRateIcon;
}

- (UIImageView *)separateLineIcon1
{
    if (!_separateLineIcon1) {
        
        _separateLineIcon1 = [[UIImageView alloc] init];
        _separateLineIcon1.image = IMAGE_NAMED(@"vSeperateLine.png");
    }
    return _separateLineIcon1;
}

- (UIImageView *)separateLineIcon2
{
    if (!_separateLineIcon2) {
        
        _separateLineIcon2 = [[UIImageView alloc] init];
        _separateLineIcon2.image = IMAGE_NAMED(@"vSeperateLine.png");
    }
    return _separateLineIcon2;
}
- (CAShapeLayer *)maskLayer
{
    if (!_maskLayer) {
        
        _maskLayer = [CAShapeLayer layer];
        _maskLayer.fillColor = RGB(90, 76, 92).CGColor;
        
        UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(0,0,KScreenWidth - 20,maskViewHeight)];
        _maskLayer.path = path.CGPath;
    }
    return _maskLayer;
}

- (CAShapeLayer *)lineLayer
{
    if (!_lineLayer) {
        
        _lineLayer = [CAShapeLayer layer];
        _lineLayer.fillColor = underLineColor.CGColor;
        
        UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(lineToScreenSideGap,lineToScreenTopGap,KScreenWidth - 2*lineToScreenSideGap -20, underLineHeight)];
        _lineLayer.path = path.CGPath;
    }
    return _lineLayer;
}


@end
