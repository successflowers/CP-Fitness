//
//  PieViewControls.m
//  CP-Fitness
//
//  Created by 张敬 on 2017/11/4.
//  Copyright © 2017年 Jing Zhang. All rights reserved.
//

#import "PieViewControls.h"
#import "PieView.h"

#define pieCicleWidth 60.f
#define pieCicleHeight 34.f

@interface PieViewControls ()

@property (nonatomic, retain) CAShapeLayer *fatherLayer;
@property (nonatomic, retain) PieView *pieView;

@property (nonatomic, retain) CAShapeLayer *circle_1;
@property (nonatomic, retain) CAShapeLayer *circle_2;
@property (nonatomic, retain) CAShapeLayer *circle_3;

@property (nonatomic, assign) CGPoint piePoint;

@property (nonatomic, retain) NSArray *percentArray;
@property (nonatomic, retain) NSArray *colorArray;
@property (nonatomic, retain) NSArray *textArray_1;
@property (nonatomic, retain) NSArray *textArray_2;

@end

@implementation PieViewControls

- (instancetype) initWithPercentArray:(NSArray *)array
{
    self = [super init];
    if (self) {
        
        self.percentArray = array;

        [self initParam];
        [self initInterface];
    }
    return self;
}

#pragma mark - initParam
- (void)initParam
{
    self.piePoint = CGPointMake(KScreenWidth/2.f-5,0);
    self.colorArray = @[pieGrayColor,pieBlueColor,pieGreenColor,pieYellowColor,pieRedColor];
    self.textArray_1 = @[@"Warm_up",@"Recovery runs",@"Aeroble zone",@"Anaerobic zone",@"VO2 MAX"];
    self.textArray_2 = @[@"<60%(14min)",@"60%-70%(31min)",@"70%-80%(33min)",@"80%-90%(20min)",@"90%-100%(0min)"];
}

#pragma mark - initInterface
- (void)initInterface
{
    self.backgroundColor = pieBackColor;
    [self.layer setMasksToBounds:YES];
    [self.layer setCornerRadius:4.0]; //设置矩形四个圆角半径

    [self.layer addSublayer:self.circle_1];
    [self.layer addSublayer:self.circle_2];
    [self.layer addSublayer:self.circle_3];

    [self addSubview:self.pieView];
    [self addMarkLabel];
    [self setMaskLayer];
}

#pragma mark - autolayout
#pragma mark - event response
#pragma mark - other methods
- (CAShapeLayer *)setCircle
{
    CAShapeLayer *circle = [CAShapeLayer layer];
    circle.strokeColor = pieGrayColor.CGColor;
    circle.fillColor = KClearColor.CGColor;
    circle.lineWidth = line_width;
    return circle;
}

- (void)addMarkLabel
{
    for (int i = 0; i<self.percentArray.count; i++) {
        
        CGRect rect = CGRectMake(30,pieCicleHeight *9+30*i, 45, 16);
        
        CAShapeLayer *layer = [CAShapeLayer layer];
        UIColor *color = self.colorArray[i];
        layer.fillColor = color.CGColor;
        
        UIBezierPath *path = [UIBezierPath bezierPathWithRect:rect];
        layer.path = path.CGPath;
        [self.layer addSublayer:layer];
        
        UILabel *label_1 = [[UILabel alloc] init];
        label_1.frame = CGRectMake(rect.origin.x+65, rect.origin.y, 150, 16);
        label_1.text = self.textArray_1[i];
        label_1.textColor = KWhiteColor;
        label_1.font = SYSTEMFONT(15);
        [self addSubview:label_1];
        
        UILabel *label_2 = [[UILabel alloc] init];
        label_2.frame = CGRectMake(rect.origin.x+200, rect.origin.y, 150, 16);
        label_2.text = self.textArray_2[i];
        label_2.textColor = pieWordColor;
        label_2.font = SYSTEMFONT(15);
        [self addSubview:label_2];
    }
}
- (void)setMaskLayer
{
    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    maskLayer.fillColor = [UIColor colorWithRed:50/255.0 green:43/255.0 blue:51/255.0 alpha:0.8].CGColor;
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(self.piePoint.x-pieCicleWidth+50, self.piePoint.y+pieCicleHeight *7, pieCicleWidth *2, pieCicleHeight *2)];
    maskLayer.path = maskPath.CGPath;
   // [self.layer addSublayer:maskLayer];
    
    // 渐变图层
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.frame  = CGRectMake(self.piePoint.x-pieCicleWidth, self.piePoint.y+pieCicleHeight *7, pieCicleWidth *2, pieCicleHeight *2);
    
    
    // 设置颜色
    gradientLayer.colors = @[(id)[KClearColor colorWithAlphaComponent:0.0f].CGColor, (id)[pieBackColor colorWithAlphaComponent:0.9f].CGColor,
                             (id)[pieBackColor colorWithAlphaComponent:1.0f].CGColor];
    gradientLayer.locations = @[[NSNumber numberWithFloat:0.3f],
                                [NSNumber numberWithFloat:0.6f],
                                [NSNumber numberWithFloat:1.0f]];
   // [self.layer addSublayer:gradientLayer];
}

#pragma mark - setter and getter
- (PieView *)pieView
{
    if (!_pieView) {
        _pieView = [[PieView alloc] initWithPercentArray:self.percentArray];
        _pieView.frame = CGRectMake(0, pieCicleHeight*2, KScreenWidth-10 , KScreenWidth);
    }
    return _pieView;
}

- (CAShapeLayer *)circle_1
{
    if (!_circle_1) {
        
        _circle_1 = [self setCircle];
        
        UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(self.piePoint.x-pieCicleWidth*2.5, self.piePoint.y+pieCicleHeight, pieCicleWidth *5, pieCicleHeight *5)];
        _circle_1.path = path.CGPath;
    }
    return _circle_1;
}

- (CAShapeLayer *)circle_2
{
    if (!_circle_2) {
        
        _circle_2 = [self setCircle];
        
        UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(self.piePoint.x-pieCicleWidth*1.5, self.piePoint.y+pieCicleHeight*4, pieCicleWidth *3, pieCicleHeight *3)];
        _circle_2.path = path.CGPath;
        
    }
    return _circle_2;
}

- (CAShapeLayer *)circle_3
{
    if (!_circle_3) {
        
        _circle_3 = [self setCircle];
        
        UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(self.piePoint.x-pieCicleWidth, self.piePoint.y+pieCicleHeight *6, pieCicleWidth *2, pieCicleHeight *2)];
        _circle_3.path = path.CGPath;
    }
    return _circle_3;
}

@end
